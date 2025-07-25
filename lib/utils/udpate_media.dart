import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:path/path.dart' as p;
import 'package:drift/drift.dart';
import 'package:drift/isolate.dart';
import 'package:logger/logger.dart' as l;
import 'package:jellyone/utils/logger.dart';
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

  var log = await customLogger(envVars['LOG_PATH']);

  var moviesDirectory = Directory(movieFolderPath!);
  var showsDirectory = Directory(showsFolderPath!);

  // database.clearTable();
  removeMoviesFromDb(database, log);
  removeSeriesFromDb(database, log);

  //iterating movies over directories
  await for (var folder in moviesDirectory.list()) {
    await FileSystemEntity.isDirectory(folder.path).then((isDir) async {
      await Future.delayed(const Duration(seconds: 5));
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
            try {
              await addMovieToDB(database, name, envVars['API_KEY']!,
                  envVars['ACCESS_TOKEN']!, log, file.path, folder.path);
            } catch (e) {
              log.e(e);
            }
          }
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
          try {
            await addMovieToDB(database, name, envVars['API_KEY']!,
                envVars['ACCESS_TOKEN']!, log, folder.path, null);
          } catch (e) {
            log.e(e);
          }
        }
      }
    });
  }

  await for (var folder in showsDirectory.list()) {
    await FileSystemEntity.isDirectory(folder.path).then((isDir) async {
      await Future.delayed(const Duration(seconds: 5));
      if (isDir) {
        //getting contents of the shows directory
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
            try {
              await addEpisodeToDB(database, name, envVars['API_KEY']!,
                  envVars['ACCESS_TOKEN']!, log, file.path, folder.path);
            } catch (e) {
              log.e(e);
            }
          }
        }
      }
    });
  }

  await database.close();
}

