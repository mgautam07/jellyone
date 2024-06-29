import 'package:drift/drift.dart';
import 'package:drift/isolate.dart';

import 'dart:io';
import 'package:drift/native.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

import 'package:jellyone/db/tables/movies.dart';
import 'package:jellyone/db/tables/series.dart';
import 'package:jellyone/db/tables/seasons.dart';
import 'package:jellyone/db/tables/episodes.dart';

part 'db.g.dart';

@DriftDatabase(tables: [MoviesTable, Series, Seasons, Episodes])
class AppDatabase extends _$AppDatabase {
  AppDatabase(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;

  Future<List<MoviesTableData>> getMovieFromName(String name) async {
    try {
      final result = await (select(moviesTable)
            ..where((r) => r.originalTitle.equals(name)))
          .get();
      return result;
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }

  Future<List<MoviesTableData>> getAllMovies() {
    return (select(moviesTable)).get();
  }

  void clearTable() async {
    await delete(moviesTable).go();
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
      final dbFolder = await getApplicationDocumentsDirectory();
      final path = p.join(dbFolder.path, 'db.sqlite');

      return NativeDatabase(File(path));
    });
  });
}
