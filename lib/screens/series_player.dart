import 'dart:math';
import 'dart:async';

import 'package:drift/drift.dart' as d;
import 'package:flutter/material.dart';
import 'package:jellyone/db/db.dart';
import 'package:jellyone/widgets/video_player_controls.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:window_manager/window_manager.dart';

class VideoPlayer extends StatefulWidget {
  final String name;
  final List<String> path;
  final List<int> episodeIds;
  final int time;
  final int startIndex;

  const VideoPlayer(
      {super.key,
      required this.name,
      required this.path,
      required this.episodeIds,
      required this.time,
      required this.startIndex});

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  late final Player player = Player();

  late final controller = VideoController(player);

  final database = AppDatabase();
  final ValueNotifier<Duration?> tempPosition = ValueNotifier(null);
  final ValueNotifier<double> playbackSpeed = ValueNotifier(1.0);
  final int skipDuration = 10;

  @override
  void initState() {
    super.initState();

    List<Media> items = [];
    for (var i = 0; i < widget.path.length; i++) {
      items.add(Media(widget.path[i]));
    }

    player.open(Playlist(items, index: widget.startIndex));
    player.seek(Duration(seconds: widget.time));
  }

  @override
  void dispose() {
    windowManager.setFullScreen(false);
    updateDB();
    database.close();
    player.dispose();
    super.dispose();
  }

  void updateDB() {
    int playerTime = player.state.position.inSeconds;
    int ep = player.state.playlist.index;
    int dur = player.state.duration.inSeconds;
    Future.delayed(const Duration(seconds: 4), () async {
      if (dur - playerTime > 600) {
        (database.update(database.episodes)
          ..where((e) => e.id.equals(widget.episodeIds[ep]))
          ..write(EpisodesCompanion(
              watchStatus: const d.Value(1),
              watchedTime: d.Value(playerTime))));
      } else {
        (database.update(database.episodes)
          ..where((e) => e.id.equals(widget.episodeIds[ep]))
          ..write(EpisodesCompanion(
              watchStatus: const d.Value(2),
              watchedTime: d.Value(playerTime))));
      }
    });
  }

  Widget _desktopBottomButtonBar(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 258,
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  const MaterialDesktopPositionIndicator(
                      style: TextStyle(
                          height: 1.0,
                          fontSize: 13.0,
                          fontWeight: FontWeight.w400)),
                  CustomMaterialDesktopVolumeButton(controller: controller),
                ],
              ),
            ),
            Row(
              children: [
                const SizedBox(width: 10),
                IconButton(
                  onPressed: () async {
                    await player.previous();
                    updateDB();
                  },
                  icon: const Icon(Icons.skip_previous_rounded),
                ),
                IconButton(
                  onPressed: () async {
                    int currentPosition = player.state.position.inSeconds;
                    tempPosition.value =
                        Duration(seconds: skipDuration - currentPosition);
                    await player.seek(Duration(
                        seconds: max(0, currentPosition - skipDuration)));
                    tempPosition.value = null;
                  },
                  icon: const Icon(Icons.fast_rewind_rounded),
                  hoverColor: const Color.fromARGB(43, 100, 180, 246),
                ),
                CustomeMaterialDesktopPlayOrPauseButton(controller: controller),
                IconButton(
                  onPressed: () async {
                    int currentPosition = player.state.position.inSeconds;
                    int maxDuration = player.state.duration.inSeconds;
                    tempPosition.value = Duration(
                        seconds:
                            min(maxDuration, currentPosition + skipDuration));
                    await player.seek(Duration(
                        seconds:
                            min(maxDuration, currentPosition + skipDuration)));
                    tempPosition.value = null;
                  },
                  icon: const Icon(Icons.fast_forward_rounded),
                  hoverColor: const Color.fromARGB(43, 100, 180, 246),
                ),
                IconButton(
                  onPressed: () async {
                    await player.next();
                    updateDB();
                  },
                  icon: const Icon(Icons.skip_next_rounded),
                ),
              ],
            ),
            SizedBox(
              width: 258,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // IconButton(
                  //   onPressed: () => _videoSettingDraggableMenu(context),
                  //   icon: const Icon(
                  //     Icons.video_settings,
                  //     color: Colors.white,
                  //   ),
                  // ),
                  CustomMaterialDesktopChangeAudioButton(
                    player: player,
                  ),
                  CustomMaterialDesktopCaptionsButton(
                    player: player,
                  ),
                  CustomMaterialDesktopPlaybackSpeedButton(player: player),
                  // IconButton(
                  //   icon: const Icon(Icons.fit_screen_outlined,
                  //       color: Colors.white),
                  //   onPressed: () async {
                  //     _changeFitLabel(ref);
                  //   },
                  // ),
                  CustomMaterialDesktopFullscreenButton(
                    controller: controller,
                  ),
                  const SizedBox(width: 10)
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        centerTitle: true,
        backgroundColor: Colors.black,
        bottomOpacity: 0,
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Video(
            // subtitleViewConfiguration: SubtitleViewConfiguration(visible: false, style: subtileTextStyle(ref)),
            controls: (state) => MovieControllerWidget(
              videoController: controller,
              bottomButtonBarWidget: _desktopBottomButtonBar(context),
              tempDuration: (value) {
                tempPosition.value = value;
              },
            ),
            controller: controller,
          ),
        ),
      ),
    );
  }
}
