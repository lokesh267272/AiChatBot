import '/components/gemini_chat/gemini_chat_widget.dart';
import '/components/template_info/template_info_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chat_page_widget.dart' show ChatPageWidget;
import 'package:flutter/material.dart';

class ChatPageModel extends FlutterFlowModel<ChatPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for TemplateInfo component.
  late TemplateInfoModel templateInfoModel1;
  // Model for GeminiChat component.
  late GeminiChatModel geminiChatModel;
  // Model for TemplateInfo component.
  late TemplateInfoModel templateInfoModel2;

  @override
  void initState(BuildContext context) {
    templateInfoModel1 = createModel(context, () => TemplateInfoModel());
    geminiChatModel = createModel(context, () => GeminiChatModel());
    templateInfoModel2 = createModel(context, () => TemplateInfoModel());
  }

  @override
  void dispose() {
    templateInfoModel1.dispose();
    geminiChatModel.dispose();
    templateInfoModel2.dispose();
  }
}
