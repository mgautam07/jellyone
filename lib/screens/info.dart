import 'dart:math';
import 'package:drift/drift.dart' as d;
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:jellyone/db/db.dart';
import 'package:jellyone/screens/video_player.dart';
import 'package:jellyone/theme/app_styles.dart';
import 'package:jellyone/widgets/cast_card.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:jellyone/utils/custom_scroll.dart';

Future<List<String>> getGenres(int id) async {
  final database = AppDatabase();
  List<String> genreList = [];

  final genres = await (database.select(database.movieGenres)
        ..where((tbl) => tbl.movieId.equals(id)))
      .get();

  if (genres.isNotEmpty) {
    for (var g in genres) {
      final genre = await (database.select(database.genres)
            ..where((tbl) => tbl.id.equals(g.genreId)))
          .get();
      if (genre.isNotEmpty) {
        genreList.add(genre[0].name);
      }
    }
  }
  await database.close();
  return genreList;
}

Future<List<String>> getProducer(int id) async {
  final database = AppDatabase();
  List<String> producerList = [];

  final producers = await (database.select(database.movieCast)
        ..where((tbl) => tbl.movieId.equals(id))
        ..where((tbl) => tbl.role.equals('Producer')))
      .get();

  if (producers.isNotEmpty) {
    for (var a in producers) {
      final producer = await (database.select(database.actors)
            ..where((tbl) => tbl.id.equals(a.actorId)))
          .get();
      if (producer.isNotEmpty) {
        producerList.add(producer[0].name);
      }
    }
  }
  await database.close();
  return producerList;
}

Future<List<String>> getWriter(int id) async {
  final database = AppDatabase();
  List<String> writerList = [];

  final writers = await (database.select(database.movieCast)
        ..where((tbl) => tbl.movieId.equals(id))
        ..where((tbl) => tbl.role.equals('Writer')))
      .get();

  if (writers.isNotEmpty) {
    for (var a in writers) {
      final writer = await (database.select(database.actors)
            ..where((tbl) => tbl.id.equals(a.actorId)))
          .get();
      if (writer.isNotEmpty) {
        writerList.add(writer[0].name);
      }
    }
  }
  await database.close();
  return writerList;
}

Future<List<String>> getDirector(int id) async {
  final database = AppDatabase();
  List<String> directorList = [];

  final directors = await (database.select(database.movieCast)
        ..where((tbl) => tbl.movieId.equals(id))
        ..where((tbl) => tbl.role.equals('Director')))
      .get();

  if (directors.isNotEmpty) {
    for (var a in directors) {
      final director = await (database.select(database.actors)
            ..where((tbl) => tbl.id.equals(a.actorId)))
          .get();
      if (director.isNotEmpty) {
        directorList.add(director[0].name);
      }
    }
  }
  await database.close();
  return directorList;
}

