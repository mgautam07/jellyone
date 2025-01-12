import 'dart:math';

import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jellyone/screens/series_player.dart' as series_player;
import 'package:jellyone/screens/video_player.dart';
import 'package:jellyone/theme/app_styles.dart';

class ContinueWatchingCard extends StatelessWidget {
  const ContinueWatchingCard(
      {super.key,
      required this.id,
      required this.name,
      required this.filePath,
      required this.posterPath,
      required this.type,
      required this.time,
      required this.runtime});

  final int id;
  final String name;
  final String filePath;
  final String posterPath;
  final int time;
  final int runtime;
  final int type;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 8.0, 16.0, 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0), // Set the desired radius here
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              if (type == 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VideoPlayer(
                      id: id,
                      name: name,
                      path: filePath,
                      time: time,
                    ),
                  ),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => series_player.VideoPlayer(
                      name: name,
                      path: [filePath],
                      episodeIds: [id],
                      time: time,
                      startIndex: 0,
                    ),
                  ),
                );
              }
            },
            hoverColor: AppTheme.medium,
            child: SizedBox(
              height: 190,
              width: 300,
              child: Column(
                children: [
                  Stack(
                    children: [
                      Image(
                        image: FastCachedImageProvider(
                            'https://image.tmdb.org/t/p/original$posterPath'),
                        height: 190,
                        width: 300,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        height: 190,
                        width: 300,
                        color: Colors.black.withOpacity(0.50),
                        child: const Center(
                          child: Icon(Icons.play_arrow_rounded, size: 35.0),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        height: 4,
                        width: 300,
                        color: Colors.black,
                      ),
                      Container(
                        height: 4,
                        width: max(10, 300 * time / 60 / runtime),
                        color: Colors.blue.shade300.withOpacity(0.6),
                      )
                    ],
                  ),
                  const SizedBox(height: 3),
                  Text(
                    name,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.white70, fontSize: 15),
                  ),
                ],
              ),
              // ),
            ),
          ),
        ),
      ),
    );
  }
}
