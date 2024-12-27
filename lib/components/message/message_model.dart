import '/components/cards/banner_card/banner_card_widget.dart';
import '/components/cards/detail_card/detail_card_widget.dart';
import '/components/cards/email_card/email_card_widget.dart';
import '/components/cards/single_action_card/single_action_card_widget.dart';
import '/components/cards/text_message/text_message_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'message_widget.dart' show MessageWidget;
import 'package:flutter/material.dart';

class MessageModel extends FlutterFlowModel<MessageWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for TextMessage component.
  late TextMessageModel textMessageModel;
  // Model for BannerCard component.
  late BannerCardModel bannerCardModel;
  // Model for DetailCard component.
  late DetailCardModel detailCardModel;
  // Model for SingleActionCard component.
  late SingleActionCardModel singleActionCardModel;
  // Model for EmailCard component.
  late EmailCardModel emailCardModel;

  @override
  void initState(BuildContext context) {
    textMessageModel = createModel(context, () => TextMessageModel());
    bannerCardModel = createModel(context, () => BannerCardModel());
    detailCardModel = createModel(context, () => DetailCardModel());
    singleActionCardModel = createModel(context, () => SingleActionCardModel());
    emailCardModel = createModel(context, () => EmailCardModel());
  }

  @override
  void dispose() {
    textMessageModel.dispose();
    bannerCardModel.dispose();
    detailCardModel.dispose();
    singleActionCardModel.dispose();
    emailCardModel.dispose();
  }
}