Future<List<Map<String, String>>> getCast(int id) async {
  final database = AppDatabase();
  List<Map<String, String>> actorList = [];

  final actors = await (database.select(database.movieCast)
        ..where((tbl) => tbl.movieId.equals(id))
        ..where((tbl) => tbl.role.equals('Actor')))
      .get();

  if (actors.isNotEmpty) {
    for (var a in actors) {
      final actor = await (database.select(database.actors)
            ..where((tbl) => tbl.id.equals(a.actorId)))
          .get();
      if (actor.isNotEmpty) {
        Map<String, String> m = {
          "name": actor[0].name,
          "role": a.role,
          "as": a.as,
          "profilePath": actor[0].profilePath
        };
        actorList.add(m);
      }
    }
  }
  return actorList;
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

class MediaInfoScreen extends StatefulWidget {
  final MoviesTableData movie;

  const MediaInfoScreen({super.key, required this.movie});

  @override
  State<MediaInfoScreen> createState() => _MediaInfoScreenState();
}

class _MediaInfoScreenState extends State<MediaInfoScreen> {
  late Future<List<String>> _genreFuture;
  late Future<List<String>> _producerFuture;
  late Future<List<String>> _directorFuture;
  late Future<List<String>> _writerFuture;
  late Future<List<Map<String, String>>> _castFuture;

  @override
  void initState() {
    super.initState();
    _genreFuture = getGenres(widget.movie.id);
    _producerFuture = getProducer(widget.movie.id);
    _directorFuture = getDirector(widget.movie.id);
    _writerFuture = getWriter(widget.movie.id);
    _castFuture = getCast(widget.movie.id);
    // getCastAndCrew(widget.movie.id);
  }

  _launchWebsite(String uri) async {
    final Uri url = Uri.parse(uri);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.movie.name)),
      ),
      body: Stack(
        children: [
          Transform.translate(
            offset: const Offset(0, -60),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: FastCachedImageProvider(
                      'https://image.tmdb.org/t/p/original${widget.movie.backdropPath}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  const SizedBox(
                    height: 200,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width:
                            max(MediaQuery.of(context).size.width * 0.3, 400),
                      ),
                      Center(
                        child: Image(
                          image: FastCachedImageProvider(
                              'https://image.tmdb.org/t/p/original${widget.movie.logoPath}'),
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
                          width:
                              max(MediaQuery.of(context).size.width * 0.3, 350),
                        ),
                        Expanded(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      widget.movie.name,
                                      style: const TextStyle(fontSize: 26),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '${widget.movie.releaseDate.year}',
                                      style: const TextStyle(fontSize: 15),
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      convertRunTime(widget.movie.runTime),
                                      style: const TextStyle(fontSize: 15),
                                    ),
                                    // const SizedBox(width: 10),
                                    // Container(
                                    //   padding: const EdgeInsets.only(
                                    //       left: 8.5, right: 8.5),
                                    //   decoration: BoxDecoration(
                                    //       border: Border.all(
                                    //           color: AppTheme.text)),
                                    //   child: const Text(
                                    //     'R',
                                    //     style: TextStyle(fontSize: 15),
                                    //   ),
                                    // ),
                                    const SizedBox(width: 10),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 20,
                                        ),
                                        Padding(
                                            padding:
                                                const EdgeInsets.only(left: 2),
                                            child: Text(
                                              widget.movie.vote.toString(),
                                              style:
                                                  const TextStyle(fontSize: 15),
                                            )),
                                      ],
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      getEndTime(widget.movie.runTime,
                                          widget.movie.watchedTime),
                                      style: const TextStyle(fontSize: 15),
                                    ),
                                    const SizedBox(width: 10),
                                  ],
                                )
                              ]),
                        ),
                        Row(
                          children: [
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => VideoPlayer(
                                              id: widget.movie.id,
                                              name: widget.movie.name,
                                              path: [widget.movie.videoFile],
                                              time: widget.movie.watchedTime)));
                                },
                                style: TextButton.styleFrom(
                                    shape: const CircleBorder()),
                                child: const Icon(Icons.play_arrow)),
                            TextButton(
                              onPressed: () {
                                final database = AppDatabase();
                                (database.update(database.moviesTable)
                                  ..where(
                                      (tbl) => tbl.id.equals(widget.movie.id))
                                  ..write(const MoviesTableCompanion(
                                      watchStatus: d.Value(2))));
                                database.close();
                              },
                              style: TextButton.styleFrom(
                                  shape: const CircleBorder()),
                              child: const Icon(Icons.done),
                            ),
                            TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                    shape: const CircleBorder()),
                                child: const Icon(Icons.delete)),
                          ],
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
                          width:
                              max(MediaQuery.of(context).size.width * 0.3, 350),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(60),
                                child: Transform.translate(
                                  offset: const Offset(0, -150),
                                  child: Image(
                                    image: FastCachedImageProvider(
                                        'https://image.tmdb.org/t/p/original${widget.movie.posterPath}'),
                                    width: max(
                                        MediaQuery.of(context).size.width * 0.4,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 20),
                                Text(
                                  widget.movie.tagLine,
                                  style: const TextStyle(fontSize: 18),
                                ),
                                const SizedBox(height: 18),
                                Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: Text(widget.movie.overview,
                                      style: const TextStyle(fontSize: 15)),
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  children: [
                                    OutlinedButton(
                                      onPressed: () =>
                                          _launchWebsite(widget.movie.homePage),
                                      style: OutlinedButton.styleFrom(
                                          // backgroundColor: AppTheme.dark,
                                          backgroundColor: Colors.transparent,
                                          shadowColor: Colors.transparent,
                                          foregroundColor: AppTheme.text,
                                          shape: const RoundedRectangleBorder(
                                            side: BorderSide.none,
                                          )),
                                      child: const Text('Home'),
                                    ),
                                    const SizedBox(width: 15),
                                    OutlinedButton(
                                      onPressed: () => _launchWebsite(
                                          'https://www.imdb.com/title/${widget.movie.imdb}'),
                                      style: OutlinedButton.styleFrom(
                                          // backgroundColor: AppTheme.dark,
                                          foregroundColor: AppTheme.text,
                                          shape: const RoundedRectangleBorder(
                                            side: BorderSide.none,
                                          )),
                                      child: const Text('IMDb'),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Genre',
                                        style: TextStyle(fontSize: 15)),
                                    const SizedBox(width: 50),
                                    Expanded(
                                      child: FutureBuilder<List<String>>(
                                        future: _genreFuture,
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState ==
                                              ConnectionState.waiting) {
                                            return const Center(
                                              child: SizedBox(
                                                width: 20,
                                                height: 20,
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                            );
                                          } else if (snapshot.hasError) {
                                            return Center(
                                                child: Text(
                                                    'Error: ${snapshot.error}'));
                                          } else if (!snapshot.hasData ||
                                              snapshot.data!.isEmpty) {
                                            return const Text(
                                                'No data available',
                                                style: TextStyle(fontSize: 15));
                                          } else {
                                            return SizedBox(
                                              height: 20,
                                              child: ListView.builder(
                                                itemCount:
                                                    snapshot.data?.length ?? 0,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemBuilder: (context, index) {
                                                  return Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 4.5),
                                                    child: Text(
                                                      snapshot.data![index],
                                                      style: const TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  );
                                                },
                                              ),
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Director',
                                        style: TextStyle(fontSize: 15)),
                                    const SizedBox(width: 37),
                                    Expanded(
                                      child: FutureBuilder<List<String>>(
                                        future: _directorFuture,
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState ==
                                              ConnectionState.waiting) {
                                            return const Center(
                                              child: SizedBox(
                                                width: 20,
                                                height: 20,
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                            );
                                          } else if (snapshot.hasError) {
                                            return Center(
                                                child: Text(
                                                    'Error: ${snapshot.error}'));
                                          } else if (!snapshot.hasData ||
                                              snapshot.data!.isEmpty) {
                                            return const Text(
                                                'No data available',
                                                style: TextStyle(fontSize: 15));
                                          } else {
                                            return SizedBox(
                                              height: 20,
                                              child: ListView.builder(
                                                itemCount:
                                                    snapshot.data?.length ?? 0,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemBuilder: (context, index) {
                                                  return Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 4.5),
                                                    child: Text(
                                                      snapshot.data![index],
                                                      style: const TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  );
                                                },
                                              ),
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 1),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Producer',
                                        style: TextStyle(fontSize: 15)),
                                    const SizedBox(width: 30),
                                    Expanded(
                                      child: FutureBuilder<List<String>>(
                                        future: _producerFuture,
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState ==
                                              ConnectionState.waiting) {
                                            return const Center(
                                              child: SizedBox(
                                                width: 20,
                                                height: 20,
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                            );
                                          } else if (snapshot.hasError) {
                                            return Center(
                                                child: Text(
                                                    'Error: ${snapshot.error}'));
                                          } else if (!snapshot.hasData ||
                                              snapshot.data!.isEmpty) {
                                            return const Text(
                                                'No data available',
                                                style: TextStyle(fontSize: 15));
                                          } else {
                                            return SizedBox(
                                              height: 20,
                                              child: ListView.builder(
                                                itemCount:
                                                    snapshot.data?.length ?? 0,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemBuilder: (context, index) {
                                                  return Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 4.5),
                                                    child: Text(
                                                      snapshot.data![index],
                                                      style: const TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  );
                                                },
                                              ),
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 1),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Writer',
                                        style: TextStyle(fontSize: 15)),
                                    const SizedBox(width: 50),
                                    Expanded(
                                      child: FutureBuilder<List<String>>(
                                        future: _writerFuture,
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState ==
                                              ConnectionState.waiting) {
                                            return const Center(
                                              child: SizedBox(
                                                width: 20,
                                                height: 20,
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                            );
                                          } else if (snapshot.hasError) {
                                            return Center(
                                                child: Text(
                                                    'Error: ${snapshot.error}'));
                                          } else if (!snapshot.hasData ||
                                              snapshot.data!.isEmpty) {
                                            return const Text(
                                                'No data available',
                                                style: TextStyle(fontSize: 15));
                                          } else {
                                            return SizedBox(
                                              height: 20,
                                              child: ListView.builder(
                                                itemCount:
                                                    snapshot.data?.length ?? 0,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemBuilder: (context, index) {
                                                  return Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 4.5),
                                                    child: Text(
                                                      snapshot.data![index],
                                                      style: const TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  );
                                                },
                                              ),
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 23),
                                const Text('Cast',
                                    style: TextStyle(fontSize: 22)),
                                SizedBox(
                                  height: 350,
                                  width: double.infinity,
                                  child: FutureBuilder(
                                    future: _castFuture,
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return const Center(
                                            child: CircularProgressIndicator());
                                      } else if (snapshot.hasError) {
                                        return Center(
                                            child: Text(
                                                'Error: ${snapshot.error}'));
                                      } else if (!snapshot.hasData ||
                                          snapshot.data!.isEmpty) {
                                        return const Center(
                                            child: Text('No data available',
                                                style:
                                                    TextStyle(fontSize: 15)));
                                      } else {
                                        return ScrollConfiguration(
                                          behavior: CustomScrollBehavior()
                                              .copyWith(overscroll: false),
                                          child: ListView.builder(
                                            itemCount:
                                                snapshot.data?.length ?? 0,
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context, index) {
                                              return CastCard(
                                                  actor: snapshot.data![index]);
                                            },
                                          ),
                                        );
                                      }
                                    },
                                  ),
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
            ),
          )
        ],
      ),
    );
  }
}
