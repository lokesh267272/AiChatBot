import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'banner_card_model.dart';
export 'banner_card_model.dart';

class BannerCardWidget extends StatefulWidget {
  const BannerCardWidget({
    super.key,
    required this.message,
    required this.callback,
  });

  final MessageStruct? message;
  final Future Function(String message)? callback;

  @override
  State<BannerCardWidget> createState() => _BannerCardWidgetState();
}

class _BannerCardWidgetState extends State<BannerCardWidget> {
  late BannerCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BannerCardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 400.0,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.auto_awesome,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (getJsonField(
                                  functions
                                      .jsonDecode(widget.message!.dataJson),
                                  r'''$.label''',
                                ) !=
                                null)
                              Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).secondary,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: AutoSizeText(
                                    getJsonField(
                                      functions.jsonDecode(
                                          widget.message!.dataJson),
                                      r'''$.label''',
                                    ).toString(),
                                    textAlign: TextAlign.start,
                                    maxLines: 5,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          fontSize: 6.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ),
                            if (getJsonField(
                                  functions
                                      .jsonDecode(widget.message!.dataJson),
                                  r'''$.description''',
                                ) !=
                                null)
                              AutoSizeText(
                                getJsonField(
                                  functions
                                      .jsonDecode(widget.message!.dataJson),
                                  r'''$.description''',
                                ).toString(),
                                textAlign: TextAlign.start,
                                maxLines: 5,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                          ].divide(const SizedBox(height: 8.0)),
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          await widget.callback?.call(
                            'Tell me more about ${getJsonField(
                              functions.jsonDecode(widget.message!.dataJson),
                              r'''$.label''',
                            ).toString()}',
                          );
                        },
                        text: 'Details',
                        options: FFButtonOptions(
                          width: 90.0,
                          height: 40.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Inter Tight',
                                    color: Colors.white,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 0.0,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ].divide(const SizedBox(width: 15.0)),
                  ),
                ].divide(const SizedBox(height: 5.0)),
              ),
            ].divide(const SizedBox(height: 15.0)),
          ),
        ),
      ),
    );
  }
}
