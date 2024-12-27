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

import 'dart:convert';

Future<MessageStruct> parseGeminiResponse(String response) async {
  // Parse the response as JSON and create the appropriate structs from it and return the Message type. Here's an example input: { "type": "TextMessage", "data": { "TextMessage": { "text": "I do not have access to your personal information, including your name. To help me understand your needs better, please tell me your name or what information you'd like to know." } } }

  // Parse the response as JSON
  Map<String, dynamic> jsonResponse = json.decode(response);

  // Extract the type of message
  String messageType = jsonResponse['type'];

  // Extract the data for the message
  String messageData = json.encode(jsonResponse[messageType]);

  return MessageStruct(
      role: FFAppConstants.RoleAgent,
      createdAt: DateTime.now(),
      type: messageType,
      dataJson: messageData);
}
