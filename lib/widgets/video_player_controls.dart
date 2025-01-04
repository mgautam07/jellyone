import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jellyone/widgets/custom_seekbar.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:media_kit_video/media_kit_video_controls/src/controls/extensions/duration.dart';
import 'package:window_manager/window_manager.dart';

class MovieControllerWidget extends StatefulWidget {
  final Function(Duration?) tempDuration;
  final VideoController videoController;
  final Widget bottomButtonBarWidget;
  // final Widget seekToWidget;
  const MovieControllerWidget(
      {super.key,
      required this.videoController,
      required this.bottomButtonBarWidget,
      // required this.seekToWidget,
      required this.tempDuration});

  @override
  State<MovieControllerWidget> createState() => _MovieControllerWidgetState();
}

class _MovieControllerWidgetState extends State<MovieControllerWidget> {
  bool mount = true;
  bool visible = true;
  bool cursorVisible = true;
  Duration controlsTransitionDuration = const Duration(milliseconds: 300);
  Color backdropColor = const Color(0x66000000);

  int swipeDuration = 0; // Duration to seek in video

  final controlsHoverDuration = const Duration(seconds: 10);
  double buttonBarHeight = 100;
  final bottomButtonBarMargin = const EdgeInsets.only(left: 16.0, right: 16.0);

  Timer? _timer;

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  void onHover() {
    setState(() {
      mount = true;
      visible = true;
      cursorVisible = true;
    });

    _timer?.cancel();
    _timer = Timer(controlsHoverDuration, () {
      if (mounted) {
        setState(() {
          visible = false;
          cursorVisible = false;
        });
      }
    });
  }

  void onEnter() {
    setState(() {
      mount = true;
      visible = true;
      cursorVisible = true;
    });

    _timer?.cancel();
    _timer = Timer(controlsHoverDuration, () {
      if (mounted) {
        setState(() {
          visible = false;
          cursorVisible = false;
        });
      }
    });
  }

