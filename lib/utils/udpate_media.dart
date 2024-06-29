import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/isolate.dart';
import 'package:jellyone/db/db.dart';
import 'package:video_parser/video_parser.dart';
import 'package:tmdb_api/tmdb_api.dart';

Future<void> updateMedia(List<dynamic> args) async {
  final DriftIsolate isolate = args[1];
  final envVars = args[0];

  final showsFolderPath = envVars['SHOWS_DIR'];
  final movieFolderPath = envVars['MOVIES_DIR'];

  final connection = await isolate.connect(singleClientMode: true);
  final database = AppDatabase(connection);

  var moviesDirectory = Directory(movieFolderPath!);
  var showsDirectory = Directory(showsFolderPath!);

//iterating movies over directories
  await for (var folder in moviesDirectory.list()) {
    await FileSystemEntity.isDirectory(folder.path).then((isDir) async {
      if (isDir) {
        //getting contents of the directory
        var movieDir = Directory(folder.path);
        await for (var file in movieDir.list()) {
          List<String> path;

          //splitting file path based on the OS
          if (Platform.isWindows) {
            path = file.path.split('\\');
          } else {
            path = file.path.split('/');
          }

          String name = path[path.length - 1];
          if (name.contains(RegExp(r'mkv|mp4|mov|avi|wmv|mpeg'))) {
            await addMovieToDB(database, name, envVars['API_KEY']!,
                envVars['ACCESS_TOKEN']!, file.path);
          }
          break;
        }
      } else {
        List<String> path;

        //splitting folder path based on the OS
        if (Platform.isWindows) {
          path = folder.path.split('\\');
        } else {
          path = folder.path.split('/');
        }

        String name = path[path.length - 1];
        if (name.contains(RegExp(r'mkv|mp4|mov|avi|wmv|mpeg'))) {
          await addMovieToDB(database, name, envVars['API_KEY']!,
              envVars['ACCESS_TOKEN']!, folder.path);
        }
      }
    });
  }

  await database.close();
}

Future addMovieToDB(AppDatabase database, String name, String apiKey,
    String accessToken, String filePath) async {
  final info = parseName(name);
  final movieExists = await database.getMovieFromName(info['name']!);
  if (movieExists.isNotEmpty || info.isEmpty) {
    return;
  }

  Map<String, dynamic> result;

  final tmdb = TMDB(
    ApiKeys(apiKey, accessToken),
  );

  if (info['year'] != null) {
    final res = await tmdb.v3.search.queryMovies(info['name']!,
        includeAdult: true, year: int.parse(info['year']!));
    result = res['results'][0];
  } else {
    final res =
        await tmdb.v3.search.queryMovies(info['name']!, includeAdult: true);
    result = res['results'][0];
  }

  String nonNullMovieName = info['name'] ?? 'Blah Blah';

  if (result != null) {
    await database
        .into($MoviesTableTable(database))
        .insert(MoviesTableCompanion(
          id: Value(result['id']),
          adult: Value(result['adult']),
          backdropPath: Value(result['backdrop_path']),
          originalTitle: Value(nonNullMovieName),
          overview: Value(result['overview']),
          posterPath: Value(result['poster_path']),
          resolution: Value(info['resolution'] ?? 'unavailable'),
          videoFile: Value(filePath),
          vote: Value(double.parse(result['vote_average'].toStringAsFixed(1))),
        ));
    print(result['original_title'] + ' inserted');
  }
}
