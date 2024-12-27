import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'detail_card_model.dart';
export 'detail_card_model.dart';

class DetailCardWidget extends StatefulWidget {
  const DetailCardWidget({
    super.key,
    required this.message,
  });

  final MessageStruct? message;

  @override
  State<DetailCardWidget> createState() => _DetailCardWidgetState();
}

class _DetailCardWidgetState extends State<DetailCardWidget> {
  late DetailCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetailCardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 300.0,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (getJsonField(
                        functions.jsonDecode(widget.message!.dataJson),
                        r'''$.title''',
                      ) !=
                      null)
                    Text(
                      getJsonField(
                        functions.jsonDecode(widget.message!.dataJson),
                        r'''$.title''',
                      ).toString(),
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                            fontFamily: 'Inter Tight',
                            letterSpacing: 0.0,
                          ),
                    ),
                  if (getJsonField(
                        functions.jsonDecode(widget.message!.dataJson),
                        r'''$.subtitle''',
                      ) !=
                      null)
                    Text(
                      getJsonField(
                        functions.jsonDecode(widget.message!.dataJson),
                        r'''$.subtitle''',
                      ).toString(),
                      style: FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'Inter',
                            letterSpacing: 0.0,
                          ),
                    ),
                  if (getJsonField(
                        functions.jsonDecode(widget.message!.dataJson),
                        r'''$.description''',
                      ) !=
                      null)
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                      child: AutoSizeText(
                        getJsonField(
                          functions.jsonDecode(widget.message!.dataJson),
                          r'''$.description''',
                        ).toString(),
                        maxLines: 7,
                        minFontSize: 8.0,
                        style:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Inter',
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                ),
                      ),
                    ),
                ],
              ),
            ),
          ].divide(const SizedBox(width: 15.0)),
        ),
      ),
    );
  }
}
