import 'package:drift/drift.dart' as d;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jellyone/db/db.dart';
import 'package:jellyone/widgets/media_card.dart';
import 'package:jellyone/widgets/series_card.dart';

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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'LM',
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
                            behavior: const ScrollBehavior()
                                .copyWith(overscroll: false),
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
              'LS',
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
                            behavior: const ScrollBehavior()
                                .copyWith(overscroll: false),
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
      ),
    );
  }
}