  void onExit() {
    setState(() {
      visible = false;
      cursorVisible = true;
    });

    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return CallbackShortcuts(
      bindings: {
        // Default key-board shortcuts.
        // https://support.google.com/youtube/answer/7631406
        const SingleActivator(LogicalKeyboardKey.mediaPlay): () =>
            widget.videoController.player.play(),
        const SingleActivator(LogicalKeyboardKey.mediaPause): () =>
            widget.videoController.player.pause(),
        const SingleActivator(LogicalKeyboardKey.mediaPlayPause): () =>
            widget.videoController.player.playOrPause(),
        const SingleActivator(LogicalKeyboardKey.mediaTrackNext): () =>
            widget.videoController.player.next(),
        const SingleActivator(LogicalKeyboardKey.mediaTrackPrevious): () =>
            widget.videoController.player.previous(),
        const SingleActivator(LogicalKeyboardKey.space): () =>
            widget.videoController.player.playOrPause(),
        const SingleActivator(LogicalKeyboardKey.keyJ): () {
          final rate = widget.videoController.player.state.position -
              const Duration(seconds: 10);
          widget.videoController.player.seek(rate);
        },
        const SingleActivator(LogicalKeyboardKey.keyL): () {
          final rate = widget.videoController.player.state.position +
              const Duration(seconds: 10);
          widget.videoController.player.seek(rate);
        },
        const SingleActivator(LogicalKeyboardKey.arrowLeft): () {
          final rate = widget.videoController.player.state.position -
              const Duration(seconds: 5);
          widget.videoController.player.seek(rate);
        },
        const SingleActivator(LogicalKeyboardKey.arrowRight): () {
          final rate = widget.videoController.player.state.position +
              const Duration(seconds: 5);
          widget.videoController.player.seek(rate);
        },
        const SingleActivator(LogicalKeyboardKey.arrowUp): () {
          final volume = widget.videoController.player.state.volume + 5.0;
          widget.videoController.player.setVolume(volume.clamp(0.0, 100.0));
        },
        const SingleActivator(LogicalKeyboardKey.arrowDown): () {
          final volume = widget.videoController.player.state.volume - 5.0;
          widget.videoController.player.setVolume(volume.clamp(0.0, 100.0));
        },
        const SingleActivator(LogicalKeyboardKey.keyF): () => setFullScreen(),
        const SingleActivator(LogicalKeyboardKey.escape): () =>
            setFullScreen(value: false),
      },
      child: Stack(
        children: [
          Focus(
            autofocus: true,
            child: Listener(
              onPointerSignal: (e) {
                if (e is PointerScrollEvent) {
                  if (e.delta.dy > 0) {
                    final volume =
                        widget.videoController.player.state.volume - 5.0;
                    widget.videoController.player
                        .setVolume(volume.clamp(0.0, 100.0));
                  }
                  if (e.delta.dy < 0) {
                    final volume =
                        widget.videoController.player.state.volume + 5.0;
                    widget.videoController.player
                        .setVolume(volume.clamp(0.0, 100.0));
                  }
                }
              },
              child: GestureDetector(
                onTap: () async {
                  await widget.videoController.player.playOrPause();
                },
                onDoubleTap: () {
                  setFullScreen();
                },
                onPanUpdate: (e) {
                  if (e.delta.dy > 0) {
                    final volume =
                        widget.videoController.player.state.volume - 5.0;
                    widget.videoController.player
                        .setVolume(volume.clamp(0.0, 100.0));
                  }
                  if (e.delta.dy < 0) {
                    final volume =
                        widget.videoController.player.state.volume + 5.0;
                    widget.videoController.player
                        .setVolume(volume.clamp(0.0, 100.0));
                  }
                },
                child: MouseRegion(
                  onHover: (_) => onHover(),
                  onEnter: (_) => onEnter(),
                  // onExit: (_) => onExit(),
                  cursor: cursorVisible
                      ? SystemMouseCursors.basic
                      : SystemMouseCursors.none,
                  child: Stack(
                    children: [
                      AnimatedOpacity(
                        curve: Curves.easeInOut,
                        opacity: visible ? 1.0 : 0.0,
                        duration: controlsTransitionDuration,
                        onEnd: () {
                          if (!visible) {
                            setState(() {
                              mount = false;
                            });
                          }
                        },
                        child: Stack(
                          clipBehavior: Clip.none,
                          alignment: Alignment.bottomCenter,
                          children: [
                            // Top gradient.
                            Container(
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  stops: [
                                    0.0,
                                    0.2,
                                  ],
                                  colors: [
                                    Color(0x61000000),
                                    Color(0x00000000),
                                  ],
                                ),
                              ),
                            ),

                            // Bottom gradient.
                            Container(
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  stops: [
                                    0.5,
                                    1.0,
                                  ],
                                  colors: [
                                    Color(0x00000000),
                                    Color(0x61000000),
                                  ],
                                ),
                              ),
                            ),
                            if (mount)
                              Padding(
                                padding: (isFullscreen(context)
                                    ? MediaQuery.of(context).padding
                                    : EdgeInsets.zero),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Transform.translate(
                                      offset: Offset.zero,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: CustomSeekBar(
                                          onSeekStart: (value) {
                                            setState(() {
                                              swipeDuration = value.inSeconds;
                                              widget.tempDuration(widget
                                                      .videoController
                                                      .player
                                                      .state
                                                      .position +
                                                  value);
                                            });
                                            _timer?.cancel();
                                          },
                                          onSeekEnd: (value) {
                                            _timer = Timer(
                                              controlsHoverDuration,
                                              () {
                                                if (mounted) {
                                                  setState(() {
                                                    visible = false;
                                                  });
                                                }
                                              },
                                            );
                                            widget.tempDuration(null);
                                          },
                                          player: widget.videoController.player,
                                        ),
                                      ),
                                    ),
                                    widget.bottomButtonBarWidget
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomMaterialDesktopCaptionsButton extends StatefulWidget {
  final Player player;
  const CustomMaterialDesktopCaptionsButton({super.key, required this.player});

  @override
  State<CustomMaterialDesktopCaptionsButton> createState() =>
      _CustomMaterialDesktopCaptionsButtonState();
}

class _CustomMaterialDesktopCaptionsButtonState
    extends State<CustomMaterialDesktopCaptionsButton> {
  List<SubtitleTrack>? subtitles;

  @override
  Widget build(BuildContext context) {
    subtitles = widget.player.state.tracks.subtitle;
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        MenuAnchor(
          alignmentOffset: const Offset(-85, 0),
          builder:
              (BuildContext context, MenuController controller, Widget? child) {
            return IconButton(
              onPressed: () {
                if (controller.isOpen) {
                  controller.close();
                } else {
                  controller.open();
                }
              },
              icon: const Icon(Icons.closed_caption_rounded, size: 25.0),
              hoverColor: const Color.fromARGB(43, 100, 180, 246),
            );
          },
          menuChildren: List<MenuItemButton>.generate(
            subtitles!.length,
            (int index) => MenuItemButton(
              onPressed: () async {
                await widget.player.setSubtitleTrack(subtitles![index]);
              },
              child: subtitles![index].id == 'auto'
                  ? const Text('Auto')
                  : subtitles![index].id == 'no'
                      ? const Text('Off')
                      : SizedBox(
                          width: 180,
                          child: Text(
                            subtitles![index].title ?? 'Invalid',
                            style: const TextStyle(
                                overflow: TextOverflow.ellipsis),
                          ),
                        ),
            ),
          ),
          style: const MenuStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.black54),
            elevation: WidgetStatePropertyAll(5.0),
            shadowColor: WidgetStatePropertyAll(Colors.black45),
            padding: WidgetStatePropertyAll(EdgeInsets.all(5.0)),
            maximumSize: WidgetStatePropertyAll(Size(210, 450)),
          ),
        ),
      ],
    );
  }
}

class CustomMaterialDesktopChangeAudioButton extends StatefulWidget {
  final Player player;
  const CustomMaterialDesktopChangeAudioButton(
      {super.key, required this.player});

  @override
  State<CustomMaterialDesktopChangeAudioButton> createState() =>
      _CustomMaterialDesktopChangeAudioButtonState();
}

class _CustomMaterialDesktopChangeAudioButtonState
    extends State<CustomMaterialDesktopChangeAudioButton> {
  List<AudioTrack>? audios;

  @override
  Widget build(BuildContext context) {
    audios = widget.player.state.tracks.audio;
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        MenuAnchor(
          alignmentOffset: const Offset(-85, 0),
          builder:
              (BuildContext context, MenuController controller, Widget? child) {
            return IconButton(
              onPressed: () {
                if (controller.isOpen) {
                  controller.close();
                } else {
                  controller.open();
                }
              },
              icon: const Icon(Icons.audiotrack_rounded, size: 25.0),
              hoverColor: const Color.fromARGB(43, 100, 180, 246),
            );
          },
          menuChildren: List<MenuItemButton>.generate(
            audios!.length,
            (int index) => MenuItemButton(
              onPressed: () async {
                await widget.player.setAudioTrack(audios![index]);
              },
              child: audios![index].id == 'auto'
                  ? const Text('Auto')
                  : audios![index].id == 'no'
                      ? const Text('Off')
                      : SizedBox(
                          width: 180,
                          child: Text(
                            audios![index].title ?? 'Invalid',
                            style: const TextStyle(
                                overflow: TextOverflow.ellipsis),
                          ),
                        ),
            ),
          ),
          style: const MenuStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.black54),
            elevation: WidgetStatePropertyAll(5.0),
            shadowColor: WidgetStatePropertyAll(Colors.black45),
            padding: WidgetStatePropertyAll(EdgeInsets.all(5.0)),
            maximumSize: WidgetStatePropertyAll(Size(210, 450)),
          ),
        ),
      ],
    );
  }
}

class CustomMaterialDesktopPlaybackSpeedButton extends StatefulWidget {
  final Player player;
  const CustomMaterialDesktopPlaybackSpeedButton(
      {super.key, required this.player});

  @override
  State<CustomMaterialDesktopPlaybackSpeedButton> createState() =>
      _CustomMaterialDesktopsktopPlaybackSpeednState();
}

class _CustomMaterialDesktopsktopPlaybackSpeednState
    extends State<CustomMaterialDesktopPlaybackSpeedButton> {
  double _currentSliderValue = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        MenuAnchor(
          alignmentOffset: const Offset(-85, 0),
          builder:
              (BuildContext context, MenuController controller, Widget? child) {
            return IconButton(
              onPressed: () {
                if (controller.isOpen) {
                  controller.close();
                } else {
                  controller.open();
                }
              },
              icon: const Icon(Icons.speed_rounded, size: 25.0),
              hoverColor: const Color.fromARGB(43, 100, 180, 246),
            );
          },
          menuChildren: <Widget>[
            SizedBox(
              width: 170,
              child: SliderTheme(
                data: SliderThemeData(
                  trackHeight: 1.7,
                  inactiveTrackColor: Colors.grey,
                  thumbColor: Colors.lightBlue.shade200,
                  thumbShape: const RoundSliderThumbShape(
                    enabledThumbRadius: 7,
                    elevation: 0.0,
                    pressedElevation: 0.0,
                  ),
                  trackShape: _CustomTrackShape(),
                  overlayColor: const Color(0x00000000),
                ),
                child: Slider(
                  value: _currentSliderValue,
                  max: 2,
                  divisions: 20,
                  label: _currentSliderValue.toString(),
                  inactiveColor: Colors.grey,
                  thumbColor: Colors.lightBlue.shade200,
                  overlayColor:
                      const WidgetStatePropertyAll(Colors.transparent),
                  onChanged: (double value) async {
                    setState(() {
                      _currentSliderValue = value;
                    });
                    await widget.player.setRate(value);
                  },
                ),
              ),
            ),
          ],
          style: const MenuStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.black54),
            elevation: WidgetStatePropertyAll(5.0),
            shadowColor: WidgetStatePropertyAll(Colors.black45),
            padding: WidgetStatePropertyAll(EdgeInsets.all(5.0)),
            maximumSize: WidgetStatePropertyAll(Size(210, 450)),
          ),
        ),
      ],
    );
  }
}
// BUTTON: PLAY/PAUSE

