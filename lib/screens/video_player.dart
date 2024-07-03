import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:jellyone/db/db.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

class VideoPlayer extends StatefulWidget {
  final String name;
  final List<String> path;
  final int id;
  final int time;

  const VideoPlayer(
      {super.key,
      required this.id,
      required this.name,
      required this.path,
      required this.time});

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  // Create a [Player] to control playback.
  late final Player player = Player(
    configuration: PlayerConfiguration(
      // Supply your options:
      title: widget.name,
    ),
  );

  late final controller = VideoController(player);

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    MediaKit.ensureInitialized();
    super.initState();

    List<Media> items = [];
    for (var i = 0; i < widget.path.length; i++) {
      items.add(Media(widget.path[i]));
    }

    player.open(Playlist(items));
    player.seek(Duration(seconds: widget.time));
  }

  @override
  void dispose() {
    final Duration currentTime = player.state.position;
    final database = AppDatabase();
    (database.update(database.moviesTable)
      ..where((tbl) => tbl.id.equals(widget.id))
      ..write(MoviesTableCompanion(watchedTime: Value(currentTime.inSeconds))));
    database.close();
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.name),
          bottomOpacity: 0,
        ),
        body: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width * 9.0 / 16.0,
            child: Video(controller: controller),
          ),
        ));
  }
}
