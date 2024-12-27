import '/backend/schema/structs/index.dart';
import '/components/audio_chip/audio_chip_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'text_message_model.dart';
export 'text_message_model.dart';

class TextMessageWidget extends StatefulWidget {
  const TextMessageWidget({
    super.key,
    required this.message,
    required this.modelConfiguration,
    required this.userProfile,
  });

  final MessageStruct? message;
  final ModelConfigurationStruct? modelConfiguration;
  final UserProfileStruct? userProfile;

  @override
  State<TextMessageWidget> createState() => _TextMessageWidgetState();
}

class _TextMessageWidgetState extends State<TextMessageWidget>
    with TickerProviderStateMixin {
  late TextMessageModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TextMessageModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOutQuint,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            color: FlutterFlowTheme.of(context).accent1,
            angle: 0.524,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Align(
          alignment: AlignmentDirectional(
              valueOrDefault<double>(
                widget.message?.role == FFAppConstants.RoleUser ? 1.0 : -1.0,
                -1.0,
              ),
              -1.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.message?.role == FFAppConstants.RoleAgent)
                Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    shape: BoxShape.circle,
                  ),
                  child: Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        width: 120.0,
                        height: 120.0,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: CachedNetworkImage(
                          fadeInDuration: const Duration(milliseconds: 100),
                          fadeOutDuration: const Duration(milliseconds: 100),
                          imageUrl: valueOrDefault<String>(
                            widget.modelConfiguration?.agentProfilePicture !=
                                        null &&
                                    widget.modelConfiguration
                                            ?.agentProfilePicture !=
                                        ''
                                ? widget
                                    .modelConfiguration?.agentProfilePicture
                                : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/g-p-t-4o-gwizk5/assets/ij7c0yekmnfb/Logo_Glass.png',
                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/g-p-t-4o-gwizk5/assets/ij7c0yekmnfb/Logo_Glass.png',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              Expanded(
                child: Container(
                  constraints: const BoxConstraints(
                    maxWidth: 400.0,
                  ),
                  decoration: const BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(
                            valueOrDefault<double>(
                              widget.message?.role == FFAppConstants.RoleUser
                                  ? 1.0
                                  : -1.0,
                              -1.0,
                            ),
                            -1.0),
                        child: Text(
                          widget.message?.role == FFAppConstants.RoleAgent
                              ? widget.modelConfiguration!.agentName
                              : widget.userProfile!.username,
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          style: FlutterFlowTheme.of(context)
                              .bodySmall
                              .override(
                                fontFamily: 'Inter',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                      Builder(
                        builder: (context) {
                          if (getJsonField(
                                functions.jsonDecode(widget.message!.dataJson),
                                r'''$.text''',
                              ) !=
                              null) {
                            return Align(
                              alignment: AlignmentDirectional(
                                  valueOrDefault<double>(
                                    widget.message?.role ==
                                            FFAppConstants.RoleUser
                                        ? 1.0
                                        : -1.0,
                                    -1.0,
                                  ),
                                  0.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Container(
                                  constraints: const BoxConstraints(
                                    maxWidth: 400.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: valueOrDefault<Color>(
                                      widget.message?.role ==
                                              FFAppConstants.RoleUser
                                          ? FlutterFlowTheme.of(context).primary
                                          : FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          constraints: const BoxConstraints(
                                            minHeight: 24.0,
                                          ),
                                          decoration: const BoxDecoration(),
                                          child: Builder(
                                            builder: (context) {
                                              if (widget.message?.role ==
                                                  FFAppConstants.RoleUser) {
                                                return Text(
                                                  getJsonField(
                                                    functions.jsonDecode(widget
                                                        .message!.dataJson),
                                                    r'''$.text''',
                                                  ).toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        letterSpacing: 0.0,
                                                      ),
                                                );
                                              } else {
                                                return Visibility(
                                                  visible: widget.message
                                                              ?.dataJson !=
                                                          null &&
                                                      widget.message
                                                              ?.dataJson !=
                                                          '',
                                                  child: MarkdownBody(
                                                    data: getJsonField(
                                                      functions.jsonDecode(
                                                          widget.message!
                                                              .dataJson),
                                                      r'''$.text''',
                                                    ).toString(),
                                                    selectable: true,
                                                    onTapLink: (_, url, __) =>
                                                        launchURL(url!),
                                                  ),
                                                );
                                              }
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return Align(
                              alignment: const AlignmentDirectional(-1.0, 0.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 54.0,
                                  constraints: const BoxConstraints(
                                    maxWidth: 400.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                              ).animateOnPageLoad(animationsMap[
                                  'containerOnPageLoadAnimation']!),
                            );
                          }
                        },
                      ),
                    ].divide(const SizedBox(height: 5.0)),
                  ),
                ),
              ),
              if (widget.message?.role == FFAppConstants.RoleUser)
                Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    shape: BoxShape.circle,
                  ),
                  child: Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        width: 120.0,
                        height: 120.0,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: CachedNetworkImage(
                          fadeInDuration: const Duration(milliseconds: 100),
                          fadeOutDuration: const Duration(milliseconds: 100),
                          imageUrl: widget.userProfile!.profilePicture,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
            ].divide(const SizedBox(width: 5.0)),
          ),
        ),
        if (widget.message?.images != null &&
            (widget.message?.images)!.isNotEmpty)
          Builder(
            builder: (context) {
              final img = widget.message?.images.toList() ?? [];

              return Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: List.generate(img.length, (imgIndex) {
                  final imgItem = img[imgIndex];
                  return InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      await Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          child: FlutterFlowExpandedImageView(
                            image: Image.network(
                              imgItem,
                              fit: BoxFit.contain,
                            ),
                            allowRotation: true,
                            tag: imgItem,
                            useHeroAnimation: true,
                          ),
                        ),
                      );
                    },
                    child: Hero(
                      tag: imgItem,
                      transitionOnUserGestures: true,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          imgItem,
                          width: 60.0,
                          height: 60.0,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  );
                }).divide(const SizedBox(width: 16.0)).around(const SizedBox(width: 16.0)),
              );
            },
          ),
        if (widget.message?.audios != null &&
            (widget.message?.audios)!.isNotEmpty)
          Builder(
            builder: (context) {
              final audio = widget.message?.audios.toList() ?? [];

              return Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: List.generate(audio.length, (audioIndex) {
                  final audioItem = audio[audioIndex];
                  return AudioChipWidget(
                    key: Key('Keywk0_${audioIndex}_of_${audio.length}'),
                    parameter1: audioIndex,
                    parameter2: audioItem,
                  );
                }).divide(const SizedBox(width: 16.0)).around(const SizedBox(width: 16.0)),
              );
            },
          ),
      ].divide(const SizedBox(height: 16.0)),
    );
  }
}