/// A material design play/pause button.
class CustomeMaterialDesktopPlayOrPauseButton extends StatefulWidget {
  final VideoController controller;

  const CustomeMaterialDesktopPlayOrPauseButton({
    super.key,
    required this.controller,
  });

  @override
  CustomeMaterialDesktopPlayOrPauseButtonState createState() =>
      CustomeMaterialDesktopPlayOrPauseButtonState();
}

class CustomeMaterialDesktopPlayOrPauseButtonState
    extends State<CustomeMaterialDesktopPlayOrPauseButton>
    with SingleTickerProviderStateMixin {
  late final animation = AnimationController(
    vsync: this,
    value: widget.controller.player.state.playing ? 1 : 0,
    duration: const Duration(milliseconds: 200),
  );

  StreamSubscription<bool>? subscription;

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    subscription ??= widget.controller.player.stream.playing.listen((event) {
      if (event) {
        animation.forward();
      } else {
        animation.reverse();
      }
    });
  }

  @override
  void dispose() {
    animation.dispose();
    subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: widget.controller.player.playOrPause,
      iconSize: 25,
      icon: AnimatedIcon(
        progress: animation,
        icon: AnimatedIcons.play_pause,
        size: 25,
      ),
      hoverColor: const Color.fromARGB(43, 100, 180, 246),
    );
  }
}

