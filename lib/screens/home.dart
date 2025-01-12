import 'package:drift/drift.dart' as d;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jellyone/db/db.dart';
import 'package:jellyone/widgets/media_card.dart';
import 'package:jellyone/widgets/series_card.dart';
import 'package:jellyone/utils/custom_scroll.dart';
import 'package:jellyone/widgets/continue_watching_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List?> getMovies() {
    final database = AppDatabase();
    final allMovies = (database.select(database.moviesTable)
          ..where((tbl) => tbl.watchStatus.equals(0))
          ..orderBy([(t) => d.OrderingTerm.desc(t.releaseDate)])
          ..limit(9))
        .get();
    // print(allMovies);
    database.close();
    return allMovies;
  }

  Future<List?> getShows() {
    final database = AppDatabase();
    final allShows = (database.select(database.series)
          ..where((tbl) => tbl.watchStatus.equals(0))
          ..orderBy([(t) => d.OrderingTerm.desc(t.lastAirDate)])
          ..limit(9))
        .get();
    // print(allShows);
    database.close();
    return allShows;
  }

  Future<List<Map>> getWatching() async {
    final database = AppDatabase();
    List<Map<String, dynamic>> watching = [];

    final watchingEpisodes = await (database.select(database.episodes)
          ..where((tbl) => tbl.watchStatus.equals(1))
          ..limit(3))
        .get();

    final watchingMovies = await (database.select(database.moviesTable)
          ..where((tbl) => tbl.watchStatus.equals(1))
          ..limit(3))
        .get();
    for (var i = 0; i < watchingMovies.length; i++) {
      Map<String, dynamic> m = {};
      m['id'] = watchingMovies[i].id;
      m['name'] = watchingMovies[i].name;
      m['path'] = watchingMovies[i].videoFile;
      m['posterPath'] = watchingMovies[i].backdropPath;
      m['time'] = watchingMovies[i].watchedTime;
      m['type'] = 0;
      m['runtime'] = watchingMovies[i].runTime;
      watching.add(m);
    }

    for (var i = 0; i < watchingEpisodes.length; i++) {
      Map<String, dynamic> m = {};
      m['id'] = watchingEpisodes[i].id;
      m['name'] =
          "${watchingEpisodes[i].name} : Ep ${watchingEpisodes[i].number}";
      m['path'] = watchingEpisodes[i].filePath;
      m['posterPath'] = watchingEpisodes[i].posterPath;
      m['time'] = watchingEpisodes[i].watchedTime;
      m['runtime'] = watchingEpisodes[i].runTime;
      m['startIndex'] = 0;
      m['type'] = 1;
      watching.add(m);
    }

    database.close();
    return watching;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FutureBuilder(
              future: getWatching(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.data != null && snapshot.data!.isNotEmpty) {
                    return Column(children: [
                      const Text(
                        'Continue watching',
                        style: TextStyle(fontSize: 22),
                      ),
                      const SizedBox(width: double.infinity, height: 10),
                      SizedBox(
                        height: 242,
                        width: double.infinity,
                        child: ScrollConfiguration(
                          behavior: CustomScrollBehavior(),
                          child: ListView.builder(
                            itemCount: snapshot.data?.length ?? 0,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return ContinueWatchingCard(
                                id: snapshot.data![index]['id'],
                                name: snapshot.data![index]['name'] ?? 'Name',
                                filePath: snapshot.data![index]['path'],
                                posterPath: snapshot.data![index]['posterPath'],
                                type: snapshot.data![index]['type'],
                                time: snapshot.data![index]['time'],
                                runtime: snapshot.data![index]['runtime'],
                              );
                            },
                          ),
                        ),
                      )
                    ]);
                  }
                }
                return const SizedBox(height: 1);
              },
            ),
            const SizedBox(
              width: double.infinity,
              height: 13,
            ),
            const Text(
              'Latest Movies',
              style: TextStyle(fontSize: 22),
            ),
            const SizedBox(width: double.infinity, height: 10),
            SizedBox(
                height: 340,
                width: double.infinity,
                child: FutureBuilder(
                    future: getMovies(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.data != null) {
                          return ScrollConfiguration(
                            behavior: CustomScrollBehavior(),
                            child: ListView.builder(
                              itemCount: snapshot.data?.length ?? 0,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return MediaCard(movie: snapshot.data![index]);
                              },
                            ),
                          );
                        }
                      }
                      return const SizedBox(
                        height: 340,
                        child: Center(
                          child: Text('No movie found'),
                        ),
                      );
                    })),
            const SizedBox(
              width: double.infinity,
              height: 13,
            ),
            const Text(
              'Latest Shows',
              style: TextStyle(fontSize: 22),
            ),
            const SizedBox(width: double.infinity, height: 10),
            SizedBox(
                height: 340,
                width: double.infinity,
                child: FutureBuilder(
                    future: getShows(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.data != null) {
                          return ScrollConfiguration(
                            behavior: CustomScrollBehavior(),
                            child: ListView.builder(
                              itemCount: snapshot.data?.length ?? 0,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return SeriesCard(
                                    series: snapshot.data![index]);
                              },
                            ),
                          );
                        }
                      }
                      return const SizedBox(
                        height: 340,
                        child: Center(
                          child: Text('No shows found'),
                        ),
                      );
                    })),
            const SizedBox(width: double.infinity, height: 70),
          ],
        ),
      )),
    );
  }
}
