import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/audio_chip/audio_chip_widget.dart';
import '/components/message/message_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'gemini_chat_widget.dart' show GeminiChatWidget;
import 'package:flutter/material.dart';
import 'package:record/record.dart';

class GeminiChatModel extends FlutterFlowModel<GeminiChatWidget> {
  ///  Local state fields for this component.

  List<MessageStruct> messages = [];
  void addToMessages(MessageStruct item) => messages.add(item);
  void removeFromMessages(MessageStruct item) => messages.remove(item);
  void removeAtIndexFromMessages(int index) => messages.removeAt(index);
  void insertAtIndexInMessages(int index, MessageStruct item) =>
      messages.insert(index, item);
  void updateMessagesAtIndex(int index, Function(MessageStruct) updateFn) =>
      messages[index] = updateFn(messages[index]);

  String? prompt;

  List<String> uploadedImagePaths = [];
  void addToUploadedImagePaths(String item) => uploadedImagePaths.add(item);
  void removeFromUploadedImagePaths(String item) =>
      uploadedImagePaths.remove(item);
  void removeAtIndexFromUploadedImagePaths(int index) =>
      uploadedImagePaths.removeAt(index);
  void insertAtIndexInUploadedImagePaths(int index, String item) =>
      uploadedImagePaths.insert(index, item);
  void updateUploadedImagePathsAtIndex(int index, Function(String) updateFn) =>
      uploadedImagePaths[index] = updateFn(uploadedImagePaths[index]);

  bool isRecording = false;

  List<String> uploadedAudioPaths = [];
  void addToUploadedAudioPaths(String item) => uploadedAudioPaths.add(item);
  void removeFromUploadedAudioPaths(String item) =>
      uploadedAudioPaths.remove(item);
  void removeAtIndexFromUploadedAudioPaths(int index) =>
      uploadedAudioPaths.removeAt(index);
  void insertAtIndexInUploadedAudioPaths(int index, String item) =>
      uploadedAudioPaths.insert(index, item);
  void updateUploadedAudioPathsAtIndex(int index, Function(String) updateFn) =>
      uploadedAudioPaths[index] = updateFn(uploadedAudioPaths[index]);

  ///  State fields for stateful widgets in this component.

  // Models for Message dynamic component.
  late FlutterFlowDynamicModels<MessageModel> messageModels;
  // Stores action output result for [Custom Action - callGemini] action in Message widget.
  String? geminiResponseInCallback;
  // Stores action output result for [Custom Action - parseGeminiResponse] action in Message widget.
  MessageStruct? geminiMessageInCallback;
  // Models for AudioChip dynamic component.
  late FlutterFlowDynamicModels<AudioChipModel> audioChipModels;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  AudioRecorder? audioRecorder;
  String? recordedUserAudio;
  FFUploadedFile recordedFileBytes =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  // Stores action output result for [Custom Action - renameAudio] action in StopRecording widget.
  FFUploadedFile? renamedAudioFile;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Custom Action - callGemini] action in IconButton widget.
  String? geminiResponse;
  // Stores action output result for [Custom Action - parseGeminiResponse] action in IconButton widget.
  MessageStruct? geminiMessage;

  @override
  void initState(BuildContext context) {
    messageModels = FlutterFlowDynamicModels(() => MessageModel());
    audioChipModels = FlutterFlowDynamicModels(() => AudioChipModel());
  }

  @override
  void dispose() {
    messageModels.dispose();
    audioChipModels.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
