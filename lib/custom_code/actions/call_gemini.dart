// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_vertexai/firebase_vertexai.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<String?> callGemini(
    String userMessage,
    List<String>? imagePaths,
    ModelConfigurationStruct modelConfiguration,
    List<String>? audioPaths,
    dynamic responseSchemaDefinition) async {
  // Use the ChatManager singleton to send the message
  final response = await ChatManager().sendMessage(userMessage, imagePaths,
      modelConfiguration, audioPaths, responseSchemaDefinition);
  print(response);
  return response;
}

class ChatManager {
  static final ChatManager _instance = ChatManager._internal();
  ChatManager._internal();
  factory ChatManager() => _instance;

  ChatSession? chat;
  ModelConfigurationStruct? _currentConfig;

  Future<void> initializeChat(
      ModelConfigurationStruct config, dynamic responseSchemaDefinition) async {
    if (chat == null || _currentConfig != config) {
      _currentConfig = config;

      final vertexAI =
          FirebaseVertexAI.instanceFor(auth: FirebaseAuth.instance);

      final model = vertexAI.generativeModel(
        model: config.geminiModelName,
        systemInstruction: Content.system(config.systemInstructions),
        generationConfig: responseSchemaDefinition != null
            ? GenerationConfig(
                temperature: config.temperature,
                topP: config.topP,
                topK: config.topK,
                maxOutputTokens: config.maxOutputTokens,
                responseMimeType: 'application/json',
                responseSchema: convertJsonToSchema(responseSchemaDefinition),
              )
            : GenerationConfig(
                temperature: config.temperature,
                topP: config.topP,
                topK: config.topK,
                maxOutputTokens: config.maxOutputTokens,
              ),
      );

      chat = model.startChat();
    }
  }

  Future<String?> sendMessage(
    String userMessage,
    List<String>? imagePaths,
    ModelConfigurationStruct config,
    List<String>? audioPaths,
    dynamic responseSchemaDefinition,
  ) async {
    await initializeChat(config, responseSchemaDefinition);

    final Content prompt;

    final userTextPart = TextPart(userMessage);
    final List<Part> parts = [userTextPart];

    // Add image parts if present
    if (imagePaths != null && imagePaths.isNotEmpty) {
      final imageParts = imagePaths.map((imagePath) {
        final mimeType = getMimeTypeFromUrl(imagePath);
        return FileData(mimeType, transformToGsUrl(imagePath));
      }).toList();

      parts.addAll(imageParts);
    }

    // Add audio parts if present
    if (audioPaths != null && audioPaths.isNotEmpty) {
      final audioParts = audioPaths.map((audioPath) {
        final mimeType = getMimeTypeFromUrl(audioPath);
        return FileData(mimeType, transformToGsUrl(audioPath));
      }).toList();

      parts.addAll(audioParts);
    }

    // Build the prompt with all parts
    if (parts.length == 1) {
      // Only the user message is present
      prompt = Content.text(userMessage);
    } else {
      // Multiple parts (text, images, audio)
      prompt = Content.multi(parts);
    }

    final response = await chat!.sendMessage(prompt);
    return response.text;
  }
}

String transformToGsUrl(String publicUrl) {
  // Parse the original public URL
  Uri uri = Uri.parse(publicUrl);

  // Extract the bucket name from the URL path (it follows the '/v0/b/' segment)
  String bucketName = uri.pathSegments[2];

  // Extract the file path (after the '/o/' segment)
  String filePath = uri.pathSegments
      .sublist(
          4) // Start from index 4 to skip 'v0', 'b', 'bucket-name', and 'o'
      .join('/')
      .replaceAll('%2F', '/');

  // Remove any query parameters from the file path
  filePath = filePath.split('?').first;

  // Rebuild the URL in the gs:// format
  String gsUrl = 'gs://$bucketName/$filePath';

  print(gsUrl);
  return gsUrl;
}

String getMimeTypeFromUrl(String imagePath) {
  // Parse the file extension from the URL
  String extension = Uri.parse(imagePath).path.split('.').last;

  // Map the file extension to the correct MIME type
  switch (extension.toLowerCase()) {
    case 'png':
      return 'image/png';
    case 'jpg':
    case 'jpeg':
      return 'image/jpeg';
    case 'gif':
      return 'image/gif';
    case 'mp3':
      return 'audio/mp3';
    case 'wav':
      return 'audio/wav';
    case 'webm':
      return 'audio/webm';
    case 'm4a':
      return 'audio/m4a';
    default:
      return 'application/octet-stream'; // Default for unknown types
  }
}

Schema convertJsonToSchema(Map<String, dynamic> jsonMap) {
  // Helper function to recursively parse properties
  Schema _parseProperties(Map<String, dynamic> properties) {
    Map<String, Schema> schemaProperties = {};

    properties.forEach((key, value) {
      if (value is Map<String, dynamic>) {
        if (value['type'] == 'string' && value.containsKey('enum')) {
          // Handle enum strings
          schemaProperties[key] = Schema.enumString(
            enumValues: List<String>.from(value['enum']),
            description: value['description'],
            nullable: value['nullable'],
          );
        } else if (value['type'] == 'object' &&
            value.containsKey('properties')) {
          // Handle nested objects
          var nestedSchema =
              _parseProperties(value['properties'] as Map<String, dynamic>);

          List<String>? optionalProps;
          if (value.containsKey('required')) {
            var required = List<String>.from(value['required']);
            optionalProps = nestedSchema.properties?.keys
                .where((key) => !required.contains(key))
                .toList();
          }

          schemaProperties[key] = Schema.object(
            properties: nestedSchema.properties ?? {},
            description: value['description'],
            nullable: value['nullable'],
            optionalProperties: optionalProps,
          );
        } else if (value['type'] == 'string') {
          // Handle regular string fields
          schemaProperties[key] = Schema.string(
            description: value['description'],
            nullable: value['nullable'],
            format: value['format'],
          );
        } else if (value['type'] == 'integer') {
          // Handle integer fields
          schemaProperties[key] = Schema.integer(
            description: value['description'],
            nullable: value['nullable'],
            format: value['format'],
          );
        } else if (value['type'] == 'number') {
          // Handle number fields
          schemaProperties[key] = Schema.number(
            description: value['description'],
            nullable: value['nullable'],
            format: value['format'],
          );
        } else if (value['type'] == 'boolean') {
          // Handle boolean fields
          schemaProperties[key] = Schema.boolean(
            description: value['description'],
            nullable: value['nullable'],
          );
        } else if (value['type'] == 'array') {
          // Handle array fields
          var itemSchema = value['items'] is Map<String, dynamic>
              ? _parseProperties({'item': value['items']})
              : Schema.string();
          schemaProperties[key] = Schema.array(
            items: itemSchema.properties?['item'] ?? Schema.string(),
            description: value['description'],
            nullable: value['nullable'],
          );
        }
      }
    });

    return Schema.object(properties: schemaProperties);
  }

  // Handle top-level required fields
  List<String>? optionalProperties;
  if (jsonMap.containsKey('required')) {
    var required = List<String>.from(jsonMap['required']);
    var allProperties = jsonMap['properties'].keys as Iterable<String>;
    optionalProperties =
        allProperties.where((key) => !required.contains(key)).toList();
  }

  // Parse the properties and create the final schema
  var properties =
      _parseProperties(jsonMap['properties'] as Map<String, dynamic>)
          .properties;

  return Schema.object(
    properties: properties ?? {},
    optionalProperties: optionalProperties,
    description: jsonMap['description'],
    nullable: jsonMap['nullable'],
  );
}