Future addMovieToDB(
    AppDatabase database,
    String name,
    String apiKey,
    String accessToken,
    l.Logger log,
    String filePath,
    String? subsFolder) async {

  if (name.contains("DS4K")) {
    name = name.replaceFirst("DS4K", "4K");
  }

  var info = parseName(name);
  final movieExists = await database.getMovieFromName(info['name']!);
  if (movieExists.isNotEmpty || info.isEmpty) {
    if (movieExists.isNotEmpty) {
      log.i('Movie: $name found');
    } else {
      log.e('Movie: $name info not found');
    }
    return;
  }

  Map<String, dynamic> result;

  final tmdb = TMDB(
    ApiKeys(apiKey, accessToken),
    logConfig: const ConfigLogger(
      showLogs: true,
      showErrorLogs: true,
    ),
  );

  // search for movie from file name
  if (info['year'] != null) {
    log.i('${info['name']} - ${info['year']} ');
    final res = await tmdb.v3.search.queryMovies(info['name']!,
        includeAdult: true, year: int.parse(info['year']!));
    result = res['results'][0];
  } else {
    final res =
        await tmdb.v3.search.queryMovies(info['name']!, includeAdult: true);
    result = res['results'][0];
  }

  // get movie details from id
  final id = result['id'];
  if (id != null) {
    final imdbInfo = await tmdb.v3.movies.getDetails(id);

    if (imdbInfo.isNotEmpty) {
      final imgs = await tmdb.v3.movies.getImages(id, language: 'en');
      if (imgs.isNotEmpty && imgs['logos'].length > 0) {
        final logoPath = imgs['logos'][0]['file_path'];
        DateTime releaseDate = DateTime.parse(imdbInfo['release_date']);
        String nonNullMovieName = info['name'] ?? 'Blah Blah';
        try {
          String? subtitleFolder = subsFolder;
          if (subsFolder != null) {
            String subs = p.join(subsFolder, 'Subs');
            if (await Directory(subs).exists()) {
              subtitleFolder = subs;
            }
            subs = p.join(subsFolder, 'subs');
            if (await Directory(subs).exists()) {
              subtitleFolder = subs;
            }
            subs = p.join(subsFolder, 'subtitles');
            if (await Directory(subs).exists()) {
              subtitleFolder = subs;
            }
            subs = p.join(subsFolder, 'Subtitles');
            if (await Directory(subs).exists()) {
              subtitleFolder = subs;
            }
          }

          await database
              .into($MoviesTableTable(database))
              .insert(MoviesTableCompanion(
                id: Value(imdbInfo['id']),
                adult: Value(imdbInfo['adult']),
                backdropPath: Value(imdbInfo['backdrop_path']),
                name: Value(nonNullMovieName),
                tagLine: Value(imdbInfo['tagline']),
                overview: Value(imdbInfo['overview']),
                posterPath: Value(imdbInfo['poster_path']),
                logoPath: Value(logoPath ?? '/fcIKzqbhtlUeWOvYjFdkR8rZOAC.png'),
                resolution: Value(info['resolution'] ?? 'unavailable'),
                homePage: Value(imdbInfo['homepage']),
                releaseDate: Value(releaseDate),
                imdb: Value(imdbInfo['imdb_id']),
                videoFile: Value(filePath),
                subtitlesFolder: Value(subtitleFolder),
                vote: Value(
                    double.parse(imdbInfo['vote_average'].toStringAsFixed(1))),
                runTime: Value(imdbInfo['runtime']),
              ));
          log.i('Movie: ${result['original_title']} inserted');
        } catch (e) {
          log.e(e);
        }

        log.i('------------------- adding genre --------------');
        for (var genre in imdbInfo['genres']) {
          try {
            await database.into(database.genres).insertOnConflictUpdate(
                GenresCompanion(
                    id: Value(genre['id']), name: Value(genre['name'])));

            await database.into(database.movieGenres).insertOnConflictUpdate(
                MovieGenresCompanion(
                    movieId: Value(imdbInfo['id']),
                    genreId: Value(genre['id'])));
          } catch (e) {
            log.e(e);
          }
        }

        log.i('------------------- getting cast --------------');
        final castInfo = await tmdb.v3.movies.getCredits(id);
        if (castInfo.isNotEmpty) {
          final cast = castInfo['cast'];
          for (var i = 0; i < min(cast.length, 15); i++) {
            if (cast[i]['profile_path'] == null) continue;
            if (cast[i]['known_for_department'] == 'Acting') {
              try {
                await database.into(database.actors).insertOnConflictUpdate(
                    ActorsCompanion.insert(
                        id: Value(cast[i]['id']),
                        name: cast[i]['name'],
                        profilePath: cast[i]['profile_path']));
                await database.into(database.movieCast).insertOnConflictUpdate(
                    MovieCastCompanion(
                        actorId: Value(cast[i]['id']),
                        movieId: Value(id),
                        role: const Value('Actor'),
                        as: Value(cast[i]['character'])));
                log.i('Cast: ${cast[i]['name']} inserted');
              } catch (e) {
                log.e(e);
              }
            }
          }

          final crew = castInfo['crew'];
          for (var i = 0; i < crew.length; i++) {
            if (crew[i]['profile_path'] == null) continue;
            String role = crew[i]['job'];
            if (role != 'Screenplay' &&
                role != 'Producer' &&
                role != 'Director') {
              continue;
            }
            if (role == 'Screenplay') role = 'Writer';

            try {
              await database.into(database.actors).insertOnConflictUpdate(
                  ActorsCompanion.insert(
                      id: Value(crew[i]['id']),
                      name: crew[i]['name'],
                      profilePath: crew[i]['profile_path']));

              await database
                  .into(database.movieCast)
                  .insertOnConflictUpdate(MovieCastCompanion(
                    actorId: Value(crew[i]['id']),
                    movieId: Value(id),
                    role: Value(role),
                    as: Value(role),
                  ));
              log.i('Crew: ${crew[i]['name']} $role inserted');
            } catch (e) {
              log.e(e);
            }
          }
        }
      }
    }

    // await Future.delayed(const Duration(seconds: 5));
  }
}

