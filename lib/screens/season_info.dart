import 'dart:math';

import 'package:drift/drift.dart' as d;
import 'package:flutter/material.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';

import 'package:jellyone/db/db.dart';
import 'package:jellyone/theme/app_styles.dart';
import 'package:jellyone/widgets/episode_card.dart';

Future<List<Episode>> getEpisodes(int id) async {
  final database = AppDatabase();

  final episodeList = await (database.select(database.episodes)
        ..where((tbl) => tbl.seasonid.equals(id))
        ..orderBy([(t) => d.OrderingTerm.asc(t.number)]))
      .get();

  return episodeList;
}

String getEndTime(int time, int watchedTime) {
  final end = DateTime.now()
      .add(Duration(minutes: (time - (watchedTime / 60).floor())));
  if (end.minute < 10 && end.hour > 9) {
    return 'Ends at ${end.hour}: 0${end.minute}';
  } else if (end.minute > 9 && end.hour < 10) {
    return 'Ends at 0${end.hour}:${end.minute}';
  } else if (end.minute < 10 && end.hour < 10) {
    return 'Ends at 0${end.hour}:0${end.minute}';
  }
  return 'Ends at ${end.hour}:${end.minute}';
}

String convertRunTime(int time) {
  double h = time / 60;
  return '${h.floor()}h ${time - (h.floor() * 60)}m';
}

class SeasonInfoScreen extends StatefulWidget {
  final Season season;
  final String name;
  final String logoPath;
  final String posterPath;
  final String backdropPath;

  const SeasonInfoScreen(
      {super.key,
      required this.season,
      required this.name,
      required this.logoPath,
      required this.posterPath,
      required this.backdropPath});

  @override
  State<SeasonInfoScreen> createState() => _SeasonInfoScreenState();
}

class _SeasonInfoScreenState extends State<SeasonInfoScreen> {
  late Future<List<Episode>> _episodesListFuture;

  @override
  void initState() {
    super.initState();
    _episodesListFuture = getEpisodes(widget.season.id);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Episode>>(
        future: _episodesListFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No episodes available.'));
          } else {
            List<Episode> episodesList = snapshot.data!; // Extract data
            List<String> filePathList = [];
            List<int> episodeIds = [];

            for (Episode episode in episodesList) {
              filePathList.add(episode.filePath);
              episodeIds.add(episode.id);
            }

            return Scaffold(
              appBar: AppBar(
                title: const Text('Info'),
              ),
              body: Stack(
                children: [
                  Transform.translate(
                    offset: const Offset(0, -60),
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: FastCachedImageProvider(
                                  'https://image.tmdb.org/t/p/original${widget.backdropPath}'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.black.withOpacity(0.4),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 130,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: max(
                                  MediaQuery.of(context).size.width * 0.3, 400),
                            ),
                            Center(
                              child: Image(
                                image: FastCachedImageProvider(
                                    'https://image.tmdb.org/t/p/original${widget.logoPath}'),
                                height: 120,
                                width: 400,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: double.infinity,
                          height: 110,
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(32, 32, 32, 0.8),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: max(
                                    MediaQuery.of(context).size.width * 0.3,
                                    350),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          widget.name,
                                          style: const TextStyle(fontSize: 26),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const SizedBox(width: 10),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                              size: 20,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 2),
                                              child: Text(
                                                widget.season.vote.toString(),
                                                style: const TextStyle(
                                                    fontSize: 15),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: AppTheme.dark,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: max(
                                    MediaQuery.of(context).size.width * 0.32,
                                    350),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(60),
                                      child: Transform.translate(
                                        offset: const Offset(0, -150),
                                        child: Image(
                                          image: FastCachedImageProvider(
                                              'https://image.tmdb.org/t/p/original${widget.posterPath}'),
                                          width: max(
                                              MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.4,
                                              400),
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  color: AppTheme.dark,
                                  width: double.infinity,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 10),
                                      const Text('Episodes',
                                          style: TextStyle(fontSize: 22)),
                                      FutureBuilder(
                                        future: _episodesListFuture,
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState ==
                                              ConnectionState.waiting) {
                                            return const Center(
                                                child:
                                                    CircularProgressIndicator());
                                          } else if (snapshot.hasError) {
                                            return Center(
                                                child: Text(
                                                    'Error: ${snapshot.error}'));
                                          } else if (!snapshot.hasData ||
                                              snapshot.data!.isEmpty) {
                                            return const Center(
                                                child: Text('No data available',
                                                    style: TextStyle(
                                                        fontSize: 15)));
                                          } else {
                                            return Column(
                                              children: List.generate(
                                                snapshot.data?.length ?? 0,
                                                (index) {
                                                  return EpisodeCard(
                                                      name: widget.name,
                                                      episode:
                                                          snapshot.data![index],
                                                      filePathList:
                                                          filePathList,
                                                      episodeIds: episodeIds,
                                                      startIndex: index);
                                                },
                                              ),
                                            );
                                          }
                                        },
                                      ),
                                      const SizedBox(height: 20)
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }
        });
  }
}
