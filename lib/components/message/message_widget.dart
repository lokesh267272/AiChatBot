import '/backend/schema/structs/index.dart';
import '/components/cards/banner_card/banner_card_widget.dart';
import '/components/cards/detail_card/detail_card_widget.dart';
import '/components/cards/email_card/email_card_widget.dart';
import '/components/cards/single_action_card/single_action_card_widget.dart';
import '/components/cards/text_message/text_message_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'message_model.dart';
export 'message_model.dart';

class MessageWidget extends StatefulWidget {
  const MessageWidget({
    super.key,
    required this.message,
    required this.userProfile,
    required this.modelConfiguration,
    required this.callback,
  });

  final MessageStruct? message;
  final UserProfileStruct? userProfile;
  final ModelConfigurationStruct? modelConfiguration;
  final Future Function(String message)? callback;

  @override
  State<MessageWidget> createState() => _MessageWidgetState();
}

class _MessageWidgetState extends State<MessageWidget> {
  late MessageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MessageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (widget.message?.type == 'TextMessage') {
          return wrapWithModel(
            model: _model.textMessageModel,
            updateCallback: () => safeSetState(() {}),
            child: TextMessageWidget(
              message: widget.message!,
              modelConfiguration: widget.modelConfiguration!,
              userProfile: widget.userProfile!,
            ),
          );
        } else if (widget.message?.type == 'BannerCard') {
          return wrapWithModel(
            model: _model.bannerCardModel,
            updateCallback: () => safeSetState(() {}),
            child: BannerCardWidget(
              message: widget.message!,
              callback: (message) async {
                // Execute callback
                await widget.callback?.call(
                  message,
                );
              },
            ),
          );
        } else if (widget.message?.type == 'DetailCard') {
          return wrapWithModel(
            model: _model.detailCardModel,
            updateCallback: () => safeSetState(() {}),
            child: DetailCardWidget(
              message: widget.message!,
            ),
          );
        } else if (widget.message?.type == 'SingleActionCard') {
          return wrapWithModel(
            model: _model.singleActionCardModel,
            updateCallback: () => safeSetState(() {}),
            child: SingleActionCardWidget(
              message: widget.message!,
            ),
          );
        } else if (widget.message?.type == 'EmailCard') {
          return wrapWithModel(
            model: _model.emailCardModel,
            updateCallback: () => safeSetState(() {}),
            child: EmailCardWidget(
              message: widget.message!,
            ),
          );
        } else {
          return Container(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
          );
        }
      },
    );
  }
}