Future addEpisodeToDB(
    AppDatabase database,
    String name,
    String apiKey,
    String accessToken,
    l.Logger log,
    String filePath,
    String folderPath) async {
  var info = parseName(name);
  log.i(info);

  if (info.isEmpty) {
    return;
  }

  final tmdb = TMDB(
    ApiKeys(apiKey, accessToken),
    logConfig: const ConfigLogger(
      showLogs: true,
      showErrorLogs: true,
    ),
  );
  int seriesId = 0;

  final seriesExists = await database.getSeriesFromName(info['name']!);

  if (seriesExists.isNotEmpty) {
    seriesId = seriesExists[0].id;
    log.i('SERIES FOUND');
    final seasonExists =
        await database.getSeasonFromId(int.parse(info['season']!), seriesId);
    if (seasonExists.isNotEmpty && seasonExists.isNotEmpty) {
      log.i('SEASON FOUND');
      final epExists = await database.getEpisodeFromId(
          int.parse(info['episode']!), seasonExists[0].id);
      if (epExists.isNotEmpty && epExists.isNotEmpty) {
        log.i('EP FOUND');
        return;
      }
    }
  } else {
    Map<String, dynamic> result;

    // search for movie from file name
    final res = await tmdb.v3.search.queryTvShows(info['name']!);

    if (res['results'].length != 0) {
      result = res['results'][0];
      final id = result['id'];
      if (id != null) {
        final imdbInfo = await tmdb.v3.tv.getDetails(id);
        seriesId = imdbInfo['id'];
        final imgs = await tmdb.v3.tv.getImages(id, language: 'en');
        if (imdbInfo.isNotEmpty &&
            imgs.isNotEmpty &&
            imgs['logos'].length > 0) {
          final logoPath = imgs['logos'][0]['file_path'];
          String nonNullMovieName = info['name'] ?? 'Blah Blah';
          DateTime firstDate = DateTime.parse(imdbInfo['first_air_date']);
          DateTime lastDate = DateTime.parse(imdbInfo['last_air_date']);

          try {
            await database.into($SeriesTable(database)).insert(SeriesCompanion(
                id: Value(imdbInfo['id']),
                backdropPath: Value(imdbInfo['backdrop_path']),
                name: Value(nonNullMovieName),
                tagLine: Value(imdbInfo['tagline']),
                overview: Value(imdbInfo['overview']),
                logoPath: Value(logoPath),
                posterPath: Value(imdbInfo['poster_path']),
                homePage: Value(imdbInfo['homepage']),
                vote: Value(
                    double.parse(imdbInfo['vote_average'].toStringAsFixed(1))),
                firstAirDate: Value(firstDate),
                lastAirDate: Value(lastDate)));
            log.i('Show: ${result['original_name']} inserted');
          } catch (e) {
            log.e(e);
          }

          log.i('------------------- adding TV genre --------------');
          for (var genre in imdbInfo['genres']) {
            try {
              await database.into(database.genres).insertOnConflictUpdate(
                  GenresCompanion(
                      id: Value(genre['id']), name: Value(genre['name'])));

              await database.into(database.tvGenres).insertOnConflictUpdate(
                  TvGenresCompanion(
                      seriesId: Value(imdbInfo['id']),
                      genreId: Value(genre['id'])));
            } catch (e) {
              log.e(e);
            }
          }

          log.i('------------------- getting TV cast --------------');
          final castInfo = await tmdb.v3.tv.getCredits(id);
          if (castInfo.isNotEmpty) {
            final cast = castInfo['cast'];
            for (var i = 0; i < min(cast.length, 15); i++) {
              if (cast[i]['profile_path'] == null) continue;
              if (cast[i]['known_for_department'] == 'Acting') {
                try {
                  await database.into(database.actors).insertOnConflictUpdate(
                      ActorsCompanion.insert(
                          id: Value(cast[i]['id']),
                          name: cast[i]['name'],
                          profilePath: cast[i]['profile_path']));
                  await database.into(database.tvCast).insertOnConflictUpdate(
                      TvCastCompanion(
                          actorId: Value(cast[i]['id']),
                          seriesId: Value(id),
                          role: const Value('Actor'),
                          as: Value(cast[i]['character'])));
                  log.i('TV Cast: ${cast[i]['name']} inserted');
                } catch (e) {
                  log.e(e);
                }
              }
            }
            final crew = castInfo['crew'];
            for (var i = 0; i < crew.length; i++) {
              String role = crew[i]['job'];
              if (role != 'Screenplay' &&
                  role != 'Producer' &&
                  role != 'Series Director') {
                continue;
              }
              if (role == 'Screenplay') role = 'Writer';

              try {
                await database.into(database.actors).insertOnConflictUpdate(
                    ActorsCompanion.insert(
                        id: Value(crew[i]['id']),
                        name: crew[i]['name'],
                        profilePath: crew[i]['profile_path'] ?? ''));

                await database
                    .into(database.tvCast)
                    .insertOnConflictUpdate(TvCastCompanion(
                      actorId: Value(crew[i]['id']),
                      seriesId: Value(id),
                      role: Value(role),
                      as: Value(role),
                    ));
                log.i('Crew: ${crew[i]['name']} $role inserted');
              } catch (e) {
                log.e(e);
              }
            }
          }
        } else {
          return;
        }
      }
    }
  }
  if (seriesId != 0) {
    final seasonNumber = int.parse(info['season'] ?? '1');

    final seasonExists = await database.getSeasonFromId(seasonNumber, seriesId);
    int seasonId = 0;

    if (seasonExists.isNotEmpty) {
      seasonId = seasonExists[0].id;
    }

    if (seasonExists.isEmpty) {
      log.i('season not found');
      final s = await tmdb.v3.tvSeasons.getDetails(seriesId, seasonNumber);
      seasonId = s['id'];
      if (s.isNotEmpty) {
        try {
          database.into(database.seasons).insert(SeasonsCompanion(
              id: Value(s['id']),
              seriesid: Value(seriesId),
              number: Value(seasonNumber),
              overview:
                  Value(s['overview'] == '' ? 'No overview' : s['overview']),
              posterPath: Value(s['poster_path']),
              seasonFolder: Value(folderPath),
              airDate: Value(DateTime.parse(s['air_date'])),
              vote: Value(double.parse(s['vote_average'].toStringAsFixed(1)))));
          log.i('TV Season: ${info['name']} ${info['season']} inserted');
        } catch (e) {
          log.e(e);
        }
      }
    }

    final epExists =
        await database.getEpisodeFromId(int.parse(info['episode']!), seasonId);

    if (epExists.isEmpty) {
      final ep = await tmdb.v3.tvEpisodes.getDetails(
          seriesId, int.parse(info['season']!), int.parse(info['episode']!));

      if (ep.isNotEmpty) {
        try {
          database.into(database.episodes).insert(EpisodesCompanion(
              id: Value(ep['id']),
              seasonid: Value(seasonId),
              number: Value(int.parse(info['episode']!)),
              name: Value(ep['name']),
              overview: Value(ep['overview']),
              posterPath: Value(ep['still_path']),
              filePath: Value(filePath),
              airDate: Value(DateTime.parse(ep['air_date'])),
              vote: Value(ep['vote_average']),
              runTime: Value(ep['runtime'])));
          log.i(
              'TV Episode: ${info['name']} ${info['season']} ${info['episode']} inserted');
        } catch (e) {
          log.e(e);
        }
      }
    }
  }
}

