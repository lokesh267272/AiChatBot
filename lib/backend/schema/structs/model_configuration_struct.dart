// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ModelConfigurationStruct extends FFFirebaseStruct {
  ModelConfigurationStruct({
    String? geminiModelName,
    String? systemInstructions,
    String? agentName,
    String? agentProfilePicture,
    bool? imageUploadSupported,
    double? temperature,
    int? maxOutputTokens,
    int? topK,
    double? topP,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _geminiModelName = geminiModelName,
        _systemInstructions = systemInstructions,
        _agentName = agentName,
        _agentProfilePicture = agentProfilePicture,
        _imageUploadSupported = imageUploadSupported,
        _temperature = temperature,
        _maxOutputTokens = maxOutputTokens,
        _topK = topK,
        _topP = topP,
        super(firestoreUtilData);

  // "geminiModelName" field.
  String? _geminiModelName;
  String get geminiModelName => _geminiModelName ?? 'gemini-1.5-flash';
  set geminiModelName(String? val) => _geminiModelName = val;

  bool hasGeminiModelName() => _geminiModelName != null;

  // "systemInstructions" field.
  String? _systemInstructions;
  String get systemInstructions => _systemInstructions ?? '';
  set systemInstructions(String? val) => _systemInstructions = val;

  bool hasSystemInstructions() => _systemInstructions != null;

  // "agentName" field.
  String? _agentName;
  String get agentName => _agentName ?? '';
  set agentName(String? val) => _agentName = val;

  bool hasAgentName() => _agentName != null;

  // "agentProfilePicture" field.
  String? _agentProfilePicture;
  String get agentProfilePicture => _agentProfilePicture ?? '';
  set agentProfilePicture(String? val) => _agentProfilePicture = val;

  bool hasAgentProfilePicture() => _agentProfilePicture != null;

  // "imageUploadSupported" field.
  bool? _imageUploadSupported;
  bool get imageUploadSupported => _imageUploadSupported ?? false;
  set imageUploadSupported(bool? val) => _imageUploadSupported = val;

  bool hasImageUploadSupported() => _imageUploadSupported != null;

  // "temperature" field.
  double? _temperature;
  double get temperature => _temperature ?? 0.7;
  set temperature(double? val) => _temperature = val;

  void incrementTemperature(double amount) =>
      temperature = temperature + amount;

  bool hasTemperature() => _temperature != null;

  // "maxOutputTokens" field.
  int? _maxOutputTokens;
  int get maxOutputTokens => _maxOutputTokens ?? 500;
  set maxOutputTokens(int? val) => _maxOutputTokens = val;

  void incrementMaxOutputTokens(int amount) =>
      maxOutputTokens = maxOutputTokens + amount;

  bool hasMaxOutputTokens() => _maxOutputTokens != null;

  // "topK" field.
  int? _topK;
  int get topK => _topK ?? 30;
  set topK(int? val) => _topK = val;

  void incrementTopK(int amount) => topK = topK + amount;

  bool hasTopK() => _topK != null;

  // "topP" field.
  double? _topP;
  double get topP => _topP ?? 0.95;
  set topP(double? val) => _topP = val;

  void incrementTopP(double amount) => topP = topP + amount;

  bool hasTopP() => _topP != null;

  static ModelConfigurationStruct fromMap(Map<String, dynamic> data) =>
      ModelConfigurationStruct(
        geminiModelName: data['geminiModelName'] as String?,
        systemInstructions: data['systemInstructions'] as String?,
        agentName: data['agentName'] as String?,
        agentProfilePicture: data['agentProfilePicture'] as String?,
        imageUploadSupported: data['imageUploadSupported'] as bool?,
        temperature: castToType<double>(data['temperature']),
        maxOutputTokens: castToType<int>(data['maxOutputTokens']),
        topK: castToType<int>(data['topK']),
        topP: castToType<double>(data['topP']),
      );

  static ModelConfigurationStruct? maybeFromMap(dynamic data) => data is Map
      ? ModelConfigurationStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'geminiModelName': _geminiModelName,
        'systemInstructions': _systemInstructions,
        'agentName': _agentName,
        'agentProfilePicture': _agentProfilePicture,
        'imageUploadSupported': _imageUploadSupported,
        'temperature': _temperature,
        'maxOutputTokens': _maxOutputTokens,
        'topK': _topK,
        'topP': _topP,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'geminiModelName': serializeParam(
          _geminiModelName,
          ParamType.String,
        ),
        'systemInstructions': serializeParam(
          _systemInstructions,
          ParamType.String,
        ),
        'agentName': serializeParam(
          _agentName,
          ParamType.String,
        ),
        'agentProfilePicture': serializeParam(
          _agentProfilePicture,
          ParamType.String,
        ),
        'imageUploadSupported': serializeParam(
          _imageUploadSupported,
          ParamType.bool,
        ),
        'temperature': serializeParam(
          _temperature,
          ParamType.double,
        ),
        'maxOutputTokens': serializeParam(
          _maxOutputTokens,
          ParamType.int,
        ),
        'topK': serializeParam(
          _topK,
          ParamType.int,
        ),
        'topP': serializeParam(
          _topP,
          ParamType.double,
        ),
      }.withoutNulls;

  static ModelConfigurationStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ModelConfigurationStruct(
        geminiModelName: deserializeParam(
          data['geminiModelName'],
          ParamType.String,
          false,
        ),
        systemInstructions: deserializeParam(
          data['systemInstructions'],
          ParamType.String,
          false,
        ),
        agentName: deserializeParam(
          data['agentName'],
          ParamType.String,
          false,
        ),
        agentProfilePicture: deserializeParam(
          data['agentProfilePicture'],
          ParamType.String,
          false,
        ),
        imageUploadSupported: deserializeParam(
          data['imageUploadSupported'],
          ParamType.bool,
          false,
        ),
        temperature: deserializeParam(
          data['temperature'],
          ParamType.double,
          false,
        ),
        maxOutputTokens: deserializeParam(
          data['maxOutputTokens'],
          ParamType.int,
          false,
        ),
        topK: deserializeParam(
          data['topK'],
          ParamType.int,
          false,
        ),
        topP: deserializeParam(
          data['topP'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'ModelConfigurationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ModelConfigurationStruct &&
        geminiModelName == other.geminiModelName &&
        systemInstructions == other.systemInstructions &&
        agentName == other.agentName &&
        agentProfilePicture == other.agentProfilePicture &&
        imageUploadSupported == other.imageUploadSupported &&
        temperature == other.temperature &&
        maxOutputTokens == other.maxOutputTokens &&
        topK == other.topK &&
        topP == other.topP;
  }

  @override
  int get hashCode => const ListEquality().hash([
        geminiModelName,
        systemInstructions,
        agentName,
        agentProfilePicture,
        imageUploadSupported,
        temperature,
        maxOutputTokens,
        topK,
        topP
      ]);
}

ModelConfigurationStruct createModelConfigurationStruct({
  String? geminiModelName,
  String? systemInstructions,
  String? agentName,
  String? agentProfilePicture,
  bool? imageUploadSupported,
  double? temperature,
  int? maxOutputTokens,
  int? topK,
  double? topP,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ModelConfigurationStruct(
      geminiModelName: geminiModelName,
      systemInstructions: systemInstructions,
      agentName: agentName,
      agentProfilePicture: agentProfilePicture,
      imageUploadSupported: imageUploadSupported,
      temperature: temperature,
      maxOutputTokens: maxOutputTokens,
      topK: topK,
      topP: topP,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ModelConfigurationStruct? updateModelConfigurationStruct(
  ModelConfigurationStruct? modelConfiguration, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    modelConfiguration
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addModelConfigurationStructData(
  Map<String, dynamic> firestoreData,
  ModelConfigurationStruct? modelConfiguration,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (modelConfiguration == null) {
    return;
  }
  if (modelConfiguration.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && modelConfiguration.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final modelConfigurationData =
      getModelConfigurationFirestoreData(modelConfiguration, forFieldValue);
  final nestedData =
      modelConfigurationData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      modelConfiguration.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getModelConfigurationFirestoreData(
  ModelConfigurationStruct? modelConfiguration, [
  bool forFieldValue = false,
]) {
  if (modelConfiguration == null) {
    return {};
  }
  final firestoreData = mapToFirestore(modelConfiguration.toMap());

  // Add any Firestore field values
  modelConfiguration.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getModelConfigurationListFirestoreData(
  List<ModelConfigurationStruct>? modelConfigurations,
) =>
    modelConfigurations
        ?.map((e) => getModelConfigurationFirestoreData(e, true))
        .toList() ??
    [];
