import 'package:drift/drift.dart';
import 'package:drift/isolate.dart';

import 'dart:io';
import 'package:drift/native.dart';
import 'package:flutter/services.dart';
import 'package:jellyone/db/tables/tv_cast.dart';
import 'package:jellyone/db/tables/tv_genres.dart';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
// ignore: depend_on_referenced_packages
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

  @override
  int get schemaVersion => 1;

  Future<List<MoviesTableData>> getMovieFromName(String name) async {
    try {
      final result =
          await (select(moviesTable)..where((r) => r.name.equals(name))).get();
      return result;
    } catch (e) {
      return [];
    }
  }

  Future<List<Sery>> getSeriesFromName(String name) async {
    try {
      final result =
          await (select(series)..where((r) => r.name.equals(name))).get();
      return result;
    } catch (e) {
      return [];
    }
  }

  Future<List<Season>> getSeasonFromId(int seasonNumber, int id) async {
    try {
      final result = (select(seasons)
            ..where(
                (r) => (r.number.equals(seasonNumber) & r.seriesid.equals(id))))
          .get();
      return result;
    } catch (e) {
      return [];
    }
  }

  Future<List<Episode>> getEpisodeFromId(int episodeNumber, int id) async {
    try {
      final result = (select(episodes)
            ..where((r) =>
                (r.number.equals(episodeNumber) & r.seasonid.equals(id))))
          .get();
      return result;
    } catch (e) {
      return [];
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

  Future<List<Season>> getSeasonsFromSeriesId(int id) {
    return (select(seasons)..where((s) => s.seriesid.equals(id))).get();
  }

  Future<List<Episode>> getEpisodesFromSeasonId(int id) {
    return (select(episodes)..where((s) => s.seasonid.equals(id))).get();
  }

  Future removeMovie(int id) async {
    var actorLink =
        await (select(movieCast)..where((c) => c.movieId.equals(id))).get();

    //Delete actor if not linked with any other movie
    for (int i = 0; i < actorLink.length; i++) {
      var cast = await (select(movieCast)
            ..where((c) => c.actorId.equals(actorLink[i].actorId)))
          .get();
      if (cast.length == 1) {
        await (delete(actors)..where((a) => a.id.equals(actorLink[i].actorId)))
            .go();
      }
    }
    await (delete(movieCast)..where((c) => c.movieId.equals(id))).go();
    await (delete(movieGenres)..where((g) => g.movieId.equals(id))).go();

    return (delete(moviesTable)..where((m) => m.id.equals(id))).go();
  }

  Future removeSeries(int id) async {
    var actorLink =
        await (select(tvCast)..where((c) => c.seriesId.equals(id))).get();

    //Delete actor if not linked with any other series
    for (int i = 0; i < actorLink.length; i++) {
      var cast = await (select(tvCast)
            ..where((c) => c.actorId.equals(actorLink[i].actorId)))
          .get();
      if (cast.length == 1) {
        await (delete(actors)..where((a) => a.id.equals(actorLink[i].actorId)))
            .go();
      }
    }
    await (delete(tvCast)..where((c) => c.seriesId.equals(id))).go();
    await (delete(tvGenres)..where((g) => g.seriesId.equals(id))).go();

    return (delete(series)..where((s) => s.id.equals(id))).go();
  }

  Future removeSeason(int id) {
    return (delete(seasons)..where((s) => s.id.equals(id))).go();
  }

  Future removeEpisode(int id) {
    return (delete(episodes)..where((e) => e.id.equals(id))).go();
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