void removeMoviesFromDb(AppDatabase database, l.Logger log) async {
  var allMovies = await database.getAllMovies();
  for (var i = 0; i < allMovies.length; i++) {
    File file = File(allMovies[i].videoFile);
    if (file.existsSync()) {
      log.i("Movie exists - ${allMovies[i].name}");
    } else {
      await database.removeMovie(allMovies[i].id);
      log.w("Movie removed - ${allMovies[i].name}");
    }
  }
}

void removeSeriesFromDb(AppDatabase database, l.Logger log) async {
  var allSeries = await database.select(database.series).get();

  for (int i = 0; i < allSeries.length; i++) {
    var seasons = await database.getSeasonsFromSeriesId(allSeries[i].id);
    int seasonCount = seasons.length;

    for (var j = 0; j < seasons.length; j++) {
      Directory dir = Directory(seasons[j].seasonFolder);
      if (dir.existsSync()) {
        log.i(
            "Season exists - ${allSeries[i].name} season - ${seasons[j].number}");
        var episodes = await database.getEpisodesFromSeasonId(seasons[j].id);
        int episodeCount = episodes.length;

        for (var k = 0; k < episodes.length; k++) {
          File file = File(episodes[k].filePath);
          if (file.existsSync()) {
            log.i("Episode exists - ${episodes[k].number}");
          } else {
            await database.removeEpisode(episodes[k].id);
            log.w("Episode removed - ${episodes[k].number}");
            episodeCount--;
          }
        }

        if (episodeCount == 0) {
          await database.removeSeason(seasons[j].id);
          log.w(
              "Season removed - ${allSeries[i].name} season - ${seasons[j].number}");
          seasonCount--;
        }
      } else {
        await database.removeSeason(seasons[j].id);
        log.w(
            "Season removed - ${allSeries[i].name} season - ${seasons[j].number}");
        seasonCount--;
      }
    }

    if (seasonCount == 0) {
      await database.removeSeries(allSeries[i].id);
      log.w("Series removed - ${allSeries[i].name}");
    }
  }
}

// TODO:add vid file to db only if .mkv .mp4 not owrking