// BUTTON: VOLUME

/// MaterialDesktop design volume button & slider.
class CustomMaterialDesktopVolumeButton extends StatefulWidget {
  final VideoController controller;

  const CustomMaterialDesktopVolumeButton({
    super.key,
    required this.controller,
  });

  @override
  CustomMaterialDesktopVolumeButtonState createState() =>
      CustomMaterialDesktopVolumeButtonState();
}

class CustomMaterialDesktopVolumeButtonState
    extends State<CustomMaterialDesktopVolumeButton>
    with SingleTickerProviderStateMixin {
  late double volume = widget.controller.player.state.volume;

  StreamSubscription<double>? subscription;

  bool hover = false;

  bool mute = false;
  double _volume = 0.0;

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    subscription ??= widget.controller.player.stream.volume.listen((event) {
      setState(() {
        volume = event;
      });
    });
  }

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (e) {
        setState(() {
          hover = true;
        });
      },
      onExit: (e) {
        setState(() {
          hover = false;
        });
      },
      child: Listener(
        onPointerSignal: (event) {
          if (event is PointerScrollEvent) {
            if (event.scrollDelta.dy < 0) {
              widget.controller.player.setVolume(
                (volume + 5.0).clamp(0.0, 100.0),
              );
            }
            if (event.scrollDelta.dy > 0) {
              widget.controller.player.setVolume(
                (volume - 5.0).clamp(0.0, 100.0),
              );
            }
          }
        },
        child: Row(
          children: [
            const SizedBox(width: 4.0),
            IconButton(
              onPressed: () async {
                if (mute) {
                  await widget.controller.player.setVolume(_volume);
                  mute = !mute;
                }
                // https://github.com/media-kit/media-kit/pull/250#issuecomment-1605588306
                else if (volume == 0.0) {
                  _volume = 100.0;
                  await widget.controller.player.setVolume(100.0);
                  mute = false;
                } else {
                  _volume = volume;
                  await widget.controller.player.setVolume(0.0);
                  mute = !mute;
                }

                setState(() {});
              },
              iconSize: 25,
              icon: AnimatedSwitcher(
                duration: const Duration(milliseconds: 150),
                child: volume == 0.0
                    ? const Icon(
                        Icons.volume_off_rounded,
                        key: ValueKey(Icons.volume_off),
                        size: 25.0,
                      )
                    : volume < 50.0
                        ? const Icon(
                            Icons.volume_down_rounded,
                            key: ValueKey(Icons.volume_down),
                            size: 25.0,
                          )
                        : const Icon(
                            Icons.volume_up_rounded,
                            key: ValueKey(Icons.volume_up),
                            size: 25.0,
                          ),
              ),
              hoverColor: const Color.fromARGB(43, 100, 180, 246),
            ),
            AnimatedOpacity(
              opacity: hover ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 150),
              child: AnimatedContainer(
                width: hover ? (12.0 + 52.0 + 18.0) : 12.0,
                duration: const Duration(milliseconds: 150),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      const SizedBox(width: 12.0),
                      SizedBox(
                        width: 52.0,
                        child: SliderTheme(
                          data: SliderThemeData(
                            trackHeight: 1.2,
                            inactiveTrackColor: Colors.grey,
                            thumbColor: Colors.lightBlue.shade200,
                            thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 12 / 2,
                              elevation: 0.0,
                              pressedElevation: 0.0,
                            ),
                            trackShape: _CustomTrackShape(),
                            overlayColor: const Color(0x00000000),
                          ),
                          child: Slider(
                            value: volume.clamp(0.0, 100.0),
                            min: 0.0,
                            max: 100.0,
                            onChanged: (value) async {
                              await widget.controller.player.setVolume(value);
                              mute = false;
                              setState(() {});
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 18.0),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// POSITION INDICATOR

/// MaterialDesktop design position indicator.
class CustomMaterialDesktopPositionIndicator extends StatefulWidget {
  final VideoController controller;
  final Duration? delta;

  const CustomMaterialDesktopPositionIndicator(
      {super.key, required this.controller, this.delta});

  @override
  CustomMaterialDesktopPositionIndicatorState createState() =>
      CustomMaterialDesktopPositionIndicatorState();
}

class CustomMaterialDesktopPositionIndicatorState
    extends State<CustomMaterialDesktopPositionIndicator> {
  late Duration position = widget.controller.player.state.position;
  late Duration duration = widget.controller.player.state.duration;

  final List<StreamSubscription> subscriptions = [];

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (subscriptions.isEmpty) {
      subscriptions.addAll(
        [
          widget.controller.player.stream.position.listen((event) {
            setState(() {
              position = event;
            });
          }),
          widget.controller.player.stream.duration.listen((event) {
            setState(() {
              duration = event;
            });
          }),
        ],
      );
    }
  }

  @override
  void dispose() {
    for (final subscription in subscriptions) {
      subscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '${(widget.delta ?? position).label(reference: duration)} / ${duration.label(reference: duration)}',
      style: const TextStyle(
          height: 1.0,
          fontSize: 14.0,
          color: Color.fromARGB(255, 221, 221, 221),
          fontWeight: FontWeight.w600),
    );
  }
}

class _CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final height = sliderTheme.trackHeight;
    final left = offset.dx;
    final top = offset.dy + (parentBox.size.height - height!) / 2;
    final width = parentBox.size.width;
    return Rect.fromLTWH(
      left,
      top,
      width,
      height,
    );
  }
}

class CustomMaterialDesktopFullscreenButton extends StatefulWidget {
  final VideoController controller;

  const CustomMaterialDesktopFullscreenButton({
    super.key,
    required this.controller,
  });

  @override
  State<CustomMaterialDesktopFullscreenButton> createState() =>
      _CustomMaterialDesktopFullscreenButtonState();
}

class _CustomMaterialDesktopFullscreenButtonState
    extends State<CustomMaterialDesktopFullscreenButton> {
  bool _isFullscreen = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        final isFullScreen = await setFullScreen();
        setState(() {
          _isFullscreen = isFullScreen;
        });
      },
      icon: _isFullscreen
          ? const Icon(Icons.fullscreen_exit_rounded, size: 25.0)
          : const Icon(Icons.fullscreen_rounded, size: 25.0),
      iconSize: 25,
      hoverColor: const Color.fromARGB(43, 100, 180, 246),
    );
  }
}

Future<bool> setFullScreen({bool? value}) async {
  if (value != null) {
    final isFullScreen = await windowManager.isFullScreen();
    if (value != isFullScreen) {
      await windowManager.setFullScreen(value);
    }
    return value;
  }
  final isFullScreen = await windowManager.isFullScreen();
  if (!isFullScreen) {
    await windowManager.setFullScreen(true);
  } else {
    await windowManager.setFullScreen(false);
  }
  return isFullScreen;
}
