import 'package:drift/drift.dart';
import 'package:drift/isolate.dart';

import 'dart:io';
import 'package:drift/native.dart';
import 'package:flutter/services.dart';
import 'package:jellyone/db/tables/tv_cast.dart';
import 'package:jellyone/db/tables/tv_genres.dart';

import 'package:path_provider/path_provider.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

import 'package:jellyone/db/tables/movies.dart';
import 'package:jellyone/db/tables/series.dart';
import 'package:jellyone/db/tables/seasons.dart';
import 'package:jellyone/db/tables/episodes.dart';
import 'package:jellyone/db/tables/actors.dart';
import 'package:jellyone/db/tables/genres.dart';
import 'package:jellyone/db/tables/movie_cast.dart';
import 'package:jellyone/db/tables/movie_genres.dart';

part 'db.g.dart';

@DriftDatabase(tables: [
  MoviesTable,
  Series,
  Seasons,
  Episodes,
  Actors,
  MovieCast,
  Genres,
  MovieGenres,
  TvGenres,
  TvCast
])
class AppDatabase extends _$AppDatabase {
  // AppDatabase(QueryExecutor e) : super(e);
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());
  var logger = Logger();

  @override
  int get schemaVersion => 1;

  Future<List<MoviesTableData>> getMovieFromName(String name) async {
    try {
      final result =
          await (select(moviesTable)..where((r) => r.name.equals(name))).get();
      return result;
    } catch (e) {
      logger.e('Error: $e');
      return [];
    }
  }

  Future<List<Sery>> getSeriesFromName(String name) async {
    try {
      final result =
          await (select(series)..where((r) => r.name.equals(name))).get();
      return result;
    } catch (e) {
      logger.e('Error: $e');
      return [];
    }
  }

  Future<List<Season>>? getSeasonFromId(int seasonNumber, int id) {
    try {
      final result = (select(seasons)
            ..where(
                (r) => (r.number.equals(seasonNumber) & r.seriesid.equals(id))))
          .get();
      return result;
    } catch (e) {
      logger.e('Error: $e');
      return null;
    }
  }

  Future<List<Episode>>? getEpisodeFromId(int episodeNumber, int id) {
    try {
      final result = (select(episodes)
            ..where((r) =>
                (r.number.equals(episodeNumber) & r.seasonid.equals(id))))
          .get();
      return result;
    } catch (e) {
      logger.e('Error: $e');
      return null;
    }
  }

  Future<List<MoviesTableData>> getAllMovies() {
    return (select(moviesTable)).get();
  }

  Future<List<MovieCastData>> getCompleteCast(int id) {
    return (select(movieCast)..where((tbl) => tbl.movieId.equals(id))).get();
  }

  Future<dynamic> getCast(int id) {
    return (select(actors)..where((tbl) => tbl.id.equals(id))).get();
  }

  void clearTable() async {
    await delete(moviesTable).go();
    await delete(actors).go();
    await delete(movieCast).go();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationSupportDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    final cacheBase = (await getTemporaryDirectory()).path;
    sqlite3.tempDirectory = cacheBase;

    return NativeDatabase.createInBackground(file);
  });
}

Future<DriftIsolate> createDBIsolate() async {
  final token = RootIsolateToken.instance;
  return await DriftIsolate.spawn(() {
    if (token != null) {
      BackgroundIsolateBinaryMessenger.ensureInitialized(token);
    }

    return LazyDatabase(() async {
      final dbFolder = await getApplicationSupportDirectory();
      final path = p.join(dbFolder.path, 'db.sqlite');

      return NativeDatabase(File(path));
    });
  });
}
