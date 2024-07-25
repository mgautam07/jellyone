import 'package:flutter/material.dart';
import 'package:drift/drift.dart' as d;

import 'package:jellyone/db/db.dart';
import 'package:jellyone/theme/app_styles.dart';
import 'package:jellyone/widgets/media_card.dart';

Future<List?> getMovies() async {
  final database = AppDatabase();
  final allMovies = await (database.select(database.moviesTable)
        ..orderBy([(t) => d.OrderingTerm.asc(t.name)]))
      .get();
  database.close();
  return allMovies;
}

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.all(24.0),
      child: SizedBox(
        width: double.infinity,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            width: double.infinity,
            child: Center(
                child: Text(
              'Movies',
              style: TextStyle(
                  fontSize: 96,
                  color: AppTheme.medium,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -4.0),
            )),
          ),
          FutureBuilder(
              future: getMovies(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: SizedBox(
                      width: 500,
                      height: 500,
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Text('No movies found',
                      style: TextStyle(fontSize: 15));
                } else {
                  double width = MediaQuery.of(context).size.width;
                  int count = 1;
                  if (width > 549 && width < 761) {
                    count = 2;
                  } else if (width >= 761 && width < 972) {
                    count = 3;
                  } else if (width >= 972 && width <= 1182) {
                    count = 4;
                  } else if (width >= 1183 && width < 1394) {
                    count = 5;
                  } else if (width >= 1394) {
                    count = ((width - 248) / 196).floor();
                  }

                  if (snapshot.data!.length <= count) {
                    return Column(children: [
                      GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: count,
                            childAspectRatio: (195 / 310),
                          ),
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return MediaCard(movie: snapshot.data![index]);
                          }),
                      const SizedBox(height: 400)
                    ]);
                  }
                  return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: count,
                        childAspectRatio: (195 / 310),
                      ),
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return MediaCard(movie: snapshot.data![index]);
                      });
                }
              })
        ]),
      ),
    ));
  }
}
