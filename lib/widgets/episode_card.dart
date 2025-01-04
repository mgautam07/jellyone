import 'dart:math';

import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jellyone/db/db.dart';
import 'package:jellyone/screens/series_player.dart';
import 'package:jellyone/theme/app_styles.dart';
import 'package:jellyone/utils/time_functions.dart' as t;

class EpisodeCard extends StatelessWidget {
  const EpisodeCard(
      {super.key,
      required this.episode,
      required this.filePathList,
      required this.startIndex});
  final Episode episode;
  final List<String> filePathList;
  final int startIndex;

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
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => VideoPlayer(
                          id: episode.id,
                          name: 'name',
                          path: filePathList,
                          time: episode.watchedTime,
                          startIndex: startIndex,
                        )),
              );
            },
            hoverColor: AppTheme.medium,
            child: SizedBox(
              height: 197,
              width: double.infinity,
              child: Row(
                children: [
                  Stack(
                    children: [
                      Image(
                        image: FastCachedImageProvider(
                            'https://image.tmdb.org/t/p/original${episode.posterPath}'),
                        height: 195,
                        width:
                            min(MediaQuery.of(context).size.width * 0.2, 350),
                        fit: BoxFit.cover,
                      ),
                      Container(
                        height: 195,
                        width:
                            min(MediaQuery.of(context).size.width * 0.2, 350),
                        color: Colors.black.withOpacity(0.1),
                      ),
                    ],
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 16.0, 16.0, 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${episode.number}. ${episode.name}',
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: AppTheme.text, fontSize: 15),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Text(
                                t.convertRunTime(episode.runTime),
                                style: const TextStyle(
                                    color: AppTheme.subText, fontSize: 15),
                              ),
                              const SizedBox(width: 10),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 2),
                                  Text(
                                    episode.vote.toStringAsFixed(1),
                                    style: const TextStyle(
                                        fontSize: 15, color: AppTheme.subText),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 10),
                              Text(
                                  t.getEndTime(
                                      episode.runTime, episode.watchedTime),
                                  style: const TextStyle(
                                      color: AppTheme.subText, fontSize: 15)),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Expanded(
                            child: Text(
                              episode.overview,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                fontSize: 15,
                                color: AppTheme.subText,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
