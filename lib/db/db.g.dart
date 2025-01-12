// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// ignore_for_file: type=lint
class $MoviesTableTable extends MoviesTable
    with TableInfo<$MoviesTableTable, MoviesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MoviesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _adultMeta = const VerificationMeta('adult');
  @override
  late final GeneratedColumn<bool> adult = GeneratedColumn<bool>(
      'adult', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("adult" IN (0, 1))'));
  static const VerificationMeta _backdropPathMeta =
      const VerificationMeta('backdropPath');
  @override
  late final GeneratedColumn<String> backdropPath = GeneratedColumn<String>(
      'backdrop_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _tagLineMeta =
      const VerificationMeta('tagLine');
  @override
  late final GeneratedColumn<String> tagLine = GeneratedColumn<String>(
      'tag_line', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _overviewMeta =
      const VerificationMeta('overview');
  @override
  late final GeneratedColumn<String> overview = GeneratedColumn<String>(
      'overview', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _posterPathMeta =
      const VerificationMeta('posterPath');
  @override
  late final GeneratedColumn<String> posterPath = GeneratedColumn<String>(
      'poster_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _logoPathMeta =
      const VerificationMeta('logoPath');
  @override
  late final GeneratedColumn<String> logoPath = GeneratedColumn<String>(
      'logo_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _videoFileMeta =
      const VerificationMeta('videoFile');
  @override
  late final GeneratedColumn<String> videoFile = GeneratedColumn<String>(
      'video_file', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _subtitlesFolderMeta =
      const VerificationMeta('subtitlesFolder');
  @override
  late final GeneratedColumn<String> subtitlesFolder = GeneratedColumn<String>(
      'subtitles_folder', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _resolutionMeta =
      const VerificationMeta('resolution');
  @override
  late final GeneratedColumn<String> resolution = GeneratedColumn<String>(
      'resolution', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _homePageMeta =
      const VerificationMeta('homePage');
  @override
  late final GeneratedColumn<String> homePage = GeneratedColumn<String>(
      'home_page', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _releaseDateMeta =
      const VerificationMeta('releaseDate');
  @override
  late final GeneratedColumn<DateTime> releaseDate = GeneratedColumn<DateTime>(
      'release_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _imdbMeta = const VerificationMeta('imdb');
  @override
  late final GeneratedColumn<String> imdb = GeneratedColumn<String>(
      'imdb', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _voteMeta = const VerificationMeta('vote');
  @override
  late final GeneratedColumn<double> vote = GeneratedColumn<double>(
      'vote', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _watchedTimeMeta =
      const VerificationMeta('watchedTime');
  @override
  late final GeneratedColumn<int> watchedTime = GeneratedColumn<int>(
      'watched_time', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _watchStatusMeta =
      const VerificationMeta('watchStatus');
  @override
  late final GeneratedColumn<int> watchStatus = GeneratedColumn<int>(
      'watch_status', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _runTimeMeta =
      const VerificationMeta('runTime');
  @override
  late final GeneratedColumn<int> runTime = GeneratedColumn<int>(
      'run_time', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        adult,
        backdropPath,
        name,
        tagLine,
        overview,
        posterPath,
        logoPath,
        videoFile,
        subtitlesFolder,
        resolution,
        homePage,
        releaseDate,
        imdb,
        vote,
        watchedTime,
        watchStatus,
        runTime
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'movies_table';
  @override
  VerificationContext validateIntegrity(Insertable<MoviesTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('adult')) {
      context.handle(
          _adultMeta, adult.isAcceptableOrUnknown(data['adult']!, _adultMeta));
    } else if (isInserting) {
      context.missing(_adultMeta);
    }
    if (data.containsKey('backdrop_path')) {
      context.handle(
          _backdropPathMeta,
          backdropPath.isAcceptableOrUnknown(
              data['backdrop_path']!, _backdropPathMeta));
    } else if (isInserting) {
      context.missing(_backdropPathMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('tag_line')) {
      context.handle(_tagLineMeta,
          tagLine.isAcceptableOrUnknown(data['tag_line']!, _tagLineMeta));
    } else if (isInserting) {
      context.missing(_tagLineMeta);
    }
    if (data.containsKey('overview')) {
      context.handle(_overviewMeta,
          overview.isAcceptableOrUnknown(data['overview']!, _overviewMeta));
    } else if (isInserting) {
      context.missing(_overviewMeta);
    }
    if (data.containsKey('poster_path')) {
      context.handle(
          _posterPathMeta,
          posterPath.isAcceptableOrUnknown(
              data['poster_path']!, _posterPathMeta));
    } else if (isInserting) {
      context.missing(_posterPathMeta);
    }
    if (data.containsKey('logo_path')) {
      context.handle(_logoPathMeta,
          logoPath.isAcceptableOrUnknown(data['logo_path']!, _logoPathMeta));
    } else if (isInserting) {
      context.missing(_logoPathMeta);
    }
    if (data.containsKey('video_file')) {
      context.handle(_videoFileMeta,
          videoFile.isAcceptableOrUnknown(data['video_file']!, _videoFileMeta));
    } else if (isInserting) {
      context.missing(_videoFileMeta);
    }
    if (data.containsKey('subtitles_folder')) {
      context.handle(
          _subtitlesFolderMeta,
          subtitlesFolder.isAcceptableOrUnknown(
              data['subtitles_folder']!, _subtitlesFolderMeta));
    }
    if (data.containsKey('resolution')) {
      context.handle(
          _resolutionMeta,
          resolution.isAcceptableOrUnknown(
              data['resolution']!, _resolutionMeta));
    } else if (isInserting) {
      context.missing(_resolutionMeta);
    }
    if (data.containsKey('home_page')) {
      context.handle(_homePageMeta,
          homePage.isAcceptableOrUnknown(data['home_page']!, _homePageMeta));
    } else if (isInserting) {
      context.missing(_homePageMeta);
    }
    if (data.containsKey('release_date')) {
      context.handle(
          _releaseDateMeta,
          releaseDate.isAcceptableOrUnknown(
              data['release_date']!, _releaseDateMeta));
    } else if (isInserting) {
      context.missing(_releaseDateMeta);
    }
    if (data.containsKey('imdb')) {
      context.handle(
          _imdbMeta, imdb.isAcceptableOrUnknown(data['imdb']!, _imdbMeta));
    } else if (isInserting) {
      context.missing(_imdbMeta);
    }
    if (data.containsKey('vote')) {
      context.handle(
          _voteMeta, vote.isAcceptableOrUnknown(data['vote']!, _voteMeta));
    } else if (isInserting) {
      context.missing(_voteMeta);
    }
    if (data.containsKey('watched_time')) {
      context.handle(
          _watchedTimeMeta,
          watchedTime.isAcceptableOrUnknown(
              data['watched_time']!, _watchedTimeMeta));
    }
    if (data.containsKey('watch_status')) {
      context.handle(
          _watchStatusMeta,
          watchStatus.isAcceptableOrUnknown(
              data['watch_status']!, _watchStatusMeta));
    }
    if (data.containsKey('run_time')) {
      context.handle(_runTimeMeta,
          runTime.isAcceptableOrUnknown(data['run_time']!, _runTimeMeta));
    } else if (isInserting) {
      context.missing(_runTimeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  MoviesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MoviesTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      adult: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}adult'])!,
      backdropPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}backdrop_path'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      tagLine: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tag_line'])!,
      overview: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}overview'])!,
      posterPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}poster_path'])!,
      logoPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}logo_path'])!,
      videoFile: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}video_file'])!,
      subtitlesFolder: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}subtitles_folder']),
      resolution: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}resolution'])!,
      homePage: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}home_page'])!,
      releaseDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}release_date'])!,
      imdb: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}imdb'])!,
      vote: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}vote'])!,
      watchedTime: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}watched_time'])!,
      watchStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}watch_status'])!,
      runTime: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}run_time'])!,
    );
  }

  @override
  $MoviesTableTable createAlias(String alias) {
    return $MoviesTableTable(attachedDatabase, alias);
  }
}

class MoviesTableData extends DataClass implements Insertable<MoviesTableData> {
  final int id;
  final bool adult;
  final String backdropPath;
  final String name;
  final String tagLine;
  final String overview;
  final String posterPath;
  final String logoPath;
  final String videoFile;
  final String? subtitlesFolder;
  final String resolution;
  final String homePage;
  final DateTime releaseDate;
  final String imdb;
  final double vote;
  final int watchedTime;
  final int watchStatus;
  final int runTime;
  const MoviesTableData(
      {required this.id,
      required this.adult,
      required this.backdropPath,
      required this.name,
      required this.tagLine,
      required this.overview,
      required this.posterPath,
      required this.logoPath,
      required this.videoFile,
      this.subtitlesFolder,
      required this.resolution,
      required this.homePage,
      required this.releaseDate,
      required this.imdb,
      required this.vote,
      required this.watchedTime,
      required this.watchStatus,
      required this.runTime});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['adult'] = Variable<bool>(adult);
    map['backdrop_path'] = Variable<String>(backdropPath);
    map['name'] = Variable<String>(name);
    map['tag_line'] = Variable<String>(tagLine);
    map['overview'] = Variable<String>(overview);
    map['poster_path'] = Variable<String>(posterPath);
    map['logo_path'] = Variable<String>(logoPath);
    map['video_file'] = Variable<String>(videoFile);
    if (!nullToAbsent || subtitlesFolder != null) {
      map['subtitles_folder'] = Variable<String>(subtitlesFolder);
    }
    map['resolution'] = Variable<String>(resolution);
    map['home_page'] = Variable<String>(homePage);
    map['release_date'] = Variable<DateTime>(releaseDate);
    map['imdb'] = Variable<String>(imdb);
    map['vote'] = Variable<double>(vote);
    map['watched_time'] = Variable<int>(watchedTime);
    map['watch_status'] = Variable<int>(watchStatus);
    map['run_time'] = Variable<int>(runTime);
    return map;
  }

  MoviesTableCompanion toCompanion(bool nullToAbsent) {
    return MoviesTableCompanion(
      id: Value(id),
      adult: Value(adult),
      backdropPath: Value(backdropPath),
      name: Value(name),
      tagLine: Value(tagLine),
      overview: Value(overview),
      posterPath: Value(posterPath),
      logoPath: Value(logoPath),
      videoFile: Value(videoFile),
      subtitlesFolder: subtitlesFolder == null && nullToAbsent
          ? const Value.absent()
          : Value(subtitlesFolder),
      resolution: Value(resolution),
      homePage: Value(homePage),
      releaseDate: Value(releaseDate),
      imdb: Value(imdb),
      vote: Value(vote),
      watchedTime: Value(watchedTime),
      watchStatus: Value(watchStatus),
      runTime: Value(runTime),
    );
  }

  factory MoviesTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MoviesTableData(
      id: serializer.fromJson<int>(json['id']),
      adult: serializer.fromJson<bool>(json['adult']),
      backdropPath: serializer.fromJson<String>(json['backdropPath']),
      name: serializer.fromJson<String>(json['name']),
      tagLine: serializer.fromJson<String>(json['tagLine']),
      overview: serializer.fromJson<String>(json['overview']),
      posterPath: serializer.fromJson<String>(json['posterPath']),
      logoPath: serializer.fromJson<String>(json['logoPath']),
      videoFile: serializer.fromJson<String>(json['videoFile']),
      subtitlesFolder: serializer.fromJson<String?>(json['subtitlesFolder']),
      resolution: serializer.fromJson<String>(json['resolution']),
      homePage: serializer.fromJson<String>(json['homePage']),
      releaseDate: serializer.fromJson<DateTime>(json['releaseDate']),
      imdb: serializer.fromJson<String>(json['imdb']),
      vote: serializer.fromJson<double>(json['vote']),
      watchedTime: serializer.fromJson<int>(json['watchedTime']),
      watchStatus: serializer.fromJson<int>(json['watchStatus']),
      runTime: serializer.fromJson<int>(json['runTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'adult': serializer.toJson<bool>(adult),
      'backdropPath': serializer.toJson<String>(backdropPath),
      'name': serializer.toJson<String>(name),
      'tagLine': serializer.toJson<String>(tagLine),
      'overview': serializer.toJson<String>(overview),
      'posterPath': serializer.toJson<String>(posterPath),
      'logoPath': serializer.toJson<String>(logoPath),
      'videoFile': serializer.toJson<String>(videoFile),
      'subtitlesFolder': serializer.toJson<String?>(subtitlesFolder),
      'resolution': serializer.toJson<String>(resolution),
      'homePage': serializer.toJson<String>(homePage),
      'releaseDate': serializer.toJson<DateTime>(releaseDate),
      'imdb': serializer.toJson<String>(imdb),
      'vote': serializer.toJson<double>(vote),
      'watchedTime': serializer.toJson<int>(watchedTime),
      'watchStatus': serializer.toJson<int>(watchStatus),
      'runTime': serializer.toJson<int>(runTime),
    };
  }

  MoviesTableData copyWith(
          {int? id,
          bool? adult,
          String? backdropPath,
          String? name,
          String? tagLine,
          String? overview,
          String? posterPath,
          String? logoPath,
          String? videoFile,
          Value<String?> subtitlesFolder = const Value.absent(),
          String? resolution,
          String? homePage,
          DateTime? releaseDate,
          String? imdb,
          double? vote,
          int? watchedTime,
          int? watchStatus,
          int? runTime}) =>
      MoviesTableData(
        id: id ?? this.id,
        adult: adult ?? this.adult,
        backdropPath: backdropPath ?? this.backdropPath,
        name: name ?? this.name,
        tagLine: tagLine ?? this.tagLine,
        overview: overview ?? this.overview,
        posterPath: posterPath ?? this.posterPath,
        logoPath: logoPath ?? this.logoPath,
        videoFile: videoFile ?? this.videoFile,
        subtitlesFolder: subtitlesFolder.present
            ? subtitlesFolder.value
            : this.subtitlesFolder,
        resolution: resolution ?? this.resolution,
        homePage: homePage ?? this.homePage,
        releaseDate: releaseDate ?? this.releaseDate,
        imdb: imdb ?? this.imdb,
        vote: vote ?? this.vote,
        watchedTime: watchedTime ?? this.watchedTime,
        watchStatus: watchStatus ?? this.watchStatus,
        runTime: runTime ?? this.runTime,
      );
  MoviesTableData copyWithCompanion(MoviesTableCompanion data) {
    return MoviesTableData(
      id: data.id.present ? data.id.value : this.id,
      adult: data.adult.present ? data.adult.value : this.adult,
      backdropPath: data.backdropPath.present
          ? data.backdropPath.value
          : this.backdropPath,
      name: data.name.present ? data.name.value : this.name,
      tagLine: data.tagLine.present ? data.tagLine.value : this.tagLine,
      overview: data.overview.present ? data.overview.value : this.overview,
      posterPath:
          data.posterPath.present ? data.posterPath.value : this.posterPath,
      logoPath: data.logoPath.present ? data.logoPath.value : this.logoPath,
      videoFile: data.videoFile.present ? data.videoFile.value : this.videoFile,
      subtitlesFolder: data.subtitlesFolder.present
          ? data.subtitlesFolder.value
          : this.subtitlesFolder,
      resolution:
          data.resolution.present ? data.resolution.value : this.resolution,
      homePage: data.homePage.present ? data.homePage.value : this.homePage,
      releaseDate:
          data.releaseDate.present ? data.releaseDate.value : this.releaseDate,
      imdb: data.imdb.present ? data.imdb.value : this.imdb,
      vote: data.vote.present ? data.vote.value : this.vote,
      watchedTime:
          data.watchedTime.present ? data.watchedTime.value : this.watchedTime,
      watchStatus:
          data.watchStatus.present ? data.watchStatus.value : this.watchStatus,
      runTime: data.runTime.present ? data.runTime.value : this.runTime,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MoviesTableData(')
          ..write('id: $id, ')
          ..write('adult: $adult, ')
          ..write('backdropPath: $backdropPath, ')
          ..write('name: $name, ')
          ..write('tagLine: $tagLine, ')
          ..write('overview: $overview, ')
          ..write('posterPath: $posterPath, ')
          ..write('logoPath: $logoPath, ')
          ..write('videoFile: $videoFile, ')
          ..write('subtitlesFolder: $subtitlesFolder, ')
          ..write('resolution: $resolution, ')
          ..write('homePage: $homePage, ')
          ..write('releaseDate: $releaseDate, ')
          ..write('imdb: $imdb, ')
          ..write('vote: $vote, ')
          ..write('watchedTime: $watchedTime, ')
          ..write('watchStatus: $watchStatus, ')
          ..write('runTime: $runTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      adult,
      backdropPath,
      name,
      tagLine,
      overview,
      posterPath,
      logoPath,
      videoFile,
      subtitlesFolder,
      resolution,
      homePage,
      releaseDate,
      imdb,
      vote,
      watchedTime,
      watchStatus,
      runTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MoviesTableData &&
          other.id == this.id &&
          other.adult == this.adult &&
          other.backdropPath == this.backdropPath &&
          other.name == this.name &&
          other.tagLine == this.tagLine &&
          other.overview == this.overview &&
          other.posterPath == this.posterPath &&
          other.logoPath == this.logoPath &&
          other.videoFile == this.videoFile &&
          other.subtitlesFolder == this.subtitlesFolder &&
          other.resolution == this.resolution &&
          other.homePage == this.homePage &&
          other.releaseDate == this.releaseDate &&
          other.imdb == this.imdb &&
          other.vote == this.vote &&
          other.watchedTime == this.watchedTime &&
          other.watchStatus == this.watchStatus &&
          other.runTime == this.runTime);
}

class MoviesTableCompanion extends UpdateCompanion<MoviesTableData> {
  final Value<int> id;
  final Value<bool> adult;
  final Value<String> backdropPath;
  final Value<String> name;
  final Value<String> tagLine;
  final Value<String> overview;
  final Value<String> posterPath;
  final Value<String> logoPath;
  final Value<String> videoFile;
  final Value<String?> subtitlesFolder;
  final Value<String> resolution;
  final Value<String> homePage;
  final Value<DateTime> releaseDate;
  final Value<String> imdb;
  final Value<double> vote;
  final Value<int> watchedTime;
  final Value<int> watchStatus;
  final Value<int> runTime;
  final Value<int> rowid;
  const MoviesTableCompanion({
    this.id = const Value.absent(),
    this.adult = const Value.absent(),
    this.backdropPath = const Value.absent(),
    this.name = const Value.absent(),
    this.tagLine = const Value.absent(),
    this.overview = const Value.absent(),
    this.posterPath = const Value.absent(),
    this.logoPath = const Value.absent(),
    this.videoFile = const Value.absent(),
    this.subtitlesFolder = const Value.absent(),
    this.resolution = const Value.absent(),
    this.homePage = const Value.absent(),
    this.releaseDate = const Value.absent(),
    this.imdb = const Value.absent(),
    this.vote = const Value.absent(),
    this.watchedTime = const Value.absent(),
    this.watchStatus = const Value.absent(),
    this.runTime = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MoviesTableCompanion.insert({
    required int id,
    required bool adult,
    required String backdropPath,
    required String name,
    required String tagLine,
    required String overview,
    required String posterPath,
    required String logoPath,
    required String videoFile,
    this.subtitlesFolder = const Value.absent(),
    required String resolution,
    required String homePage,
    required DateTime releaseDate,
    required String imdb,
    required double vote,
    this.watchedTime = const Value.absent(),
    this.watchStatus = const Value.absent(),
    required int runTime,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        adult = Value(adult),
        backdropPath = Value(backdropPath),
        name = Value(name),
        tagLine = Value(tagLine),
        overview = Value(overview),
        posterPath = Value(posterPath),
        logoPath = Value(logoPath),
        videoFile = Value(videoFile),
        resolution = Value(resolution),
        homePage = Value(homePage),
        releaseDate = Value(releaseDate),
        imdb = Value(imdb),
        vote = Value(vote),
        runTime = Value(runTime);
  static Insertable<MoviesTableData> custom({
    Expression<int>? id,
    Expression<bool>? adult,
    Expression<String>? backdropPath,
    Expression<String>? name,
    Expression<String>? tagLine,
    Expression<String>? overview,
    Expression<String>? posterPath,
    Expression<String>? logoPath,
    Expression<String>? videoFile,
    Expression<String>? subtitlesFolder,
    Expression<String>? resolution,
    Expression<String>? homePage,
    Expression<DateTime>? releaseDate,
    Expression<String>? imdb,
    Expression<double>? vote,
    Expression<int>? watchedTime,
    Expression<int>? watchStatus,
    Expression<int>? runTime,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (adult != null) 'adult': adult,
      if (backdropPath != null) 'backdrop_path': backdropPath,
      if (name != null) 'name': name,
      if (tagLine != null) 'tag_line': tagLine,
      if (overview != null) 'overview': overview,
      if (posterPath != null) 'poster_path': posterPath,
      if (logoPath != null) 'logo_path': logoPath,
      if (videoFile != null) 'video_file': videoFile,
      if (subtitlesFolder != null) 'subtitles_folder': subtitlesFolder,
      if (resolution != null) 'resolution': resolution,
      if (homePage != null) 'home_page': homePage,
      if (releaseDate != null) 'release_date': releaseDate,
      if (imdb != null) 'imdb': imdb,
      if (vote != null) 'vote': vote,
      if (watchedTime != null) 'watched_time': watchedTime,
      if (watchStatus != null) 'watch_status': watchStatus,
      if (runTime != null) 'run_time': runTime,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MoviesTableCompanion copyWith(
      {Value<int>? id,
      Value<bool>? adult,
      Value<String>? backdropPath,
      Value<String>? name,
      Value<String>? tagLine,
      Value<String>? overview,
      Value<String>? posterPath,
      Value<String>? logoPath,
      Value<String>? videoFile,
      Value<String?>? subtitlesFolder,
      Value<String>? resolution,
      Value<String>? homePage,
      Value<DateTime>? releaseDate,
      Value<String>? imdb,
      Value<double>? vote,
      Value<int>? watchedTime,
      Value<int>? watchStatus,
      Value<int>? runTime,
      Value<int>? rowid}) {
    return MoviesTableCompanion(
      id: id ?? this.id,
      adult: adult ?? this.adult,
      backdropPath: backdropPath ?? this.backdropPath,
      name: name ?? this.name,
      tagLine: tagLine ?? this.tagLine,
      overview: overview ?? this.overview,
      posterPath: posterPath ?? this.posterPath,
      logoPath: logoPath ?? this.logoPath,
      videoFile: videoFile ?? this.videoFile,
      subtitlesFolder: subtitlesFolder ?? this.subtitlesFolder,
      resolution: resolution ?? this.resolution,
      homePage: homePage ?? this.homePage,
      releaseDate: releaseDate ?? this.releaseDate,
      imdb: imdb ?? this.imdb,
      vote: vote ?? this.vote,
      watchedTime: watchedTime ?? this.watchedTime,
      watchStatus: watchStatus ?? this.watchStatus,
      runTime: runTime ?? this.runTime,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (adult.present) {
      map['adult'] = Variable<bool>(adult.value);
    }
    if (backdropPath.present) {
      map['backdrop_path'] = Variable<String>(backdropPath.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (tagLine.present) {
      map['tag_line'] = Variable<String>(tagLine.value);
    }
    if (overview.present) {
      map['overview'] = Variable<String>(overview.value);
    }
    if (posterPath.present) {
      map['poster_path'] = Variable<String>(posterPath.value);
    }
    if (logoPath.present) {
      map['logo_path'] = Variable<String>(logoPath.value);
    }
    if (videoFile.present) {
      map['video_file'] = Variable<String>(videoFile.value);
    }
    if (subtitlesFolder.present) {
      map['subtitles_folder'] = Variable<String>(subtitlesFolder.value);
    }
    if (resolution.present) {
      map['resolution'] = Variable<String>(resolution.value);
    }
    if (homePage.present) {
      map['home_page'] = Variable<String>(homePage.value);
    }
    if (releaseDate.present) {
      map['release_date'] = Variable<DateTime>(releaseDate.value);
    }
    if (imdb.present) {
      map['imdb'] = Variable<String>(imdb.value);
    }
    if (vote.present) {
      map['vote'] = Variable<double>(vote.value);
    }
    if (watchedTime.present) {
      map['watched_time'] = Variable<int>(watchedTime.value);
    }
    if (watchStatus.present) {
      map['watch_status'] = Variable<int>(watchStatus.value);
    }
    if (runTime.present) {
      map['run_time'] = Variable<int>(runTime.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MoviesTableCompanion(')
          ..write('id: $id, ')
          ..write('adult: $adult, ')
          ..write('backdropPath: $backdropPath, ')
          ..write('name: $name, ')
          ..write('tagLine: $tagLine, ')
          ..write('overview: $overview, ')
          ..write('posterPath: $posterPath, ')
          ..write('logoPath: $logoPath, ')
          ..write('videoFile: $videoFile, ')
          ..write('subtitlesFolder: $subtitlesFolder, ')
          ..write('resolution: $resolution, ')
          ..write('homePage: $homePage, ')
          ..write('releaseDate: $releaseDate, ')
          ..write('imdb: $imdb, ')
          ..write('vote: $vote, ')
          ..write('watchedTime: $watchedTime, ')
          ..write('watchStatus: $watchStatus, ')
          ..write('runTime: $runTime, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SeriesTable extends Series with TableInfo<$SeriesTable, Sery> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SeriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _tagLineMeta =
      const VerificationMeta('tagLine');
  @override
  late final GeneratedColumn<String> tagLine = GeneratedColumn<String>(
      'tag_line', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _overviewMeta =
      const VerificationMeta('overview');
  @override
  late final GeneratedColumn<String> overview = GeneratedColumn<String>(
      'overview', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _logoPathMeta =
      const VerificationMeta('logoPath');
  @override
  late final GeneratedColumn<String> logoPath = GeneratedColumn<String>(
      'logo_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _posterPathMeta =
      const VerificationMeta('posterPath');
  @override
  late final GeneratedColumn<String> posterPath = GeneratedColumn<String>(
      'poster_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _backdropPathMeta =
      const VerificationMeta('backdropPath');
  @override
  late final GeneratedColumn<String> backdropPath = GeneratedColumn<String>(
      'backdrop_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _homePageMeta =
      const VerificationMeta('homePage');
  @override
  late final GeneratedColumn<String> homePage = GeneratedColumn<String>(
      'home_page', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _firstAirDateMeta =
      const VerificationMeta('firstAirDate');
  @override
  late final GeneratedColumn<DateTime> firstAirDate = GeneratedColumn<DateTime>(
      'first_air_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _lastAirDateMeta =
      const VerificationMeta('lastAirDate');
  @override
  late final GeneratedColumn<DateTime> lastAirDate = GeneratedColumn<DateTime>(
      'last_air_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _voteMeta = const VerificationMeta('vote');
  @override
  late final GeneratedColumn<double> vote = GeneratedColumn<double>(
      'vote', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _watchStatusMeta =
      const VerificationMeta('watchStatus');
  @override
  late final GeneratedColumn<int> watchStatus = GeneratedColumn<int>(
      'watch_status', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        tagLine,
        overview,
        logoPath,
        posterPath,
        backdropPath,
        homePage,
        firstAirDate,
        lastAirDate,
        vote,
        watchStatus
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'series';
  @override
  VerificationContext validateIntegrity(Insertable<Sery> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('tag_line')) {
      context.handle(_tagLineMeta,
          tagLine.isAcceptableOrUnknown(data['tag_line']!, _tagLineMeta));
    } else if (isInserting) {
      context.missing(_tagLineMeta);
    }
    if (data.containsKey('overview')) {
      context.handle(_overviewMeta,
          overview.isAcceptableOrUnknown(data['overview']!, _overviewMeta));
    } else if (isInserting) {
      context.missing(_overviewMeta);
    }
    if (data.containsKey('logo_path')) {
      context.handle(_logoPathMeta,
          logoPath.isAcceptableOrUnknown(data['logo_path']!, _logoPathMeta));
    } else if (isInserting) {
      context.missing(_logoPathMeta);
    }
    if (data.containsKey('poster_path')) {
      context.handle(
          _posterPathMeta,
          posterPath.isAcceptableOrUnknown(
              data['poster_path']!, _posterPathMeta));
    } else if (isInserting) {
      context.missing(_posterPathMeta);
    }
    if (data.containsKey('backdrop_path')) {
      context.handle(
          _backdropPathMeta,
          backdropPath.isAcceptableOrUnknown(
              data['backdrop_path']!, _backdropPathMeta));
    } else if (isInserting) {
      context.missing(_backdropPathMeta);
    }
    if (data.containsKey('home_page')) {
      context.handle(_homePageMeta,
          homePage.isAcceptableOrUnknown(data['home_page']!, _homePageMeta));
    } else if (isInserting) {
      context.missing(_homePageMeta);
    }
    if (data.containsKey('first_air_date')) {
      context.handle(
          _firstAirDateMeta,
          firstAirDate.isAcceptableOrUnknown(
              data['first_air_date']!, _firstAirDateMeta));
    } else if (isInserting) {
      context.missing(_firstAirDateMeta);
    }
    if (data.containsKey('last_air_date')) {
      context.handle(
          _lastAirDateMeta,
          lastAirDate.isAcceptableOrUnknown(
              data['last_air_date']!, _lastAirDateMeta));
    } else if (isInserting) {
      context.missing(_lastAirDateMeta);
    }
    if (data.containsKey('vote')) {
      context.handle(
          _voteMeta, vote.isAcceptableOrUnknown(data['vote']!, _voteMeta));
    } else if (isInserting) {
      context.missing(_voteMeta);
    }
    if (data.containsKey('watch_status')) {
      context.handle(
          _watchStatusMeta,
          watchStatus.isAcceptableOrUnknown(
              data['watch_status']!, _watchStatusMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Sery map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Sery(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      tagLine: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tag_line'])!,
      overview: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}overview'])!,
      logoPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}logo_path'])!,
      posterPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}poster_path'])!,
      backdropPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}backdrop_path'])!,
      homePage: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}home_page'])!,
      firstAirDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}first_air_date'])!,
      lastAirDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_air_date'])!,
      vote: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}vote'])!,
      watchStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}watch_status'])!,
    );
  }

  @override
  $SeriesTable createAlias(String alias) {
    return $SeriesTable(attachedDatabase, alias);
  }
}

class Sery extends DataClass implements Insertable<Sery> {
  final int id;
  final String name;
  final String tagLine;
  final String overview;
  final String logoPath;
  final String posterPath;
  final String backdropPath;
  final String homePage;
  final DateTime firstAirDate;
  final DateTime lastAirDate;
  final double vote;
  final int watchStatus;
  const Sery(
      {required this.id,
      required this.name,
      required this.tagLine,
      required this.overview,
      required this.logoPath,
      required this.posterPath,
      required this.backdropPath,
      required this.homePage,
      required this.firstAirDate,
      required this.lastAirDate,
      required this.vote,
      required this.watchStatus});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['tag_line'] = Variable<String>(tagLine);
    map['overview'] = Variable<String>(overview);
    map['logo_path'] = Variable<String>(logoPath);
    map['poster_path'] = Variable<String>(posterPath);
    map['backdrop_path'] = Variable<String>(backdropPath);
    map['home_page'] = Variable<String>(homePage);
    map['first_air_date'] = Variable<DateTime>(firstAirDate);
    map['last_air_date'] = Variable<DateTime>(lastAirDate);
    map['vote'] = Variable<double>(vote);
    map['watch_status'] = Variable<int>(watchStatus);
    return map;
  }

  SeriesCompanion toCompanion(bool nullToAbsent) {
    return SeriesCompanion(
      id: Value(id),
      name: Value(name),
      tagLine: Value(tagLine),
      overview: Value(overview),
      logoPath: Value(logoPath),
      posterPath: Value(posterPath),
      backdropPath: Value(backdropPath),
      homePage: Value(homePage),
      firstAirDate: Value(firstAirDate),
      lastAirDate: Value(lastAirDate),
      vote: Value(vote),
      watchStatus: Value(watchStatus),
    );
  }

  factory Sery.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Sery(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      tagLine: serializer.fromJson<String>(json['tagLine']),
      overview: serializer.fromJson<String>(json['overview']),
      logoPath: serializer.fromJson<String>(json['logoPath']),
      posterPath: serializer.fromJson<String>(json['posterPath']),
      backdropPath: serializer.fromJson<String>(json['backdropPath']),
      homePage: serializer.fromJson<String>(json['homePage']),
      firstAirDate: serializer.fromJson<DateTime>(json['firstAirDate']),
      lastAirDate: serializer.fromJson<DateTime>(json['lastAirDate']),
      vote: serializer.fromJson<double>(json['vote']),
      watchStatus: serializer.fromJson<int>(json['watchStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'tagLine': serializer.toJson<String>(tagLine),
      'overview': serializer.toJson<String>(overview),
      'logoPath': serializer.toJson<String>(logoPath),
      'posterPath': serializer.toJson<String>(posterPath),
      'backdropPath': serializer.toJson<String>(backdropPath),
      'homePage': serializer.toJson<String>(homePage),
      'firstAirDate': serializer.toJson<DateTime>(firstAirDate),
      'lastAirDate': serializer.toJson<DateTime>(lastAirDate),
      'vote': serializer.toJson<double>(vote),
      'watchStatus': serializer.toJson<int>(watchStatus),
    };
  }

  Sery copyWith(
          {int? id,
          String? name,
          String? tagLine,
          String? overview,
          String? logoPath,
          String? posterPath,
          String? backdropPath,
          String? homePage,
          DateTime? firstAirDate,
          DateTime? lastAirDate,
          double? vote,
          int? watchStatus}) =>
      Sery(
        id: id ?? this.id,
        name: name ?? this.name,
        tagLine: tagLine ?? this.tagLine,
        overview: overview ?? this.overview,
        logoPath: logoPath ?? this.logoPath,
        posterPath: posterPath ?? this.posterPath,
        backdropPath: backdropPath ?? this.backdropPath,
        homePage: homePage ?? this.homePage,
        firstAirDate: firstAirDate ?? this.firstAirDate,
        lastAirDate: lastAirDate ?? this.lastAirDate,
        vote: vote ?? this.vote,
        watchStatus: watchStatus ?? this.watchStatus,
      );
  Sery copyWithCompanion(SeriesCompanion data) {
    return Sery(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      tagLine: data.tagLine.present ? data.tagLine.value : this.tagLine,
      overview: data.overview.present ? data.overview.value : this.overview,
      logoPath: data.logoPath.present ? data.logoPath.value : this.logoPath,
      posterPath:
          data.posterPath.present ? data.posterPath.value : this.posterPath,
      backdropPath: data.backdropPath.present
          ? data.backdropPath.value
          : this.backdropPath,
      homePage: data.homePage.present ? data.homePage.value : this.homePage,
      firstAirDate: data.firstAirDate.present
          ? data.firstAirDate.value
          : this.firstAirDate,
      lastAirDate:
          data.lastAirDate.present ? data.lastAirDate.value : this.lastAirDate,
      vote: data.vote.present ? data.vote.value : this.vote,
      watchStatus:
          data.watchStatus.present ? data.watchStatus.value : this.watchStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Sery(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('tagLine: $tagLine, ')
          ..write('overview: $overview, ')
          ..write('logoPath: $logoPath, ')
          ..write('posterPath: $posterPath, ')
          ..write('backdropPath: $backdropPath, ')
          ..write('homePage: $homePage, ')
          ..write('firstAirDate: $firstAirDate, ')
          ..write('lastAirDate: $lastAirDate, ')
          ..write('vote: $vote, ')
          ..write('watchStatus: $watchStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      name,
      tagLine,
      overview,
      logoPath,
      posterPath,
      backdropPath,
      homePage,
      firstAirDate,
      lastAirDate,
      vote,
      watchStatus);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Sery &&
          other.id == this.id &&
          other.name == this.name &&
          other.tagLine == this.tagLine &&
          other.overview == this.overview &&
          other.logoPath == this.logoPath &&
          other.posterPath == this.posterPath &&
          other.backdropPath == this.backdropPath &&
          other.homePage == this.homePage &&
          other.firstAirDate == this.firstAirDate &&
          other.lastAirDate == this.lastAirDate &&
          other.vote == this.vote &&
          other.watchStatus == this.watchStatus);
}

class SeriesCompanion extends UpdateCompanion<Sery> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> tagLine;
  final Value<String> overview;
  final Value<String> logoPath;
  final Value<String> posterPath;
  final Value<String> backdropPath;
  final Value<String> homePage;
  final Value<DateTime> firstAirDate;
  final Value<DateTime> lastAirDate;
  final Value<double> vote;
  final Value<int> watchStatus;
  final Value<int> rowid;
  const SeriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.tagLine = const Value.absent(),
    this.overview = const Value.absent(),
    this.logoPath = const Value.absent(),
    this.posterPath = const Value.absent(),
    this.backdropPath = const Value.absent(),
    this.homePage = const Value.absent(),
    this.firstAirDate = const Value.absent(),
    this.lastAirDate = const Value.absent(),
    this.vote = const Value.absent(),
    this.watchStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SeriesCompanion.insert({
    required int id,
    required String name,
    required String tagLine,
    required String overview,
    required String logoPath,
    required String posterPath,
    required String backdropPath,
    required String homePage,
    required DateTime firstAirDate,
    required DateTime lastAirDate,
    required double vote,
    this.watchStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        tagLine = Value(tagLine),
        overview = Value(overview),
        logoPath = Value(logoPath),
        posterPath = Value(posterPath),
        backdropPath = Value(backdropPath),
        homePage = Value(homePage),
        firstAirDate = Value(firstAirDate),
        lastAirDate = Value(lastAirDate),
        vote = Value(vote);
  static Insertable<Sery> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? tagLine,
    Expression<String>? overview,
    Expression<String>? logoPath,
    Expression<String>? posterPath,
    Expression<String>? backdropPath,
    Expression<String>? homePage,
    Expression<DateTime>? firstAirDate,
    Expression<DateTime>? lastAirDate,
    Expression<double>? vote,
    Expression<int>? watchStatus,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (tagLine != null) 'tag_line': tagLine,
      if (overview != null) 'overview': overview,
      if (logoPath != null) 'logo_path': logoPath,
      if (posterPath != null) 'poster_path': posterPath,
      if (backdropPath != null) 'backdrop_path': backdropPath,
      if (homePage != null) 'home_page': homePage,
      if (firstAirDate != null) 'first_air_date': firstAirDate,
      if (lastAirDate != null) 'last_air_date': lastAirDate,
      if (vote != null) 'vote': vote,
      if (watchStatus != null) 'watch_status': watchStatus,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SeriesCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? tagLine,
      Value<String>? overview,
      Value<String>? logoPath,
      Value<String>? posterPath,
      Value<String>? backdropPath,
      Value<String>? homePage,
      Value<DateTime>? firstAirDate,
      Value<DateTime>? lastAirDate,
      Value<double>? vote,
      Value<int>? watchStatus,
      Value<int>? rowid}) {
    return SeriesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      tagLine: tagLine ?? this.tagLine,
      overview: overview ?? this.overview,
      logoPath: logoPath ?? this.logoPath,
      posterPath: posterPath ?? this.posterPath,
      backdropPath: backdropPath ?? this.backdropPath,
      homePage: homePage ?? this.homePage,
      firstAirDate: firstAirDate ?? this.firstAirDate,
      lastAirDate: lastAirDate ?? this.lastAirDate,
      vote: vote ?? this.vote,
      watchStatus: watchStatus ?? this.watchStatus,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (tagLine.present) {
      map['tag_line'] = Variable<String>(tagLine.value);
    }
    if (overview.present) {
      map['overview'] = Variable<String>(overview.value);
    }
    if (logoPath.present) {
      map['logo_path'] = Variable<String>(logoPath.value);
    }
    if (posterPath.present) {
      map['poster_path'] = Variable<String>(posterPath.value);
    }
    if (backdropPath.present) {
      map['backdrop_path'] = Variable<String>(backdropPath.value);
    }
    if (homePage.present) {
      map['home_page'] = Variable<String>(homePage.value);
    }
    if (firstAirDate.present) {
      map['first_air_date'] = Variable<DateTime>(firstAirDate.value);
    }
    if (lastAirDate.present) {
      map['last_air_date'] = Variable<DateTime>(lastAirDate.value);
    }
    if (vote.present) {
      map['vote'] = Variable<double>(vote.value);
    }
    if (watchStatus.present) {
      map['watch_status'] = Variable<int>(watchStatus.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SeriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('tagLine: $tagLine, ')
          ..write('overview: $overview, ')
          ..write('logoPath: $logoPath, ')
          ..write('posterPath: $posterPath, ')
          ..write('backdropPath: $backdropPath, ')
          ..write('homePage: $homePage, ')
          ..write('firstAirDate: $firstAirDate, ')
          ..write('lastAirDate: $lastAirDate, ')
          ..write('vote: $vote, ')
          ..write('watchStatus: $watchStatus, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SeasonsTable extends Seasons with TableInfo<$SeasonsTable, Season> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SeasonsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _numberMeta = const VerificationMeta('number');
  @override
  late final GeneratedColumn<int> number = GeneratedColumn<int>(
      'number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _seriesidMeta =
      const VerificationMeta('seriesid');
  @override
  late final GeneratedColumn<int> seriesid = GeneratedColumn<int>(
      'seriesid', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES series (id)'));
  static const VerificationMeta _overviewMeta =
      const VerificationMeta('overview');
  @override
  late final GeneratedColumn<String> overview = GeneratedColumn<String>(
      'overview', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _posterPathMeta =
      const VerificationMeta('posterPath');
  @override
  late final GeneratedColumn<String> posterPath = GeneratedColumn<String>(
      'poster_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _seasonFolderMeta =
      const VerificationMeta('seasonFolder');
  @override
  late final GeneratedColumn<String> seasonFolder = GeneratedColumn<String>(
      'season_folder', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _airDateMeta =
      const VerificationMeta('airDate');
  @override
  late final GeneratedColumn<DateTime> airDate = GeneratedColumn<DateTime>(
      'air_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _voteMeta = const VerificationMeta('vote');
  @override
  late final GeneratedColumn<double> vote = GeneratedColumn<double>(
      'vote', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _watchStatusMeta =
      const VerificationMeta('watchStatus');
  @override
  late final GeneratedColumn<int> watchStatus = GeneratedColumn<int>(
      'watch_status', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        number,
        seriesid,
        overview,
        posterPath,
        seasonFolder,
        airDate,
        vote,
        watchStatus
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'seasons';
  @override
  VerificationContext validateIntegrity(Insertable<Season> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('number')) {
      context.handle(_numberMeta,
          number.isAcceptableOrUnknown(data['number']!, _numberMeta));
    } else if (isInserting) {
      context.missing(_numberMeta);
    }
    if (data.containsKey('seriesid')) {
      context.handle(_seriesidMeta,
          seriesid.isAcceptableOrUnknown(data['seriesid']!, _seriesidMeta));
    } else if (isInserting) {
      context.missing(_seriesidMeta);
    }
    if (data.containsKey('overview')) {
      context.handle(_overviewMeta,
          overview.isAcceptableOrUnknown(data['overview']!, _overviewMeta));
    } else if (isInserting) {
      context.missing(_overviewMeta);
    }
    if (data.containsKey('poster_path')) {
      context.handle(
          _posterPathMeta,
          posterPath.isAcceptableOrUnknown(
              data['poster_path']!, _posterPathMeta));
    } else if (isInserting) {
      context.missing(_posterPathMeta);
    }
    if (data.containsKey('season_folder')) {
      context.handle(
          _seasonFolderMeta,
          seasonFolder.isAcceptableOrUnknown(
              data['season_folder']!, _seasonFolderMeta));
    } else if (isInserting) {
      context.missing(_seasonFolderMeta);
    }
    if (data.containsKey('air_date')) {
      context.handle(_airDateMeta,
          airDate.isAcceptableOrUnknown(data['air_date']!, _airDateMeta));
    } else if (isInserting) {
      context.missing(_airDateMeta);
    }
    if (data.containsKey('vote')) {
      context.handle(
          _voteMeta, vote.isAcceptableOrUnknown(data['vote']!, _voteMeta));
    } else if (isInserting) {
      context.missing(_voteMeta);
    }
    if (data.containsKey('watch_status')) {
      context.handle(
          _watchStatusMeta,
          watchStatus.isAcceptableOrUnknown(
              data['watch_status']!, _watchStatusMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Season map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Season(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      number: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}number'])!,
      seriesid: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}seriesid'])!,
      overview: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}overview'])!,
      posterPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}poster_path'])!,
      seasonFolder: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}season_folder'])!,
      airDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}air_date'])!,
      vote: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}vote'])!,
      watchStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}watch_status'])!,
    );
  }

  @override
  $SeasonsTable createAlias(String alias) {
    return $SeasonsTable(attachedDatabase, alias);
  }
}

class Season extends DataClass implements Insertable<Season> {
  final int id;
  final int number;
  final int seriesid;
  final String overview;
  final String posterPath;
  final String seasonFolder;
  final DateTime airDate;
  final double vote;
  final int watchStatus;
  const Season(
      {required this.id,
      required this.number,
      required this.seriesid,
      required this.overview,
      required this.posterPath,
      required this.seasonFolder,
      required this.airDate,
      required this.vote,
      required this.watchStatus});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['number'] = Variable<int>(number);
    map['seriesid'] = Variable<int>(seriesid);
    map['overview'] = Variable<String>(overview);
    map['poster_path'] = Variable<String>(posterPath);
    map['season_folder'] = Variable<String>(seasonFolder);
    map['air_date'] = Variable<DateTime>(airDate);
    map['vote'] = Variable<double>(vote);
    map['watch_status'] = Variable<int>(watchStatus);
    return map;
  }

  SeasonsCompanion toCompanion(bool nullToAbsent) {
    return SeasonsCompanion(
      id: Value(id),
      number: Value(number),
      seriesid: Value(seriesid),
      overview: Value(overview),
      posterPath: Value(posterPath),
      seasonFolder: Value(seasonFolder),
      airDate: Value(airDate),
      vote: Value(vote),
      watchStatus: Value(watchStatus),
    );
  }

  factory Season.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Season(
      id: serializer.fromJson<int>(json['id']),
      number: serializer.fromJson<int>(json['number']),
      seriesid: serializer.fromJson<int>(json['seriesid']),
      overview: serializer.fromJson<String>(json['overview']),
      posterPath: serializer.fromJson<String>(json['posterPath']),
      seasonFolder: serializer.fromJson<String>(json['seasonFolder']),
      airDate: serializer.fromJson<DateTime>(json['airDate']),
      vote: serializer.fromJson<double>(json['vote']),
      watchStatus: serializer.fromJson<int>(json['watchStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'number': serializer.toJson<int>(number),
      'seriesid': serializer.toJson<int>(seriesid),
      'overview': serializer.toJson<String>(overview),
      'posterPath': serializer.toJson<String>(posterPath),
      'seasonFolder': serializer.toJson<String>(seasonFolder),
      'airDate': serializer.toJson<DateTime>(airDate),
      'vote': serializer.toJson<double>(vote),
      'watchStatus': serializer.toJson<int>(watchStatus),
    };
  }

  Season copyWith(
          {int? id,
          int? number,
          int? seriesid,
          String? overview,
          String? posterPath,
          String? seasonFolder,
          DateTime? airDate,
          double? vote,
          int? watchStatus}) =>
      Season(
        id: id ?? this.id,
        number: number ?? this.number,
        seriesid: seriesid ?? this.seriesid,
        overview: overview ?? this.overview,
        posterPath: posterPath ?? this.posterPath,
        seasonFolder: seasonFolder ?? this.seasonFolder,
        airDate: airDate ?? this.airDate,
        vote: vote ?? this.vote,
        watchStatus: watchStatus ?? this.watchStatus,
      );
  Season copyWithCompanion(SeasonsCompanion data) {
    return Season(
      id: data.id.present ? data.id.value : this.id,
      number: data.number.present ? data.number.value : this.number,
      seriesid: data.seriesid.present ? data.seriesid.value : this.seriesid,
      overview: data.overview.present ? data.overview.value : this.overview,
      posterPath:
          data.posterPath.present ? data.posterPath.value : this.posterPath,
      seasonFolder: data.seasonFolder.present
          ? data.seasonFolder.value
          : this.seasonFolder,
      airDate: data.airDate.present ? data.airDate.value : this.airDate,
      vote: data.vote.present ? data.vote.value : this.vote,
      watchStatus:
          data.watchStatus.present ? data.watchStatus.value : this.watchStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Season(')
          ..write('id: $id, ')
          ..write('number: $number, ')
          ..write('seriesid: $seriesid, ')
          ..write('overview: $overview, ')
          ..write('posterPath: $posterPath, ')
          ..write('seasonFolder: $seasonFolder, ')
          ..write('airDate: $airDate, ')
          ..write('vote: $vote, ')
          ..write('watchStatus: $watchStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, number, seriesid, overview, posterPath,
      seasonFolder, airDate, vote, watchStatus);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Season &&
          other.id == this.id &&
          other.number == this.number &&
          other.seriesid == this.seriesid &&
          other.overview == this.overview &&
          other.posterPath == this.posterPath &&
          other.seasonFolder == this.seasonFolder &&
          other.airDate == this.airDate &&
          other.vote == this.vote &&
          other.watchStatus == this.watchStatus);
}

class SeasonsCompanion extends UpdateCompanion<Season> {
  final Value<int> id;
  final Value<int> number;
  final Value<int> seriesid;
  final Value<String> overview;
  final Value<String> posterPath;
  final Value<String> seasonFolder;
  final Value<DateTime> airDate;
  final Value<double> vote;
  final Value<int> watchStatus;
  final Value<int> rowid;
  const SeasonsCompanion({
    this.id = const Value.absent(),
    this.number = const Value.absent(),
    this.seriesid = const Value.absent(),
    this.overview = const Value.absent(),
    this.posterPath = const Value.absent(),
    this.seasonFolder = const Value.absent(),
    this.airDate = const Value.absent(),
    this.vote = const Value.absent(),
    this.watchStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SeasonsCompanion.insert({
    required int id,
    required int number,
    required int seriesid,
    required String overview,
    required String posterPath,
    required String seasonFolder,
    required DateTime airDate,
    required double vote,
    this.watchStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        number = Value(number),
        seriesid = Value(seriesid),
        overview = Value(overview),
        posterPath = Value(posterPath),
        seasonFolder = Value(seasonFolder),
        airDate = Value(airDate),
        vote = Value(vote);
  static Insertable<Season> custom({
    Expression<int>? id,
    Expression<int>? number,
    Expression<int>? seriesid,
    Expression<String>? overview,
    Expression<String>? posterPath,
    Expression<String>? seasonFolder,
    Expression<DateTime>? airDate,
    Expression<double>? vote,
    Expression<int>? watchStatus,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (number != null) 'number': number,
      if (seriesid != null) 'seriesid': seriesid,
      if (overview != null) 'overview': overview,
      if (posterPath != null) 'poster_path': posterPath,
      if (seasonFolder != null) 'season_folder': seasonFolder,
      if (airDate != null) 'air_date': airDate,
      if (vote != null) 'vote': vote,
      if (watchStatus != null) 'watch_status': watchStatus,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SeasonsCompanion copyWith(
      {Value<int>? id,
      Value<int>? number,
      Value<int>? seriesid,
      Value<String>? overview,
      Value<String>? posterPath,
      Value<String>? seasonFolder,
      Value<DateTime>? airDate,
      Value<double>? vote,
      Value<int>? watchStatus,
      Value<int>? rowid}) {
    return SeasonsCompanion(
      id: id ?? this.id,
      number: number ?? this.number,
      seriesid: seriesid ?? this.seriesid,
      overview: overview ?? this.overview,
      posterPath: posterPath ?? this.posterPath,
      seasonFolder: seasonFolder ?? this.seasonFolder,
      airDate: airDate ?? this.airDate,
      vote: vote ?? this.vote,
      watchStatus: watchStatus ?? this.watchStatus,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (number.present) {
      map['number'] = Variable<int>(number.value);
    }
    if (seriesid.present) {
      map['seriesid'] = Variable<int>(seriesid.value);
    }
    if (overview.present) {
      map['overview'] = Variable<String>(overview.value);
    }
    if (posterPath.present) {
      map['poster_path'] = Variable<String>(posterPath.value);
    }
    if (seasonFolder.present) {
      map['season_folder'] = Variable<String>(seasonFolder.value);
    }
    if (airDate.present) {
      map['air_date'] = Variable<DateTime>(airDate.value);
    }
    if (vote.present) {
      map['vote'] = Variable<double>(vote.value);
    }
    if (watchStatus.present) {
      map['watch_status'] = Variable<int>(watchStatus.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SeasonsCompanion(')
          ..write('id: $id, ')
          ..write('number: $number, ')
          ..write('seriesid: $seriesid, ')
          ..write('overview: $overview, ')
          ..write('posterPath: $posterPath, ')
          ..write('seasonFolder: $seasonFolder, ')
          ..write('airDate: $airDate, ')
          ..write('vote: $vote, ')
          ..write('watchStatus: $watchStatus, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $EpisodesTable extends Episodes with TableInfo<$EpisodesTable, Episode> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EpisodesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _seasonidMeta =
      const VerificationMeta('seasonid');
  @override
  late final GeneratedColumn<int> seasonid = GeneratedColumn<int>(
      'seasonid', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES seasons (id)'));
  static const VerificationMeta _numberMeta = const VerificationMeta('number');
  @override
  late final GeneratedColumn<int> number = GeneratedColumn<int>(
      'number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _overviewMeta =
      const VerificationMeta('overview');
  @override
  late final GeneratedColumn<String> overview = GeneratedColumn<String>(
      'overview', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _filePathMeta =
      const VerificationMeta('filePath');
  @override
  late final GeneratedColumn<String> filePath = GeneratedColumn<String>(
      'file_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _posterPathMeta =
      const VerificationMeta('posterPath');
  @override
  late final GeneratedColumn<String> posterPath = GeneratedColumn<String>(
      'poster_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _airDateMeta =
      const VerificationMeta('airDate');
  @override
  late final GeneratedColumn<DateTime> airDate = GeneratedColumn<DateTime>(
      'air_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _voteMeta = const VerificationMeta('vote');
  @override
  late final GeneratedColumn<double> vote = GeneratedColumn<double>(
      'vote', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _watchedTimeMeta =
      const VerificationMeta('watchedTime');
  @override
  late final GeneratedColumn<int> watchedTime = GeneratedColumn<int>(
      'watched_time', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _watchStatusMeta =
      const VerificationMeta('watchStatus');
  @override
  late final GeneratedColumn<int> watchStatus = GeneratedColumn<int>(
      'watch_status', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _runTimeMeta =
      const VerificationMeta('runTime');
  @override
  late final GeneratedColumn<int> runTime = GeneratedColumn<int>(
      'run_time', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        seasonid,
        number,
        name,
        overview,
        filePath,
        posterPath,
        airDate,
        vote,
        watchedTime,
        watchStatus,
        runTime
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'episodes';
  @override
  VerificationContext validateIntegrity(Insertable<Episode> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('seasonid')) {
      context.handle(_seasonidMeta,
          seasonid.isAcceptableOrUnknown(data['seasonid']!, _seasonidMeta));
    } else if (isInserting) {
      context.missing(_seasonidMeta);
    }
    if (data.containsKey('number')) {
      context.handle(_numberMeta,
          number.isAcceptableOrUnknown(data['number']!, _numberMeta));
    } else if (isInserting) {
      context.missing(_numberMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('overview')) {
      context.handle(_overviewMeta,
          overview.isAcceptableOrUnknown(data['overview']!, _overviewMeta));
    } else if (isInserting) {
      context.missing(_overviewMeta);
    }
    if (data.containsKey('file_path')) {
      context.handle(_filePathMeta,
          filePath.isAcceptableOrUnknown(data['file_path']!, _filePathMeta));
    } else if (isInserting) {
      context.missing(_filePathMeta);
    }
    if (data.containsKey('poster_path')) {
      context.handle(
          _posterPathMeta,
          posterPath.isAcceptableOrUnknown(
              data['poster_path']!, _posterPathMeta));
    } else if (isInserting) {
      context.missing(_posterPathMeta);
    }
    if (data.containsKey('air_date')) {
      context.handle(_airDateMeta,
          airDate.isAcceptableOrUnknown(data['air_date']!, _airDateMeta));
    } else if (isInserting) {
      context.missing(_airDateMeta);
    }
    if (data.containsKey('vote')) {
      context.handle(
          _voteMeta, vote.isAcceptableOrUnknown(data['vote']!, _voteMeta));
    } else if (isInserting) {
      context.missing(_voteMeta);
    }
    if (data.containsKey('watched_time')) {
      context.handle(
          _watchedTimeMeta,
          watchedTime.isAcceptableOrUnknown(
              data['watched_time']!, _watchedTimeMeta));
    }
    if (data.containsKey('watch_status')) {
      context.handle(
          _watchStatusMeta,
          watchStatus.isAcceptableOrUnknown(
              data['watch_status']!, _watchStatusMeta));
    }
    if (data.containsKey('run_time')) {
      context.handle(_runTimeMeta,
          runTime.isAcceptableOrUnknown(data['run_time']!, _runTimeMeta));
    } else if (isInserting) {
      context.missing(_runTimeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Episode map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Episode(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      seasonid: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}seasonid'])!,
      number: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}number'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      overview: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}overview'])!,
      filePath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}file_path'])!,
      posterPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}poster_path'])!,
      airDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}air_date'])!,
      vote: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}vote'])!,
      watchedTime: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}watched_time'])!,
      watchStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}watch_status'])!,
      runTime: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}run_time'])!,
    );
  }

  @override
  $EpisodesTable createAlias(String alias) {
    return $EpisodesTable(attachedDatabase, alias);
  }
}

class Episode extends DataClass implements Insertable<Episode> {
  final int id;
  final int seasonid;
  final int number;
  final String name;
  final String overview;
  final String filePath;
  final String posterPath;
  final DateTime airDate;
  final double vote;
  final int watchedTime;
  final int watchStatus;
  final int runTime;
  const Episode(
      {required this.id,
      required this.seasonid,
      required this.number,
      required this.name,
      required this.overview,
      required this.filePath,
      required this.posterPath,
      required this.airDate,
      required this.vote,
      required this.watchedTime,
      required this.watchStatus,
      required this.runTime});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['seasonid'] = Variable<int>(seasonid);
    map['number'] = Variable<int>(number);
    map['name'] = Variable<String>(name);
    map['overview'] = Variable<String>(overview);
    map['file_path'] = Variable<String>(filePath);
    map['poster_path'] = Variable<String>(posterPath);
    map['air_date'] = Variable<DateTime>(airDate);
    map['vote'] = Variable<double>(vote);
    map['watched_time'] = Variable<int>(watchedTime);
    map['watch_status'] = Variable<int>(watchStatus);
    map['run_time'] = Variable<int>(runTime);
    return map;
  }

  EpisodesCompanion toCompanion(bool nullToAbsent) {
    return EpisodesCompanion(
      id: Value(id),
      seasonid: Value(seasonid),
      number: Value(number),
      name: Value(name),
      overview: Value(overview),
      filePath: Value(filePath),
      posterPath: Value(posterPath),
      airDate: Value(airDate),
      vote: Value(vote),
      watchedTime: Value(watchedTime),
      watchStatus: Value(watchStatus),
      runTime: Value(runTime),
    );
  }

  factory Episode.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Episode(
      id: serializer.fromJson<int>(json['id']),
      seasonid: serializer.fromJson<int>(json['seasonid']),
      number: serializer.fromJson<int>(json['number']),
      name: serializer.fromJson<String>(json['name']),
      overview: serializer.fromJson<String>(json['overview']),
      filePath: serializer.fromJson<String>(json['filePath']),
      posterPath: serializer.fromJson<String>(json['posterPath']),
      airDate: serializer.fromJson<DateTime>(json['airDate']),
      vote: serializer.fromJson<double>(json['vote']),
      watchedTime: serializer.fromJson<int>(json['watchedTime']),
      watchStatus: serializer.fromJson<int>(json['watchStatus']),
      runTime: serializer.fromJson<int>(json['runTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'seasonid': serializer.toJson<int>(seasonid),
      'number': serializer.toJson<int>(number),
      'name': serializer.toJson<String>(name),
      'overview': serializer.toJson<String>(overview),
      'filePath': serializer.toJson<String>(filePath),
      'posterPath': serializer.toJson<String>(posterPath),
      'airDate': serializer.toJson<DateTime>(airDate),
      'vote': serializer.toJson<double>(vote),
      'watchedTime': serializer.toJson<int>(watchedTime),
      'watchStatus': serializer.toJson<int>(watchStatus),
      'runTime': serializer.toJson<int>(runTime),
    };
  }

  Episode copyWith(
          {int? id,
          int? seasonid,
          int? number,
          String? name,
          String? overview,
          String? filePath,
          String? posterPath,
          DateTime? airDate,
          double? vote,
          int? watchedTime,
          int? watchStatus,
          int? runTime}) =>
      Episode(
        id: id ?? this.id,
        seasonid: seasonid ?? this.seasonid,
        number: number ?? this.number,
        name: name ?? this.name,
        overview: overview ?? this.overview,
        filePath: filePath ?? this.filePath,
        posterPath: posterPath ?? this.posterPath,
        airDate: airDate ?? this.airDate,
        vote: vote ?? this.vote,
        watchedTime: watchedTime ?? this.watchedTime,
        watchStatus: watchStatus ?? this.watchStatus,
        runTime: runTime ?? this.runTime,
      );
  Episode copyWithCompanion(EpisodesCompanion data) {
    return Episode(
      id: data.id.present ? data.id.value : this.id,
      seasonid: data.seasonid.present ? data.seasonid.value : this.seasonid,
      number: data.number.present ? data.number.value : this.number,
      name: data.name.present ? data.name.value : this.name,
      overview: data.overview.present ? data.overview.value : this.overview,
      filePath: data.filePath.present ? data.filePath.value : this.filePath,
      posterPath:
          data.posterPath.present ? data.posterPath.value : this.posterPath,
      airDate: data.airDate.present ? data.airDate.value : this.airDate,
      vote: data.vote.present ? data.vote.value : this.vote,
      watchedTime:
          data.watchedTime.present ? data.watchedTime.value : this.watchedTime,
      watchStatus:
          data.watchStatus.present ? data.watchStatus.value : this.watchStatus,
      runTime: data.runTime.present ? data.runTime.value : this.runTime,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Episode(')
          ..write('id: $id, ')
          ..write('seasonid: $seasonid, ')
          ..write('number: $number, ')
          ..write('name: $name, ')
          ..write('overview: $overview, ')
          ..write('filePath: $filePath, ')
          ..write('posterPath: $posterPath, ')
          ..write('airDate: $airDate, ')
          ..write('vote: $vote, ')
          ..write('watchedTime: $watchedTime, ')
          ..write('watchStatus: $watchStatus, ')
          ..write('runTime: $runTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, seasonid, number, name, overview,
      filePath, posterPath, airDate, vote, watchedTime, watchStatus, runTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Episode &&
          other.id == this.id &&
          other.seasonid == this.seasonid &&
          other.number == this.number &&
          other.name == this.name &&
          other.overview == this.overview &&
          other.filePath == this.filePath &&
          other.posterPath == this.posterPath &&
          other.airDate == this.airDate &&
          other.vote == this.vote &&
          other.watchedTime == this.watchedTime &&
          other.watchStatus == this.watchStatus &&
          other.runTime == this.runTime);
}

class EpisodesCompanion extends UpdateCompanion<Episode> {
  final Value<int> id;
  final Value<int> seasonid;
  final Value<int> number;
  final Value<String> name;
  final Value<String> overview;
  final Value<String> filePath;
  final Value<String> posterPath;
  final Value<DateTime> airDate;
  final Value<double> vote;
  final Value<int> watchedTime;
  final Value<int> watchStatus;
  final Value<int> runTime;
  final Value<int> rowid;
  const EpisodesCompanion({
    this.id = const Value.absent(),
    this.seasonid = const Value.absent(),
    this.number = const Value.absent(),
    this.name = const Value.absent(),
    this.overview = const Value.absent(),
    this.filePath = const Value.absent(),
    this.posterPath = const Value.absent(),
    this.airDate = const Value.absent(),
    this.vote = const Value.absent(),
    this.watchedTime = const Value.absent(),
    this.watchStatus = const Value.absent(),
    this.runTime = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EpisodesCompanion.insert({
    required int id,
    required int seasonid,
    required int number,
    required String name,
    required String overview,
    required String filePath,
    required String posterPath,
    required DateTime airDate,
    required double vote,
    this.watchedTime = const Value.absent(),
    this.watchStatus = const Value.absent(),
    required int runTime,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        seasonid = Value(seasonid),
        number = Value(number),
        name = Value(name),
        overview = Value(overview),
        filePath = Value(filePath),
        posterPath = Value(posterPath),
        airDate = Value(airDate),
        vote = Value(vote),
        runTime = Value(runTime);
  static Insertable<Episode> custom({
    Expression<int>? id,
    Expression<int>? seasonid,
    Expression<int>? number,
    Expression<String>? name,
    Expression<String>? overview,
    Expression<String>? filePath,
    Expression<String>? posterPath,
    Expression<DateTime>? airDate,
    Expression<double>? vote,
    Expression<int>? watchedTime,
    Expression<int>? watchStatus,
    Expression<int>? runTime,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (seasonid != null) 'seasonid': seasonid,
      if (number != null) 'number': number,
      if (name != null) 'name': name,
      if (overview != null) 'overview': overview,
      if (filePath != null) 'file_path': filePath,
      if (posterPath != null) 'poster_path': posterPath,
      if (airDate != null) 'air_date': airDate,
      if (vote != null) 'vote': vote,
      if (watchedTime != null) 'watched_time': watchedTime,
      if (watchStatus != null) 'watch_status': watchStatus,
      if (runTime != null) 'run_time': runTime,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EpisodesCompanion copyWith(
      {Value<int>? id,
      Value<int>? seasonid,
      Value<int>? number,
      Value<String>? name,
      Value<String>? overview,
      Value<String>? filePath,
      Value<String>? posterPath,
      Value<DateTime>? airDate,
      Value<double>? vote,
      Value<int>? watchedTime,
      Value<int>? watchStatus,
      Value<int>? runTime,
      Value<int>? rowid}) {
    return EpisodesCompanion(
      id: id ?? this.id,
      seasonid: seasonid ?? this.seasonid,
      number: number ?? this.number,
      name: name ?? this.name,
      overview: overview ?? this.overview,
      filePath: filePath ?? this.filePath,
      posterPath: posterPath ?? this.posterPath,
      airDate: airDate ?? this.airDate,
      vote: vote ?? this.vote,
      watchedTime: watchedTime ?? this.watchedTime,
      watchStatus: watchStatus ?? this.watchStatus,
      runTime: runTime ?? this.runTime,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (seasonid.present) {
      map['seasonid'] = Variable<int>(seasonid.value);
    }
    if (number.present) {
      map['number'] = Variable<int>(number.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (overview.present) {
      map['overview'] = Variable<String>(overview.value);
    }
    if (filePath.present) {
      map['file_path'] = Variable<String>(filePath.value);
    }
    if (posterPath.present) {
      map['poster_path'] = Variable<String>(posterPath.value);
    }
    if (airDate.present) {
      map['air_date'] = Variable<DateTime>(airDate.value);
    }
    if (vote.present) {
      map['vote'] = Variable<double>(vote.value);
    }
    if (watchedTime.present) {
      map['watched_time'] = Variable<int>(watchedTime.value);
    }
    if (watchStatus.present) {
      map['watch_status'] = Variable<int>(watchStatus.value);
    }
    if (runTime.present) {
      map['run_time'] = Variable<int>(runTime.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EpisodesCompanion(')
          ..write('id: $id, ')
          ..write('seasonid: $seasonid, ')
          ..write('number: $number, ')
          ..write('name: $name, ')
          ..write('overview: $overview, ')
          ..write('filePath: $filePath, ')
          ..write('posterPath: $posterPath, ')
          ..write('airDate: $airDate, ')
          ..write('vote: $vote, ')
          ..write('watchedTime: $watchedTime, ')
          ..write('watchStatus: $watchStatus, ')
          ..write('runTime: $runTime, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ActorsTable extends Actors with TableInfo<$ActorsTable, Actor> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ActorsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _profilePathMeta =
      const VerificationMeta('profilePath');
  @override
  late final GeneratedColumn<String> profilePath = GeneratedColumn<String>(
      'profile_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, profilePath];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'actors';
  @override
  VerificationContext validateIntegrity(Insertable<Actor> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('profile_path')) {
      context.handle(
          _profilePathMeta,
          profilePath.isAcceptableOrUnknown(
              data['profile_path']!, _profilePathMeta));
    } else if (isInserting) {
      context.missing(_profilePathMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Actor map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Actor(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      profilePath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}profile_path'])!,
    );
  }

  @override
  $ActorsTable createAlias(String alias) {
    return $ActorsTable(attachedDatabase, alias);
  }
}

class Actor extends DataClass implements Insertable<Actor> {
  final int id;
  final String name;
  final String profilePath;
  const Actor(
      {required this.id, required this.name, required this.profilePath});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['profile_path'] = Variable<String>(profilePath);
    return map;
  }

  ActorsCompanion toCompanion(bool nullToAbsent) {
    return ActorsCompanion(
      id: Value(id),
      name: Value(name),
      profilePath: Value(profilePath),
    );
  }

  factory Actor.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Actor(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      profilePath: serializer.fromJson<String>(json['profilePath']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'profilePath': serializer.toJson<String>(profilePath),
    };
  }

  Actor copyWith({int? id, String? name, String? profilePath}) => Actor(
        id: id ?? this.id,
        name: name ?? this.name,
        profilePath: profilePath ?? this.profilePath,
      );
  Actor copyWithCompanion(ActorsCompanion data) {
    return Actor(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      profilePath:
          data.profilePath.present ? data.profilePath.value : this.profilePath,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Actor(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('profilePath: $profilePath')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, profilePath);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Actor &&
          other.id == this.id &&
          other.name == this.name &&
          other.profilePath == this.profilePath);
}

class ActorsCompanion extends UpdateCompanion<Actor> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> profilePath;
  const ActorsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.profilePath = const Value.absent(),
  });
  ActorsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String profilePath,
  })  : name = Value(name),
        profilePath = Value(profilePath);
  static Insertable<Actor> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? profilePath,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (profilePath != null) 'profile_path': profilePath,
    });
  }

  ActorsCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<String>? profilePath}) {
    return ActorsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      profilePath: profilePath ?? this.profilePath,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (profilePath.present) {
      map['profile_path'] = Variable<String>(profilePath.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ActorsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('profilePath: $profilePath')
          ..write(')'))
        .toString();
  }
}

class $MovieCastTable extends MovieCast
    with TableInfo<$MovieCastTable, MovieCastData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MovieCastTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _actorIdMeta =
      const VerificationMeta('actorId');
  @override
  late final GeneratedColumn<int> actorId = GeneratedColumn<int>(
      'actor_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES actors (id)'));
  static const VerificationMeta _movieIdMeta =
      const VerificationMeta('movieId');
  @override
  late final GeneratedColumn<int> movieId = GeneratedColumn<int>(
      'movie_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES movies_table (id)'));
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumn<String> role = GeneratedColumn<String>(
      'role', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _asMeta = const VerificationMeta('as');
  @override
  late final GeneratedColumn<String> as = GeneratedColumn<String>(
      'as', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [actorId, movieId, role, as];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'movie_cast';
  @override
  VerificationContext validateIntegrity(Insertable<MovieCastData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('actor_id')) {
      context.handle(_actorIdMeta,
          actorId.isAcceptableOrUnknown(data['actor_id']!, _actorIdMeta));
    } else if (isInserting) {
      context.missing(_actorIdMeta);
    }
    if (data.containsKey('movie_id')) {
      context.handle(_movieIdMeta,
          movieId.isAcceptableOrUnknown(data['movie_id']!, _movieIdMeta));
    } else if (isInserting) {
      context.missing(_movieIdMeta);
    }
    if (data.containsKey('role')) {
      context.handle(
          _roleMeta, role.isAcceptableOrUnknown(data['role']!, _roleMeta));
    } else if (isInserting) {
      context.missing(_roleMeta);
    }
    if (data.containsKey('as')) {
      context.handle(_asMeta, as.isAcceptableOrUnknown(data['as']!, _asMeta));
    } else if (isInserting) {
      context.missing(_asMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {actorId, movieId, role};
  @override
  MovieCastData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MovieCastData(
      actorId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}actor_id'])!,
      movieId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}movie_id'])!,
      role: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}role'])!,
      as: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}as'])!,
    );
  }

  @override
  $MovieCastTable createAlias(String alias) {
    return $MovieCastTable(attachedDatabase, alias);
  }
}

class MovieCastData extends DataClass implements Insertable<MovieCastData> {
  final int actorId;
  final int movieId;
  final String role;
  final String as;
  const MovieCastData(
      {required this.actorId,
      required this.movieId,
      required this.role,
      required this.as});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['actor_id'] = Variable<int>(actorId);
    map['movie_id'] = Variable<int>(movieId);
    map['role'] = Variable<String>(role);
    map['as'] = Variable<String>(as);
    return map;
  }

  MovieCastCompanion toCompanion(bool nullToAbsent) {
    return MovieCastCompanion(
      actorId: Value(actorId),
      movieId: Value(movieId),
      role: Value(role),
      as: Value(as),
    );
  }

  factory MovieCastData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MovieCastData(
      actorId: serializer.fromJson<int>(json['actorId']),
      movieId: serializer.fromJson<int>(json['movieId']),
      role: serializer.fromJson<String>(json['role']),
      as: serializer.fromJson<String>(json['as']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'actorId': serializer.toJson<int>(actorId),
      'movieId': serializer.toJson<int>(movieId),
      'role': serializer.toJson<String>(role),
      'as': serializer.toJson<String>(as),
    };
  }

  MovieCastData copyWith(
          {int? actorId, int? movieId, String? role, String? as}) =>
      MovieCastData(
        actorId: actorId ?? this.actorId,
        movieId: movieId ?? this.movieId,
        role: role ?? this.role,
        as: as ?? this.as,
      );
  MovieCastData copyWithCompanion(MovieCastCompanion data) {
    return MovieCastData(
      actorId: data.actorId.present ? data.actorId.value : this.actorId,
      movieId: data.movieId.present ? data.movieId.value : this.movieId,
      role: data.role.present ? data.role.value : this.role,
      as: data.as.present ? data.as.value : this.as,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MovieCastData(')
          ..write('actorId: $actorId, ')
          ..write('movieId: $movieId, ')
          ..write('role: $role, ')
          ..write('as: $as')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(actorId, movieId, role, as);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MovieCastData &&
          other.actorId == this.actorId &&
          other.movieId == this.movieId &&
          other.role == this.role &&
          other.as == this.as);
}

class MovieCastCompanion extends UpdateCompanion<MovieCastData> {
  final Value<int> actorId;
  final Value<int> movieId;
  final Value<String> role;
  final Value<String> as;
  final Value<int> rowid;
  const MovieCastCompanion({
    this.actorId = const Value.absent(),
    this.movieId = const Value.absent(),
    this.role = const Value.absent(),
    this.as = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MovieCastCompanion.insert({
    required int actorId,
    required int movieId,
    required String role,
    required String as,
    this.rowid = const Value.absent(),
  })  : actorId = Value(actorId),
        movieId = Value(movieId),
        role = Value(role),
        as = Value(as);
  static Insertable<MovieCastData> custom({
    Expression<int>? actorId,
    Expression<int>? movieId,
    Expression<String>? role,
    Expression<String>? as,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (actorId != null) 'actor_id': actorId,
      if (movieId != null) 'movie_id': movieId,
      if (role != null) 'role': role,
      if (as != null) 'as': as,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MovieCastCompanion copyWith(
      {Value<int>? actorId,
      Value<int>? movieId,
      Value<String>? role,
      Value<String>? as,
      Value<int>? rowid}) {
    return MovieCastCompanion(
      actorId: actorId ?? this.actorId,
      movieId: movieId ?? this.movieId,
      role: role ?? this.role,
      as: as ?? this.as,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (actorId.present) {
      map['actor_id'] = Variable<int>(actorId.value);
    }
    if (movieId.present) {
      map['movie_id'] = Variable<int>(movieId.value);
    }
    if (role.present) {
      map['role'] = Variable<String>(role.value);
    }
    if (as.present) {
      map['as'] = Variable<String>(as.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MovieCastCompanion(')
          ..write('actorId: $actorId, ')
          ..write('movieId: $movieId, ')
          ..write('role: $role, ')
          ..write('as: $as, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $GenresTable extends Genres with TableInfo<$GenresTable, Genre> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GenresTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'genres';
  @override
  VerificationContext validateIntegrity(Insertable<Genre> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Genre map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Genre(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $GenresTable createAlias(String alias) {
    return $GenresTable(attachedDatabase, alias);
  }
}

class Genre extends DataClass implements Insertable<Genre> {
  final int id;
  final String name;
  const Genre({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  GenresCompanion toCompanion(bool nullToAbsent) {
    return GenresCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory Genre.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Genre(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  Genre copyWith({int? id, String? name}) => Genre(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  Genre copyWithCompanion(GenresCompanion data) {
    return Genre(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Genre(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Genre && other.id == this.id && other.name == this.name);
}

class GenresCompanion extends UpdateCompanion<Genre> {
  final Value<int> id;
  final Value<String> name;
  const GenresCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  GenresCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<Genre> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  GenresCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return GenresCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GenresCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $MovieGenresTable extends MovieGenres
    with TableInfo<$MovieGenresTable, MovieGenre> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MovieGenresTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _movieIdMeta =
      const VerificationMeta('movieId');
  @override
  late final GeneratedColumn<int> movieId = GeneratedColumn<int>(
      'movie_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES movies_table (id)'));
  static const VerificationMeta _genreIdMeta =
      const VerificationMeta('genreId');
  @override
  late final GeneratedColumn<int> genreId = GeneratedColumn<int>(
      'genre_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES genres (id)'));
  @override
  List<GeneratedColumn> get $columns => [movieId, genreId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'movie_genres';
  @override
  VerificationContext validateIntegrity(Insertable<MovieGenre> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('movie_id')) {
      context.handle(_movieIdMeta,
          movieId.isAcceptableOrUnknown(data['movie_id']!, _movieIdMeta));
    } else if (isInserting) {
      context.missing(_movieIdMeta);
    }
    if (data.containsKey('genre_id')) {
      context.handle(_genreIdMeta,
          genreId.isAcceptableOrUnknown(data['genre_id']!, _genreIdMeta));
    } else if (isInserting) {
      context.missing(_genreIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {movieId, genreId};
  @override
  MovieGenre map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MovieGenre(
      movieId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}movie_id'])!,
      genreId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}genre_id'])!,
    );
  }

  @override
  $MovieGenresTable createAlias(String alias) {
    return $MovieGenresTable(attachedDatabase, alias);
  }
}

class MovieGenre extends DataClass implements Insertable<MovieGenre> {
  final int movieId;
  final int genreId;
  const MovieGenre({required this.movieId, required this.genreId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['movie_id'] = Variable<int>(movieId);
    map['genre_id'] = Variable<int>(genreId);
    return map;
  }

  MovieGenresCompanion toCompanion(bool nullToAbsent) {
    return MovieGenresCompanion(
      movieId: Value(movieId),
      genreId: Value(genreId),
    );
  }

  factory MovieGenre.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MovieGenre(
      movieId: serializer.fromJson<int>(json['movieId']),
      genreId: serializer.fromJson<int>(json['genreId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'movieId': serializer.toJson<int>(movieId),
      'genreId': serializer.toJson<int>(genreId),
    };
  }

  MovieGenre copyWith({int? movieId, int? genreId}) => MovieGenre(
        movieId: movieId ?? this.movieId,
        genreId: genreId ?? this.genreId,
      );
  MovieGenre copyWithCompanion(MovieGenresCompanion data) {
    return MovieGenre(
      movieId: data.movieId.present ? data.movieId.value : this.movieId,
      genreId: data.genreId.present ? data.genreId.value : this.genreId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MovieGenre(')
          ..write('movieId: $movieId, ')
          ..write('genreId: $genreId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(movieId, genreId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MovieGenre &&
          other.movieId == this.movieId &&
          other.genreId == this.genreId);
}

class MovieGenresCompanion extends UpdateCompanion<MovieGenre> {
  final Value<int> movieId;
  final Value<int> genreId;
  final Value<int> rowid;
  const MovieGenresCompanion({
    this.movieId = const Value.absent(),
    this.genreId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MovieGenresCompanion.insert({
    required int movieId,
    required int genreId,
    this.rowid = const Value.absent(),
  })  : movieId = Value(movieId),
        genreId = Value(genreId);
  static Insertable<MovieGenre> custom({
    Expression<int>? movieId,
    Expression<int>? genreId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (movieId != null) 'movie_id': movieId,
      if (genreId != null) 'genre_id': genreId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MovieGenresCompanion copyWith(
      {Value<int>? movieId, Value<int>? genreId, Value<int>? rowid}) {
    return MovieGenresCompanion(
      movieId: movieId ?? this.movieId,
      genreId: genreId ?? this.genreId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (movieId.present) {
      map['movie_id'] = Variable<int>(movieId.value);
    }
    if (genreId.present) {
      map['genre_id'] = Variable<int>(genreId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MovieGenresCompanion(')
          ..write('movieId: $movieId, ')
          ..write('genreId: $genreId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TvGenresTable extends TvGenres with TableInfo<$TvGenresTable, TvGenre> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TvGenresTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _seriesIdMeta =
      const VerificationMeta('seriesId');
  @override
  late final GeneratedColumn<int> seriesId = GeneratedColumn<int>(
      'series_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES series (id)'));
  static const VerificationMeta _genreIdMeta =
      const VerificationMeta('genreId');
  @override
  late final GeneratedColumn<int> genreId = GeneratedColumn<int>(
      'genre_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES genres (id)'));
  @override
  List<GeneratedColumn> get $columns => [seriesId, genreId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tv_genres';
  @override
  VerificationContext validateIntegrity(Insertable<TvGenre> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('series_id')) {
      context.handle(_seriesIdMeta,
          seriesId.isAcceptableOrUnknown(data['series_id']!, _seriesIdMeta));
    } else if (isInserting) {
      context.missing(_seriesIdMeta);
    }
    if (data.containsKey('genre_id')) {
      context.handle(_genreIdMeta,
          genreId.isAcceptableOrUnknown(data['genre_id']!, _genreIdMeta));
    } else if (isInserting) {
      context.missing(_genreIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {seriesId, genreId};
  @override
  TvGenre map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TvGenre(
      seriesId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}series_id'])!,
      genreId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}genre_id'])!,
    );
  }

  @override
  $TvGenresTable createAlias(String alias) {
    return $TvGenresTable(attachedDatabase, alias);
  }
}

class TvGenre extends DataClass implements Insertable<TvGenre> {
  final int seriesId;
  final int genreId;
  const TvGenre({required this.seriesId, required this.genreId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['series_id'] = Variable<int>(seriesId);
    map['genre_id'] = Variable<int>(genreId);
    return map;
  }

  TvGenresCompanion toCompanion(bool nullToAbsent) {
    return TvGenresCompanion(
      seriesId: Value(seriesId),
      genreId: Value(genreId),
    );
  }

  factory TvGenre.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TvGenre(
      seriesId: serializer.fromJson<int>(json['seriesId']),
      genreId: serializer.fromJson<int>(json['genreId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'seriesId': serializer.toJson<int>(seriesId),
      'genreId': serializer.toJson<int>(genreId),
    };
  }

  TvGenre copyWith({int? seriesId, int? genreId}) => TvGenre(
        seriesId: seriesId ?? this.seriesId,
        genreId: genreId ?? this.genreId,
      );
  TvGenre copyWithCompanion(TvGenresCompanion data) {
    return TvGenre(
      seriesId: data.seriesId.present ? data.seriesId.value : this.seriesId,
      genreId: data.genreId.present ? data.genreId.value : this.genreId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TvGenre(')
          ..write('seriesId: $seriesId, ')
          ..write('genreId: $genreId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(seriesId, genreId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TvGenre &&
          other.seriesId == this.seriesId &&
          other.genreId == this.genreId);
}

class TvGenresCompanion extends UpdateCompanion<TvGenre> {
  final Value<int> seriesId;
  final Value<int> genreId;
  final Value<int> rowid;
  const TvGenresCompanion({
    this.seriesId = const Value.absent(),
    this.genreId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TvGenresCompanion.insert({
    required int seriesId,
    required int genreId,
    this.rowid = const Value.absent(),
  })  : seriesId = Value(seriesId),
        genreId = Value(genreId);
  static Insertable<TvGenre> custom({
    Expression<int>? seriesId,
    Expression<int>? genreId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (seriesId != null) 'series_id': seriesId,
      if (genreId != null) 'genre_id': genreId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TvGenresCompanion copyWith(
      {Value<int>? seriesId, Value<int>? genreId, Value<int>? rowid}) {
    return TvGenresCompanion(
      seriesId: seriesId ?? this.seriesId,
      genreId: genreId ?? this.genreId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (seriesId.present) {
      map['series_id'] = Variable<int>(seriesId.value);
    }
    if (genreId.present) {
      map['genre_id'] = Variable<int>(genreId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TvGenresCompanion(')
          ..write('seriesId: $seriesId, ')
          ..write('genreId: $genreId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TvCastTable extends TvCast with TableInfo<$TvCastTable, TvCastData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TvCastTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _actorIdMeta =
      const VerificationMeta('actorId');
  @override
  late final GeneratedColumn<int> actorId = GeneratedColumn<int>(
      'actor_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES actors (id)'));
  static const VerificationMeta _seriesIdMeta =
      const VerificationMeta('seriesId');
  @override
  late final GeneratedColumn<int> seriesId = GeneratedColumn<int>(
      'series_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES series (id)'));
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumn<String> role = GeneratedColumn<String>(
      'role', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _asMeta = const VerificationMeta('as');
  @override
  late final GeneratedColumn<String> as = GeneratedColumn<String>(
      'as', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [actorId, seriesId, role, as];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tv_cast';
  @override
  VerificationContext validateIntegrity(Insertable<TvCastData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('actor_id')) {
      context.handle(_actorIdMeta,
          actorId.isAcceptableOrUnknown(data['actor_id']!, _actorIdMeta));
    } else if (isInserting) {
      context.missing(_actorIdMeta);
    }
    if (data.containsKey('series_id')) {
      context.handle(_seriesIdMeta,
          seriesId.isAcceptableOrUnknown(data['series_id']!, _seriesIdMeta));
    } else if (isInserting) {
      context.missing(_seriesIdMeta);
    }
    if (data.containsKey('role')) {
      context.handle(
          _roleMeta, role.isAcceptableOrUnknown(data['role']!, _roleMeta));
    } else if (isInserting) {
      context.missing(_roleMeta);
    }
    if (data.containsKey('as')) {
      context.handle(_asMeta, as.isAcceptableOrUnknown(data['as']!, _asMeta));
    } else if (isInserting) {
      context.missing(_asMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {actorId, seriesId, role};
  @override
  TvCastData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TvCastData(
      actorId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}actor_id'])!,
      seriesId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}series_id'])!,
      role: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}role'])!,
      as: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}as'])!,
    );
  }

  @override
  $TvCastTable createAlias(String alias) {
    return $TvCastTable(attachedDatabase, alias);
  }
}

class TvCastData extends DataClass implements Insertable<TvCastData> {
  final int actorId;
  final int seriesId;
  final String role;
  final String as;
  const TvCastData(
      {required this.actorId,
      required this.seriesId,
      required this.role,
      required this.as});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['actor_id'] = Variable<int>(actorId);
    map['series_id'] = Variable<int>(seriesId);
    map['role'] = Variable<String>(role);
    map['as'] = Variable<String>(as);
    return map;
  }

  TvCastCompanion toCompanion(bool nullToAbsent) {
    return TvCastCompanion(
      actorId: Value(actorId),
      seriesId: Value(seriesId),
      role: Value(role),
      as: Value(as),
    );
  }

  factory TvCastData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TvCastData(
      actorId: serializer.fromJson<int>(json['actorId']),
      seriesId: serializer.fromJson<int>(json['seriesId']),
      role: serializer.fromJson<String>(json['role']),
      as: serializer.fromJson<String>(json['as']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'actorId': serializer.toJson<int>(actorId),
      'seriesId': serializer.toJson<int>(seriesId),
      'role': serializer.toJson<String>(role),
      'as': serializer.toJson<String>(as),
    };
  }

  TvCastData copyWith(
          {int? actorId, int? seriesId, String? role, String? as}) =>
      TvCastData(
        actorId: actorId ?? this.actorId,
        seriesId: seriesId ?? this.seriesId,
        role: role ?? this.role,
        as: as ?? this.as,
      );
  TvCastData copyWithCompanion(TvCastCompanion data) {
    return TvCastData(
      actorId: data.actorId.present ? data.actorId.value : this.actorId,
      seriesId: data.seriesId.present ? data.seriesId.value : this.seriesId,
      role: data.role.present ? data.role.value : this.role,
      as: data.as.present ? data.as.value : this.as,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TvCastData(')
          ..write('actorId: $actorId, ')
          ..write('seriesId: $seriesId, ')
          ..write('role: $role, ')
          ..write('as: $as')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(actorId, seriesId, role, as);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TvCastData &&
          other.actorId == this.actorId &&
          other.seriesId == this.seriesId &&
          other.role == this.role &&
          other.as == this.as);
}

class TvCastCompanion extends UpdateCompanion<TvCastData> {
  final Value<int> actorId;
  final Value<int> seriesId;
  final Value<String> role;
  final Value<String> as;
  final Value<int> rowid;
  const TvCastCompanion({
    this.actorId = const Value.absent(),
    this.seriesId = const Value.absent(),
    this.role = const Value.absent(),
    this.as = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TvCastCompanion.insert({
    required int actorId,
    required int seriesId,
    required String role,
    required String as,
    this.rowid = const Value.absent(),
  })  : actorId = Value(actorId),
        seriesId = Value(seriesId),
        role = Value(role),
        as = Value(as);
  static Insertable<TvCastData> custom({
    Expression<int>? actorId,
    Expression<int>? seriesId,
    Expression<String>? role,
    Expression<String>? as,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (actorId != null) 'actor_id': actorId,
      if (seriesId != null) 'series_id': seriesId,
      if (role != null) 'role': role,
      if (as != null) 'as': as,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TvCastCompanion copyWith(
      {Value<int>? actorId,
      Value<int>? seriesId,
      Value<String>? role,
      Value<String>? as,
      Value<int>? rowid}) {
    return TvCastCompanion(
      actorId: actorId ?? this.actorId,
      seriesId: seriesId ?? this.seriesId,
      role: role ?? this.role,
      as: as ?? this.as,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (actorId.present) {
      map['actor_id'] = Variable<int>(actorId.value);
    }
    if (seriesId.present) {
      map['series_id'] = Variable<int>(seriesId.value);
    }
    if (role.present) {
      map['role'] = Variable<String>(role.value);
    }
    if (as.present) {
      map['as'] = Variable<String>(as.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TvCastCompanion(')
          ..write('actorId: $actorId, ')
          ..write('seriesId: $seriesId, ')
          ..write('role: $role, ')
          ..write('as: $as, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $MoviesTableTable moviesTable = $MoviesTableTable(this);
  late final $SeriesTable series = $SeriesTable(this);
  late final $SeasonsTable seasons = $SeasonsTable(this);
  late final $EpisodesTable episodes = $EpisodesTable(this);
  late final $ActorsTable actors = $ActorsTable(this);
  late final $MovieCastTable movieCast = $MovieCastTable(this);
  late final $GenresTable genres = $GenresTable(this);
  late final $MovieGenresTable movieGenres = $MovieGenresTable(this);
  late final $TvGenresTable tvGenres = $TvGenresTable(this);
  late final $TvCastTable tvCast = $TvCastTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        moviesTable,
        series,
        seasons,
        episodes,
        actors,
        movieCast,
        genres,
        movieGenres,
        tvGenres,
        tvCast
      ];
}

typedef $$MoviesTableTableCreateCompanionBuilder = MoviesTableCompanion
    Function({
  required int id,
  required bool adult,
  required String backdropPath,
  required String name,
  required String tagLine,
  required String overview,
  required String posterPath,
  required String logoPath,
  required String videoFile,
  Value<String?> subtitlesFolder,
  required String resolution,
  required String homePage,
  required DateTime releaseDate,
  required String imdb,
  required double vote,
  Value<int> watchedTime,
  Value<int> watchStatus,
  required int runTime,
  Value<int> rowid,
});
typedef $$MoviesTableTableUpdateCompanionBuilder = MoviesTableCompanion
    Function({
  Value<int> id,
  Value<bool> adult,
  Value<String> backdropPath,
  Value<String> name,
  Value<String> tagLine,
  Value<String> overview,
  Value<String> posterPath,
  Value<String> logoPath,
  Value<String> videoFile,
  Value<String?> subtitlesFolder,
  Value<String> resolution,
  Value<String> homePage,
  Value<DateTime> releaseDate,
  Value<String> imdb,
  Value<double> vote,
  Value<int> watchedTime,
  Value<int> watchStatus,
  Value<int> runTime,
  Value<int> rowid,
});

final class $$MoviesTableTableReferences
    extends BaseReferences<_$AppDatabase, $MoviesTableTable, MoviesTableData> {
  $$MoviesTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$MovieCastTable, List<MovieCastData>>
      _movieCastRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.movieCast,
          aliasName:
              $_aliasNameGenerator(db.moviesTable.id, db.movieCast.movieId));

  $$MovieCastTableProcessedTableManager get movieCastRefs {
    final manager = $$MovieCastTableTableManager($_db, $_db.movieCast)
        .filter((f) => f.movieId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_movieCastRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$MovieGenresTable, List<MovieGenre>>
      _movieGenresRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.movieGenres,
          aliasName:
              $_aliasNameGenerator(db.moviesTable.id, db.movieGenres.movieId));

  $$MovieGenresTableProcessedTableManager get movieGenresRefs {
    final manager = $$MovieGenresTableTableManager($_db, $_db.movieGenres)
        .filter((f) => f.movieId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_movieGenresRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$MoviesTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $MoviesTableTable> {
  $$MoviesTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get adult => $state.composableBuilder(
      column: $state.table.adult,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get backdropPath => $state.composableBuilder(
      column: $state.table.backdropPath,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get tagLine => $state.composableBuilder(
      column: $state.table.tagLine,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get overview => $state.composableBuilder(
      column: $state.table.overview,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get posterPath => $state.composableBuilder(
      column: $state.table.posterPath,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get logoPath => $state.composableBuilder(
      column: $state.table.logoPath,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get videoFile => $state.composableBuilder(
      column: $state.table.videoFile,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get subtitlesFolder => $state.composableBuilder(
      column: $state.table.subtitlesFolder,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get resolution => $state.composableBuilder(
      column: $state.table.resolution,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get homePage => $state.composableBuilder(
      column: $state.table.homePage,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get releaseDate => $state.composableBuilder(
      column: $state.table.releaseDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get imdb => $state.composableBuilder(
      column: $state.table.imdb,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get vote => $state.composableBuilder(
      column: $state.table.vote,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get watchedTime => $state.composableBuilder(
      column: $state.table.watchedTime,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get watchStatus => $state.composableBuilder(
      column: $state.table.watchStatus,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get runTime => $state.composableBuilder(
      column: $state.table.runTime,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter movieCastRefs(
      ComposableFilter Function($$MovieCastTableFilterComposer f) f) {
    final $$MovieCastTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.movieCast,
        getReferencedColumn: (t) => t.movieId,
        builder: (joinBuilder, parentComposers) =>
            $$MovieCastTableFilterComposer(ComposerState(
                $state.db, $state.db.movieCast, joinBuilder, parentComposers)));
    return f(composer);
  }

  ComposableFilter movieGenresRefs(
      ComposableFilter Function($$MovieGenresTableFilterComposer f) f) {
    final $$MovieGenresTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.movieGenres,
        getReferencedColumn: (t) => t.movieId,
        builder: (joinBuilder, parentComposers) =>
            $$MovieGenresTableFilterComposer(ComposerState($state.db,
                $state.db.movieGenres, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$MoviesTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $MoviesTableTable> {
  $$MoviesTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get adult => $state.composableBuilder(
      column: $state.table.adult,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get backdropPath => $state.composableBuilder(
      column: $state.table.backdropPath,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get tagLine => $state.composableBuilder(
      column: $state.table.tagLine,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get overview => $state.composableBuilder(
      column: $state.table.overview,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get posterPath => $state.composableBuilder(
      column: $state.table.posterPath,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get logoPath => $state.composableBuilder(
      column: $state.table.logoPath,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get videoFile => $state.composableBuilder(
      column: $state.table.videoFile,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get subtitlesFolder => $state.composableBuilder(
      column: $state.table.subtitlesFolder,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get resolution => $state.composableBuilder(
      column: $state.table.resolution,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get homePage => $state.composableBuilder(
      column: $state.table.homePage,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get releaseDate => $state.composableBuilder(
      column: $state.table.releaseDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get imdb => $state.composableBuilder(
      column: $state.table.imdb,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get vote => $state.composableBuilder(
      column: $state.table.vote,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get watchedTime => $state.composableBuilder(
      column: $state.table.watchedTime,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get watchStatus => $state.composableBuilder(
      column: $state.table.watchStatus,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get runTime => $state.composableBuilder(
      column: $state.table.runTime,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$MoviesTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MoviesTableTable,
    MoviesTableData,
    $$MoviesTableTableFilterComposer,
    $$MoviesTableTableOrderingComposer,
    $$MoviesTableTableCreateCompanionBuilder,
    $$MoviesTableTableUpdateCompanionBuilder,
    (MoviesTableData, $$MoviesTableTableReferences),
    MoviesTableData,
    PrefetchHooks Function({bool movieCastRefs, bool movieGenresRefs})> {
  $$MoviesTableTableTableManager(_$AppDatabase db, $MoviesTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$MoviesTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$MoviesTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<bool> adult = const Value.absent(),
            Value<String> backdropPath = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> tagLine = const Value.absent(),
            Value<String> overview = const Value.absent(),
            Value<String> posterPath = const Value.absent(),
            Value<String> logoPath = const Value.absent(),
            Value<String> videoFile = const Value.absent(),
            Value<String?> subtitlesFolder = const Value.absent(),
            Value<String> resolution = const Value.absent(),
            Value<String> homePage = const Value.absent(),
            Value<DateTime> releaseDate = const Value.absent(),
            Value<String> imdb = const Value.absent(),
            Value<double> vote = const Value.absent(),
            Value<int> watchedTime = const Value.absent(),
            Value<int> watchStatus = const Value.absent(),
            Value<int> runTime = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MoviesTableCompanion(
            id: id,
            adult: adult,
            backdropPath: backdropPath,
            name: name,
            tagLine: tagLine,
            overview: overview,
            posterPath: posterPath,
            logoPath: logoPath,
            videoFile: videoFile,
            subtitlesFolder: subtitlesFolder,
            resolution: resolution,
            homePage: homePage,
            releaseDate: releaseDate,
            imdb: imdb,
            vote: vote,
            watchedTime: watchedTime,
            watchStatus: watchStatus,
            runTime: runTime,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int id,
            required bool adult,
            required String backdropPath,
            required String name,
            required String tagLine,
            required String overview,
            required String posterPath,
            required String logoPath,
            required String videoFile,
            Value<String?> subtitlesFolder = const Value.absent(),
            required String resolution,
            required String homePage,
            required DateTime releaseDate,
            required String imdb,
            required double vote,
            Value<int> watchedTime = const Value.absent(),
            Value<int> watchStatus = const Value.absent(),
            required int runTime,
            Value<int> rowid = const Value.absent(),
          }) =>
              MoviesTableCompanion.insert(
            id: id,
            adult: adult,
            backdropPath: backdropPath,
            name: name,
            tagLine: tagLine,
            overview: overview,
            posterPath: posterPath,
            logoPath: logoPath,
            videoFile: videoFile,
            subtitlesFolder: subtitlesFolder,
            resolution: resolution,
            homePage: homePage,
            releaseDate: releaseDate,
            imdb: imdb,
            vote: vote,
            watchedTime: watchedTime,
            watchStatus: watchStatus,
            runTime: runTime,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$MoviesTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {movieCastRefs = false, movieGenresRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (movieCastRefs) db.movieCast,
                if (movieGenresRefs) db.movieGenres
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (movieCastRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$MoviesTableTableReferences
                            ._movieCastRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$MoviesTableTableReferences(db, table, p0)
                                .movieCastRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.movieId == item.id),
                        typedResults: items),
                  if (movieGenresRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$MoviesTableTableReferences
                            ._movieGenresRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$MoviesTableTableReferences(db, table, p0)
                                .movieGenresRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.movieId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$MoviesTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $MoviesTableTable,
    MoviesTableData,
    $$MoviesTableTableFilterComposer,
    $$MoviesTableTableOrderingComposer,
    $$MoviesTableTableCreateCompanionBuilder,
    $$MoviesTableTableUpdateCompanionBuilder,
    (MoviesTableData, $$MoviesTableTableReferences),
    MoviesTableData,
    PrefetchHooks Function({bool movieCastRefs, bool movieGenresRefs})>;
typedef $$SeriesTableCreateCompanionBuilder = SeriesCompanion Function({
  required int id,
  required String name,
  required String tagLine,
  required String overview,
  required String logoPath,
  required String posterPath,
  required String backdropPath,
  required String homePage,
  required DateTime firstAirDate,
  required DateTime lastAirDate,
  required double vote,
  Value<int> watchStatus,
  Value<int> rowid,
});
typedef $$SeriesTableUpdateCompanionBuilder = SeriesCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> tagLine,
  Value<String> overview,
  Value<String> logoPath,
  Value<String> posterPath,
  Value<String> backdropPath,
  Value<String> homePage,
  Value<DateTime> firstAirDate,
  Value<DateTime> lastAirDate,
  Value<double> vote,
  Value<int> watchStatus,
  Value<int> rowid,
});

final class $$SeriesTableReferences
    extends BaseReferences<_$AppDatabase, $SeriesTable, Sery> {
  $$SeriesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$SeasonsTable, List<Season>> _seasonsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.seasons,
          aliasName: $_aliasNameGenerator(db.series.id, db.seasons.seriesid));

  $$SeasonsTableProcessedTableManager get seasonsRefs {
    final manager = $$SeasonsTableTableManager($_db, $_db.seasons)
        .filter((f) => f.seriesid.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_seasonsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$TvGenresTable, List<TvGenre>> _tvGenresRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.tvGenres,
          aliasName: $_aliasNameGenerator(db.series.id, db.tvGenres.seriesId));

  $$TvGenresTableProcessedTableManager get tvGenresRefs {
    final manager = $$TvGenresTableTableManager($_db, $_db.tvGenres)
        .filter((f) => f.seriesId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_tvGenresRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$TvCastTable, List<TvCastData>> _tvCastRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.tvCast,
          aliasName: $_aliasNameGenerator(db.series.id, db.tvCast.seriesId));

  $$TvCastTableProcessedTableManager get tvCastRefs {
    final manager = $$TvCastTableTableManager($_db, $_db.tvCast)
        .filter((f) => f.seriesId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_tvCastRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$SeriesTableFilterComposer
    extends FilterComposer<_$AppDatabase, $SeriesTable> {
  $$SeriesTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get tagLine => $state.composableBuilder(
      column: $state.table.tagLine,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get overview => $state.composableBuilder(
      column: $state.table.overview,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get logoPath => $state.composableBuilder(
      column: $state.table.logoPath,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get posterPath => $state.composableBuilder(
      column: $state.table.posterPath,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get backdropPath => $state.composableBuilder(
      column: $state.table.backdropPath,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get homePage => $state.composableBuilder(
      column: $state.table.homePage,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get firstAirDate => $state.composableBuilder(
      column: $state.table.firstAirDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get lastAirDate => $state.composableBuilder(
      column: $state.table.lastAirDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get vote => $state.composableBuilder(
      column: $state.table.vote,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get watchStatus => $state.composableBuilder(
      column: $state.table.watchStatus,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter seasonsRefs(
      ComposableFilter Function($$SeasonsTableFilterComposer f) f) {
    final $$SeasonsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.seasons,
        getReferencedColumn: (t) => t.seriesid,
        builder: (joinBuilder, parentComposers) => $$SeasonsTableFilterComposer(
            ComposerState(
                $state.db, $state.db.seasons, joinBuilder, parentComposers)));
    return f(composer);
  }

  ComposableFilter tvGenresRefs(
      ComposableFilter Function($$TvGenresTableFilterComposer f) f) {
    final $$TvGenresTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.tvGenres,
        getReferencedColumn: (t) => t.seriesId,
        builder: (joinBuilder, parentComposers) =>
            $$TvGenresTableFilterComposer(ComposerState(
                $state.db, $state.db.tvGenres, joinBuilder, parentComposers)));
    return f(composer);
  }

  ComposableFilter tvCastRefs(
      ComposableFilter Function($$TvCastTableFilterComposer f) f) {
    final $$TvCastTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.tvCast,
        getReferencedColumn: (t) => t.seriesId,
        builder: (joinBuilder, parentComposers) => $$TvCastTableFilterComposer(
            ComposerState(
                $state.db, $state.db.tvCast, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$SeriesTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $SeriesTable> {
  $$SeriesTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get tagLine => $state.composableBuilder(
      column: $state.table.tagLine,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get overview => $state.composableBuilder(
      column: $state.table.overview,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get logoPath => $state.composableBuilder(
      column: $state.table.logoPath,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get posterPath => $state.composableBuilder(
      column: $state.table.posterPath,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get backdropPath => $state.composableBuilder(
      column: $state.table.backdropPath,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get homePage => $state.composableBuilder(
      column: $state.table.homePage,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get firstAirDate => $state.composableBuilder(
      column: $state.table.firstAirDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get lastAirDate => $state.composableBuilder(
      column: $state.table.lastAirDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get vote => $state.composableBuilder(
      column: $state.table.vote,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get watchStatus => $state.composableBuilder(
      column: $state.table.watchStatus,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$SeriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SeriesTable,
    Sery,
    $$SeriesTableFilterComposer,
    $$SeriesTableOrderingComposer,
    $$SeriesTableCreateCompanionBuilder,
    $$SeriesTableUpdateCompanionBuilder,
    (Sery, $$SeriesTableReferences),
    Sery,
    PrefetchHooks Function(
        {bool seasonsRefs, bool tvGenresRefs, bool tvCastRefs})> {
  $$SeriesTableTableManager(_$AppDatabase db, $SeriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$SeriesTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$SeriesTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> tagLine = const Value.absent(),
            Value<String> overview = const Value.absent(),
            Value<String> logoPath = const Value.absent(),
            Value<String> posterPath = const Value.absent(),
            Value<String> backdropPath = const Value.absent(),
            Value<String> homePage = const Value.absent(),
            Value<DateTime> firstAirDate = const Value.absent(),
            Value<DateTime> lastAirDate = const Value.absent(),
            Value<double> vote = const Value.absent(),
            Value<int> watchStatus = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SeriesCompanion(
            id: id,
            name: name,
            tagLine: tagLine,
            overview: overview,
            logoPath: logoPath,
            posterPath: posterPath,
            backdropPath: backdropPath,
            homePage: homePage,
            firstAirDate: firstAirDate,
            lastAirDate: lastAirDate,
            vote: vote,
            watchStatus: watchStatus,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int id,
            required String name,
            required String tagLine,
            required String overview,
            required String logoPath,
            required String posterPath,
            required String backdropPath,
            required String homePage,
            required DateTime firstAirDate,
            required DateTime lastAirDate,
            required double vote,
            Value<int> watchStatus = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SeriesCompanion.insert(
            id: id,
            name: name,
            tagLine: tagLine,
            overview: overview,
            logoPath: logoPath,
            posterPath: posterPath,
            backdropPath: backdropPath,
            homePage: homePage,
            firstAirDate: firstAirDate,
            lastAirDate: lastAirDate,
            vote: vote,
            watchStatus: watchStatus,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$SeriesTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {seasonsRefs = false, tvGenresRefs = false, tvCastRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (seasonsRefs) db.seasons,
                if (tvGenresRefs) db.tvGenres,
                if (tvCastRefs) db.tvCast
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (seasonsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$SeriesTableReferences._seasonsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$SeriesTableReferences(db, table, p0).seasonsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.seriesid == item.id),
                        typedResults: items),
                  if (tvGenresRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$SeriesTableReferences._tvGenresRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$SeriesTableReferences(db, table, p0).tvGenresRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.seriesId == item.id),
                        typedResults: items),
                  if (tvCastRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$SeriesTableReferences._tvCastRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$SeriesTableReferences(db, table, p0).tvCastRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.seriesId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$SeriesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SeriesTable,
    Sery,
    $$SeriesTableFilterComposer,
    $$SeriesTableOrderingComposer,
    $$SeriesTableCreateCompanionBuilder,
    $$SeriesTableUpdateCompanionBuilder,
    (Sery, $$SeriesTableReferences),
    Sery,
    PrefetchHooks Function(
        {bool seasonsRefs, bool tvGenresRefs, bool tvCastRefs})>;
typedef $$SeasonsTableCreateCompanionBuilder = SeasonsCompanion Function({
  required int id,
  required int number,
  required int seriesid,
  required String overview,
  required String posterPath,
  required String seasonFolder,
  required DateTime airDate,
  required double vote,
  Value<int> watchStatus,
  Value<int> rowid,
});
typedef $$SeasonsTableUpdateCompanionBuilder = SeasonsCompanion Function({
  Value<int> id,
  Value<int> number,
  Value<int> seriesid,
  Value<String> overview,
  Value<String> posterPath,
  Value<String> seasonFolder,
  Value<DateTime> airDate,
  Value<double> vote,
  Value<int> watchStatus,
  Value<int> rowid,
});

final class $$SeasonsTableReferences
    extends BaseReferences<_$AppDatabase, $SeasonsTable, Season> {
  $$SeasonsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $SeriesTable _seriesidTable(_$AppDatabase db) => db.series
      .createAlias($_aliasNameGenerator(db.seasons.seriesid, db.series.id));

  $$SeriesTableProcessedTableManager? get seriesid {
    if ($_item.seriesid == null) return null;
    final manager = $$SeriesTableTableManager($_db, $_db.series)
        .filter((f) => f.id($_item.seriesid!));
    final item = $_typedResult.readTableOrNull(_seriesidTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$EpisodesTable, List<Episode>> _episodesRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.episodes,
          aliasName: $_aliasNameGenerator(db.seasons.id, db.episodes.seasonid));

  $$EpisodesTableProcessedTableManager get episodesRefs {
    final manager = $$EpisodesTableTableManager($_db, $_db.episodes)
        .filter((f) => f.seasonid.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_episodesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$SeasonsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $SeasonsTable> {
  $$SeasonsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get number => $state.composableBuilder(
      column: $state.table.number,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get overview => $state.composableBuilder(
      column: $state.table.overview,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get posterPath => $state.composableBuilder(
      column: $state.table.posterPath,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get seasonFolder => $state.composableBuilder(
      column: $state.table.seasonFolder,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get airDate => $state.composableBuilder(
      column: $state.table.airDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get vote => $state.composableBuilder(
      column: $state.table.vote,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get watchStatus => $state.composableBuilder(
      column: $state.table.watchStatus,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$SeriesTableFilterComposer get seriesid {
    final $$SeriesTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.seriesid,
        referencedTable: $state.db.series,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$SeriesTableFilterComposer(
            ComposerState(
                $state.db, $state.db.series, joinBuilder, parentComposers)));
    return composer;
  }

  ComposableFilter episodesRefs(
      ComposableFilter Function($$EpisodesTableFilterComposer f) f) {
    final $$EpisodesTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.episodes,
        getReferencedColumn: (t) => t.seasonid,
        builder: (joinBuilder, parentComposers) =>
            $$EpisodesTableFilterComposer(ComposerState(
                $state.db, $state.db.episodes, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$SeasonsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $SeasonsTable> {
  $$SeasonsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get number => $state.composableBuilder(
      column: $state.table.number,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get overview => $state.composableBuilder(
      column: $state.table.overview,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get posterPath => $state.composableBuilder(
      column: $state.table.posterPath,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get seasonFolder => $state.composableBuilder(
      column: $state.table.seasonFolder,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get airDate => $state.composableBuilder(
      column: $state.table.airDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get vote => $state.composableBuilder(
      column: $state.table.vote,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get watchStatus => $state.composableBuilder(
      column: $state.table.watchStatus,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$SeriesTableOrderingComposer get seriesid {
    final $$SeriesTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.seriesid,
        referencedTable: $state.db.series,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$SeriesTableOrderingComposer(ComposerState(
                $state.db, $state.db.series, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$SeasonsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SeasonsTable,
    Season,
    $$SeasonsTableFilterComposer,
    $$SeasonsTableOrderingComposer,
    $$SeasonsTableCreateCompanionBuilder,
    $$SeasonsTableUpdateCompanionBuilder,
    (Season, $$SeasonsTableReferences),
    Season,
    PrefetchHooks Function({bool seriesid, bool episodesRefs})> {
  $$SeasonsTableTableManager(_$AppDatabase db, $SeasonsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$SeasonsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$SeasonsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> number = const Value.absent(),
            Value<int> seriesid = const Value.absent(),
            Value<String> overview = const Value.absent(),
            Value<String> posterPath = const Value.absent(),
            Value<String> seasonFolder = const Value.absent(),
            Value<DateTime> airDate = const Value.absent(),
            Value<double> vote = const Value.absent(),
            Value<int> watchStatus = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SeasonsCompanion(
            id: id,
            number: number,
            seriesid: seriesid,
            overview: overview,
            posterPath: posterPath,
            seasonFolder: seasonFolder,
            airDate: airDate,
            vote: vote,
            watchStatus: watchStatus,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int id,
            required int number,
            required int seriesid,
            required String overview,
            required String posterPath,
            required String seasonFolder,
            required DateTime airDate,
            required double vote,
            Value<int> watchStatus = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SeasonsCompanion.insert(
            id: id,
            number: number,
            seriesid: seriesid,
            overview: overview,
            posterPath: posterPath,
            seasonFolder: seasonFolder,
            airDate: airDate,
            vote: vote,
            watchStatus: watchStatus,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$SeasonsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({seriesid = false, episodesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (episodesRefs) db.episodes],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (seriesid) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.seriesid,
                    referencedTable:
                        $$SeasonsTableReferences._seriesidTable(db),
                    referencedColumn:
                        $$SeasonsTableReferences._seriesidTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (episodesRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$SeasonsTableReferences._episodesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$SeasonsTableReferences(db, table, p0)
                                .episodesRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.seasonid == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$SeasonsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SeasonsTable,
    Season,
    $$SeasonsTableFilterComposer,
    $$SeasonsTableOrderingComposer,
    $$SeasonsTableCreateCompanionBuilder,
    $$SeasonsTableUpdateCompanionBuilder,
    (Season, $$SeasonsTableReferences),
    Season,
    PrefetchHooks Function({bool seriesid, bool episodesRefs})>;
typedef $$EpisodesTableCreateCompanionBuilder = EpisodesCompanion Function({
  required int id,
  required int seasonid,
  required int number,
  required String name,
  required String overview,
  required String filePath,
  required String posterPath,
  required DateTime airDate,
  required double vote,
  Value<int> watchedTime,
  Value<int> watchStatus,
  required int runTime,
  Value<int> rowid,
});
typedef $$EpisodesTableUpdateCompanionBuilder = EpisodesCompanion Function({
  Value<int> id,
  Value<int> seasonid,
  Value<int> number,
  Value<String> name,
  Value<String> overview,
  Value<String> filePath,
  Value<String> posterPath,
  Value<DateTime> airDate,
  Value<double> vote,
  Value<int> watchedTime,
  Value<int> watchStatus,
  Value<int> runTime,
  Value<int> rowid,
});

final class $$EpisodesTableReferences
    extends BaseReferences<_$AppDatabase, $EpisodesTable, Episode> {
  $$EpisodesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $SeasonsTable _seasonidTable(_$AppDatabase db) => db.seasons
      .createAlias($_aliasNameGenerator(db.episodes.seasonid, db.seasons.id));

  $$SeasonsTableProcessedTableManager? get seasonid {
    if ($_item.seasonid == null) return null;
    final manager = $$SeasonsTableTableManager($_db, $_db.seasons)
        .filter((f) => f.id($_item.seasonid!));
    final item = $_typedResult.readTableOrNull(_seasonidTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$EpisodesTableFilterComposer
    extends FilterComposer<_$AppDatabase, $EpisodesTable> {
  $$EpisodesTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get number => $state.composableBuilder(
      column: $state.table.number,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get overview => $state.composableBuilder(
      column: $state.table.overview,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get filePath => $state.composableBuilder(
      column: $state.table.filePath,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get posterPath => $state.composableBuilder(
      column: $state.table.posterPath,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get airDate => $state.composableBuilder(
      column: $state.table.airDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get vote => $state.composableBuilder(
      column: $state.table.vote,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get watchedTime => $state.composableBuilder(
      column: $state.table.watchedTime,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get watchStatus => $state.composableBuilder(
      column: $state.table.watchStatus,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get runTime => $state.composableBuilder(
      column: $state.table.runTime,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$SeasonsTableFilterComposer get seasonid {
    final $$SeasonsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.seasonid,
        referencedTable: $state.db.seasons,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$SeasonsTableFilterComposer(
            ComposerState(
                $state.db, $state.db.seasons, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$EpisodesTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $EpisodesTable> {
  $$EpisodesTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get number => $state.composableBuilder(
      column: $state.table.number,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get overview => $state.composableBuilder(
      column: $state.table.overview,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get filePath => $state.composableBuilder(
      column: $state.table.filePath,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get posterPath => $state.composableBuilder(
      column: $state.table.posterPath,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get airDate => $state.composableBuilder(
      column: $state.table.airDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get vote => $state.composableBuilder(
      column: $state.table.vote,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get watchedTime => $state.composableBuilder(
      column: $state.table.watchedTime,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get watchStatus => $state.composableBuilder(
      column: $state.table.watchStatus,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get runTime => $state.composableBuilder(
      column: $state.table.runTime,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$SeasonsTableOrderingComposer get seasonid {
    final $$SeasonsTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.seasonid,
        referencedTable: $state.db.seasons,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$SeasonsTableOrderingComposer(ComposerState(
                $state.db, $state.db.seasons, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$EpisodesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $EpisodesTable,
    Episode,
    $$EpisodesTableFilterComposer,
    $$EpisodesTableOrderingComposer,
    $$EpisodesTableCreateCompanionBuilder,
    $$EpisodesTableUpdateCompanionBuilder,
    (Episode, $$EpisodesTableReferences),
    Episode,
    PrefetchHooks Function({bool seasonid})> {
  $$EpisodesTableTableManager(_$AppDatabase db, $EpisodesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$EpisodesTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$EpisodesTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> seasonid = const Value.absent(),
            Value<int> number = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> overview = const Value.absent(),
            Value<String> filePath = const Value.absent(),
            Value<String> posterPath = const Value.absent(),
            Value<DateTime> airDate = const Value.absent(),
            Value<double> vote = const Value.absent(),
            Value<int> watchedTime = const Value.absent(),
            Value<int> watchStatus = const Value.absent(),
            Value<int> runTime = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              EpisodesCompanion(
            id: id,
            seasonid: seasonid,
            number: number,
            name: name,
            overview: overview,
            filePath: filePath,
            posterPath: posterPath,
            airDate: airDate,
            vote: vote,
            watchedTime: watchedTime,
            watchStatus: watchStatus,
            runTime: runTime,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int id,
            required int seasonid,
            required int number,
            required String name,
            required String overview,
            required String filePath,
            required String posterPath,
            required DateTime airDate,
            required double vote,
            Value<int> watchedTime = const Value.absent(),
            Value<int> watchStatus = const Value.absent(),
            required int runTime,
            Value<int> rowid = const Value.absent(),
          }) =>
              EpisodesCompanion.insert(
            id: id,
            seasonid: seasonid,
            number: number,
            name: name,
            overview: overview,
            filePath: filePath,
            posterPath: posterPath,
            airDate: airDate,
            vote: vote,
            watchedTime: watchedTime,
            watchStatus: watchStatus,
            runTime: runTime,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$EpisodesTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({seasonid = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (seasonid) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.seasonid,
                    referencedTable:
                        $$EpisodesTableReferences._seasonidTable(db),
                    referencedColumn:
                        $$EpisodesTableReferences._seasonidTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$EpisodesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $EpisodesTable,
    Episode,
    $$EpisodesTableFilterComposer,
    $$EpisodesTableOrderingComposer,
    $$EpisodesTableCreateCompanionBuilder,
    $$EpisodesTableUpdateCompanionBuilder,
    (Episode, $$EpisodesTableReferences),
    Episode,
    PrefetchHooks Function({bool seasonid})>;
typedef $$ActorsTableCreateCompanionBuilder = ActorsCompanion Function({
  Value<int> id,
  required String name,
  required String profilePath,
});
typedef $$ActorsTableUpdateCompanionBuilder = ActorsCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> profilePath,
});

final class $$ActorsTableReferences
    extends BaseReferences<_$AppDatabase, $ActorsTable, Actor> {
  $$ActorsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$MovieCastTable, List<MovieCastData>>
      _movieCastRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.movieCast,
          aliasName: $_aliasNameGenerator(db.actors.id, db.movieCast.actorId));

  $$MovieCastTableProcessedTableManager get movieCastRefs {
    final manager = $$MovieCastTableTableManager($_db, $_db.movieCast)
        .filter((f) => f.actorId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_movieCastRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$TvCastTable, List<TvCastData>> _tvCastRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.tvCast,
          aliasName: $_aliasNameGenerator(db.actors.id, db.tvCast.actorId));

  $$TvCastTableProcessedTableManager get tvCastRefs {
    final manager = $$TvCastTableTableManager($_db, $_db.tvCast)
        .filter((f) => f.actorId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_tvCastRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$ActorsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $ActorsTable> {
  $$ActorsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get profilePath => $state.composableBuilder(
      column: $state.table.profilePath,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter movieCastRefs(
      ComposableFilter Function($$MovieCastTableFilterComposer f) f) {
    final $$MovieCastTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.movieCast,
        getReferencedColumn: (t) => t.actorId,
        builder: (joinBuilder, parentComposers) =>
            $$MovieCastTableFilterComposer(ComposerState(
                $state.db, $state.db.movieCast, joinBuilder, parentComposers)));
    return f(composer);
  }

  ComposableFilter tvCastRefs(
      ComposableFilter Function($$TvCastTableFilterComposer f) f) {
    final $$TvCastTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.tvCast,
        getReferencedColumn: (t) => t.actorId,
        builder: (joinBuilder, parentComposers) => $$TvCastTableFilterComposer(
            ComposerState(
                $state.db, $state.db.tvCast, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$ActorsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $ActorsTable> {
  $$ActorsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get profilePath => $state.composableBuilder(
      column: $state.table.profilePath,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$ActorsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ActorsTable,
    Actor,
    $$ActorsTableFilterComposer,
    $$ActorsTableOrderingComposer,
    $$ActorsTableCreateCompanionBuilder,
    $$ActorsTableUpdateCompanionBuilder,
    (Actor, $$ActorsTableReferences),
    Actor,
    PrefetchHooks Function({bool movieCastRefs, bool tvCastRefs})> {
  $$ActorsTableTableManager(_$AppDatabase db, $ActorsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$ActorsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$ActorsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> profilePath = const Value.absent(),
          }) =>
              ActorsCompanion(
            id: id,
            name: name,
            profilePath: profilePath,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String profilePath,
          }) =>
              ActorsCompanion.insert(
            id: id,
            name: name,
            profilePath: profilePath,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$ActorsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({movieCastRefs = false, tvCastRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (movieCastRefs) db.movieCast,
                if (tvCastRefs) db.tvCast
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (movieCastRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$ActorsTableReferences._movieCastRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ActorsTableReferences(db, table, p0)
                                .movieCastRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.actorId == item.id),
                        typedResults: items),
                  if (tvCastRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$ActorsTableReferences._tvCastRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ActorsTableReferences(db, table, p0).tvCastRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.actorId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$ActorsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ActorsTable,
    Actor,
    $$ActorsTableFilterComposer,
    $$ActorsTableOrderingComposer,
    $$ActorsTableCreateCompanionBuilder,
    $$ActorsTableUpdateCompanionBuilder,
    (Actor, $$ActorsTableReferences),
    Actor,
    PrefetchHooks Function({bool movieCastRefs, bool tvCastRefs})>;
typedef $$MovieCastTableCreateCompanionBuilder = MovieCastCompanion Function({
  required int actorId,
  required int movieId,
  required String role,
  required String as,
  Value<int> rowid,
});
typedef $$MovieCastTableUpdateCompanionBuilder = MovieCastCompanion Function({
  Value<int> actorId,
  Value<int> movieId,
  Value<String> role,
  Value<String> as,
  Value<int> rowid,
});

final class $$MovieCastTableReferences
    extends BaseReferences<_$AppDatabase, $MovieCastTable, MovieCastData> {
  $$MovieCastTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ActorsTable _actorIdTable(_$AppDatabase db) => db.actors
      .createAlias($_aliasNameGenerator(db.movieCast.actorId, db.actors.id));

  $$ActorsTableProcessedTableManager? get actorId {
    if ($_item.actorId == null) return null;
    final manager = $$ActorsTableTableManager($_db, $_db.actors)
        .filter((f) => f.id($_item.actorId!));
    final item = $_typedResult.readTableOrNull(_actorIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $MoviesTableTable _movieIdTable(_$AppDatabase db) =>
      db.moviesTable.createAlias(
          $_aliasNameGenerator(db.movieCast.movieId, db.moviesTable.id));

  $$MoviesTableTableProcessedTableManager? get movieId {
    if ($_item.movieId == null) return null;
    final manager = $$MoviesTableTableTableManager($_db, $_db.moviesTable)
        .filter((f) => f.id($_item.movieId!));
    final item = $_typedResult.readTableOrNull(_movieIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$MovieCastTableFilterComposer
    extends FilterComposer<_$AppDatabase, $MovieCastTable> {
  $$MovieCastTableFilterComposer(super.$state);
  ColumnFilters<String> get role => $state.composableBuilder(
      column: $state.table.role,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get as => $state.composableBuilder(
      column: $state.table.as,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$ActorsTableFilterComposer get actorId {
    final $$ActorsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.actorId,
        referencedTable: $state.db.actors,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$ActorsTableFilterComposer(
            ComposerState(
                $state.db, $state.db.actors, joinBuilder, parentComposers)));
    return composer;
  }

  $$MoviesTableTableFilterComposer get movieId {
    final $$MoviesTableTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.movieId,
        referencedTable: $state.db.moviesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$MoviesTableTableFilterComposer(ComposerState($state.db,
                $state.db.moviesTable, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$MovieCastTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $MovieCastTable> {
  $$MovieCastTableOrderingComposer(super.$state);
  ColumnOrderings<String> get role => $state.composableBuilder(
      column: $state.table.role,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get as => $state.composableBuilder(
      column: $state.table.as,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$ActorsTableOrderingComposer get actorId {
    final $$ActorsTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.actorId,
        referencedTable: $state.db.actors,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ActorsTableOrderingComposer(ComposerState(
                $state.db, $state.db.actors, joinBuilder, parentComposers)));
    return composer;
  }

  $$MoviesTableTableOrderingComposer get movieId {
    final $$MoviesTableTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.movieId,
        referencedTable: $state.db.moviesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$MoviesTableTableOrderingComposer(ComposerState($state.db,
                $state.db.moviesTable, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$MovieCastTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MovieCastTable,
    MovieCastData,
    $$MovieCastTableFilterComposer,
    $$MovieCastTableOrderingComposer,
    $$MovieCastTableCreateCompanionBuilder,
    $$MovieCastTableUpdateCompanionBuilder,
    (MovieCastData, $$MovieCastTableReferences),
    MovieCastData,
    PrefetchHooks Function({bool actorId, bool movieId})> {
  $$MovieCastTableTableManager(_$AppDatabase db, $MovieCastTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$MovieCastTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$MovieCastTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> actorId = const Value.absent(),
            Value<int> movieId = const Value.absent(),
            Value<String> role = const Value.absent(),
            Value<String> as = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MovieCastCompanion(
            actorId: actorId,
            movieId: movieId,
            role: role,
            as: as,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int actorId,
            required int movieId,
            required String role,
            required String as,
            Value<int> rowid = const Value.absent(),
          }) =>
              MovieCastCompanion.insert(
            actorId: actorId,
            movieId: movieId,
            role: role,
            as: as,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$MovieCastTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({actorId = false, movieId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (actorId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.actorId,
                    referencedTable:
                        $$MovieCastTableReferences._actorIdTable(db),
                    referencedColumn:
                        $$MovieCastTableReferences._actorIdTable(db).id,
                  ) as T;
                }
                if (movieId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.movieId,
                    referencedTable:
                        $$MovieCastTableReferences._movieIdTable(db),
                    referencedColumn:
                        $$MovieCastTableReferences._movieIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$MovieCastTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $MovieCastTable,
    MovieCastData,
    $$MovieCastTableFilterComposer,
    $$MovieCastTableOrderingComposer,
    $$MovieCastTableCreateCompanionBuilder,
    $$MovieCastTableUpdateCompanionBuilder,
    (MovieCastData, $$MovieCastTableReferences),
    MovieCastData,
    PrefetchHooks Function({bool actorId, bool movieId})>;
typedef $$GenresTableCreateCompanionBuilder = GenresCompanion Function({
  Value<int> id,
  required String name,
});
typedef $$GenresTableUpdateCompanionBuilder = GenresCompanion Function({
  Value<int> id,
  Value<String> name,
});

final class $$GenresTableReferences
    extends BaseReferences<_$AppDatabase, $GenresTable, Genre> {
  $$GenresTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$MovieGenresTable, List<MovieGenre>>
      _movieGenresRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.movieGenres,
              aliasName:
                  $_aliasNameGenerator(db.genres.id, db.movieGenres.genreId));

  $$MovieGenresTableProcessedTableManager get movieGenresRefs {
    final manager = $$MovieGenresTableTableManager($_db, $_db.movieGenres)
        .filter((f) => f.genreId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_movieGenresRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$TvGenresTable, List<TvGenre>> _tvGenresRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.tvGenres,
          aliasName: $_aliasNameGenerator(db.genres.id, db.tvGenres.genreId));

  $$TvGenresTableProcessedTableManager get tvGenresRefs {
    final manager = $$TvGenresTableTableManager($_db, $_db.tvGenres)
        .filter((f) => f.genreId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_tvGenresRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$GenresTableFilterComposer
    extends FilterComposer<_$AppDatabase, $GenresTable> {
  $$GenresTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter movieGenresRefs(
      ComposableFilter Function($$MovieGenresTableFilterComposer f) f) {
    final $$MovieGenresTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.movieGenres,
        getReferencedColumn: (t) => t.genreId,
        builder: (joinBuilder, parentComposers) =>
            $$MovieGenresTableFilterComposer(ComposerState($state.db,
                $state.db.movieGenres, joinBuilder, parentComposers)));
    return f(composer);
  }

  ComposableFilter tvGenresRefs(
      ComposableFilter Function($$TvGenresTableFilterComposer f) f) {
    final $$TvGenresTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.tvGenres,
        getReferencedColumn: (t) => t.genreId,
        builder: (joinBuilder, parentComposers) =>
            $$TvGenresTableFilterComposer(ComposerState(
                $state.db, $state.db.tvGenres, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$GenresTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $GenresTable> {
  $$GenresTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$GenresTableTableManager extends RootTableManager<
    _$AppDatabase,
    $GenresTable,
    Genre,
    $$GenresTableFilterComposer,
    $$GenresTableOrderingComposer,
    $$GenresTableCreateCompanionBuilder,
    $$GenresTableUpdateCompanionBuilder,
    (Genre, $$GenresTableReferences),
    Genre,
    PrefetchHooks Function({bool movieGenresRefs, bool tvGenresRefs})> {
  $$GenresTableTableManager(_$AppDatabase db, $GenresTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$GenresTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$GenresTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
          }) =>
              GenresCompanion(
            id: id,
            name: name,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
          }) =>
              GenresCompanion.insert(
            id: id,
            name: name,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$GenresTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {movieGenresRefs = false, tvGenresRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (movieGenresRefs) db.movieGenres,
                if (tvGenresRefs) db.tvGenres
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (movieGenresRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$GenresTableReferences._movieGenresRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$GenresTableReferences(db, table, p0)
                                .movieGenresRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.genreId == item.id),
                        typedResults: items),
                  if (tvGenresRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$GenresTableReferences._tvGenresRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$GenresTableReferences(db, table, p0).tvGenresRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.genreId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$GenresTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $GenresTable,
    Genre,
    $$GenresTableFilterComposer,
    $$GenresTableOrderingComposer,
    $$GenresTableCreateCompanionBuilder,
    $$GenresTableUpdateCompanionBuilder,
    (Genre, $$GenresTableReferences),
    Genre,
    PrefetchHooks Function({bool movieGenresRefs, bool tvGenresRefs})>;
typedef $$MovieGenresTableCreateCompanionBuilder = MovieGenresCompanion
    Function({
  required int movieId,
  required int genreId,
  Value<int> rowid,
});
typedef $$MovieGenresTableUpdateCompanionBuilder = MovieGenresCompanion
    Function({
  Value<int> movieId,
  Value<int> genreId,
  Value<int> rowid,
});

final class $$MovieGenresTableReferences
    extends BaseReferences<_$AppDatabase, $MovieGenresTable, MovieGenre> {
  $$MovieGenresTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $MoviesTableTable _movieIdTable(_$AppDatabase db) =>
      db.moviesTable.createAlias(
          $_aliasNameGenerator(db.movieGenres.movieId, db.moviesTable.id));

  $$MoviesTableTableProcessedTableManager? get movieId {
    if ($_item.movieId == null) return null;
    final manager = $$MoviesTableTableTableManager($_db, $_db.moviesTable)
        .filter((f) => f.id($_item.movieId!));
    final item = $_typedResult.readTableOrNull(_movieIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $GenresTable _genreIdTable(_$AppDatabase db) => db.genres
      .createAlias($_aliasNameGenerator(db.movieGenres.genreId, db.genres.id));

  $$GenresTableProcessedTableManager? get genreId {
    if ($_item.genreId == null) return null;
    final manager = $$GenresTableTableManager($_db, $_db.genres)
        .filter((f) => f.id($_item.genreId!));
    final item = $_typedResult.readTableOrNull(_genreIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$MovieGenresTableFilterComposer
    extends FilterComposer<_$AppDatabase, $MovieGenresTable> {
  $$MovieGenresTableFilterComposer(super.$state);
  $$MoviesTableTableFilterComposer get movieId {
    final $$MoviesTableTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.movieId,
        referencedTable: $state.db.moviesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$MoviesTableTableFilterComposer(ComposerState($state.db,
                $state.db.moviesTable, joinBuilder, parentComposers)));
    return composer;
  }

  $$GenresTableFilterComposer get genreId {
    final $$GenresTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.genreId,
        referencedTable: $state.db.genres,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$GenresTableFilterComposer(
            ComposerState(
                $state.db, $state.db.genres, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$MovieGenresTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $MovieGenresTable> {
  $$MovieGenresTableOrderingComposer(super.$state);
  $$MoviesTableTableOrderingComposer get movieId {
    final $$MoviesTableTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.movieId,
        referencedTable: $state.db.moviesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$MoviesTableTableOrderingComposer(ComposerState($state.db,
                $state.db.moviesTable, joinBuilder, parentComposers)));
    return composer;
  }

  $$GenresTableOrderingComposer get genreId {
    final $$GenresTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.genreId,
        referencedTable: $state.db.genres,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$GenresTableOrderingComposer(ComposerState(
                $state.db, $state.db.genres, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$MovieGenresTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MovieGenresTable,
    MovieGenre,
    $$MovieGenresTableFilterComposer,
    $$MovieGenresTableOrderingComposer,
    $$MovieGenresTableCreateCompanionBuilder,
    $$MovieGenresTableUpdateCompanionBuilder,
    (MovieGenre, $$MovieGenresTableReferences),
    MovieGenre,
    PrefetchHooks Function({bool movieId, bool genreId})> {
  $$MovieGenresTableTableManager(_$AppDatabase db, $MovieGenresTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$MovieGenresTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$MovieGenresTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> movieId = const Value.absent(),
            Value<int> genreId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MovieGenresCompanion(
            movieId: movieId,
            genreId: genreId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int movieId,
            required int genreId,
            Value<int> rowid = const Value.absent(),
          }) =>
              MovieGenresCompanion.insert(
            movieId: movieId,
            genreId: genreId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$MovieGenresTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({movieId = false, genreId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (movieId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.movieId,
                    referencedTable:
                        $$MovieGenresTableReferences._movieIdTable(db),
                    referencedColumn:
                        $$MovieGenresTableReferences._movieIdTable(db).id,
                  ) as T;
                }
                if (genreId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.genreId,
                    referencedTable:
                        $$MovieGenresTableReferences._genreIdTable(db),
                    referencedColumn:
                        $$MovieGenresTableReferences._genreIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$MovieGenresTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $MovieGenresTable,
    MovieGenre,
    $$MovieGenresTableFilterComposer,
    $$MovieGenresTableOrderingComposer,
    $$MovieGenresTableCreateCompanionBuilder,
    $$MovieGenresTableUpdateCompanionBuilder,
    (MovieGenre, $$MovieGenresTableReferences),
    MovieGenre,
    PrefetchHooks Function({bool movieId, bool genreId})>;
typedef $$TvGenresTableCreateCompanionBuilder = TvGenresCompanion Function({
  required int seriesId,
  required int genreId,
  Value<int> rowid,
});
typedef $$TvGenresTableUpdateCompanionBuilder = TvGenresCompanion Function({
  Value<int> seriesId,
  Value<int> genreId,
  Value<int> rowid,
});

final class $$TvGenresTableReferences
    extends BaseReferences<_$AppDatabase, $TvGenresTable, TvGenre> {
  $$TvGenresTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $SeriesTable _seriesIdTable(_$AppDatabase db) => db.series
      .createAlias($_aliasNameGenerator(db.tvGenres.seriesId, db.series.id));

  $$SeriesTableProcessedTableManager? get seriesId {
    if ($_item.seriesId == null) return null;
    final manager = $$SeriesTableTableManager($_db, $_db.series)
        .filter((f) => f.id($_item.seriesId!));
    final item = $_typedResult.readTableOrNull(_seriesIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $GenresTable _genreIdTable(_$AppDatabase db) => db.genres
      .createAlias($_aliasNameGenerator(db.tvGenres.genreId, db.genres.id));

  $$GenresTableProcessedTableManager? get genreId {
    if ($_item.genreId == null) return null;
    final manager = $$GenresTableTableManager($_db, $_db.genres)
        .filter((f) => f.id($_item.genreId!));
    final item = $_typedResult.readTableOrNull(_genreIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$TvGenresTableFilterComposer
    extends FilterComposer<_$AppDatabase, $TvGenresTable> {
  $$TvGenresTableFilterComposer(super.$state);
  $$SeriesTableFilterComposer get seriesId {
    final $$SeriesTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.seriesId,
        referencedTable: $state.db.series,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$SeriesTableFilterComposer(
            ComposerState(
                $state.db, $state.db.series, joinBuilder, parentComposers)));
    return composer;
  }

  $$GenresTableFilterComposer get genreId {
    final $$GenresTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.genreId,
        referencedTable: $state.db.genres,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$GenresTableFilterComposer(
            ComposerState(
                $state.db, $state.db.genres, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$TvGenresTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $TvGenresTable> {
  $$TvGenresTableOrderingComposer(super.$state);
  $$SeriesTableOrderingComposer get seriesId {
    final $$SeriesTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.seriesId,
        referencedTable: $state.db.series,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$SeriesTableOrderingComposer(ComposerState(
                $state.db, $state.db.series, joinBuilder, parentComposers)));
    return composer;
  }

  $$GenresTableOrderingComposer get genreId {
    final $$GenresTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.genreId,
        referencedTable: $state.db.genres,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$GenresTableOrderingComposer(ComposerState(
                $state.db, $state.db.genres, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$TvGenresTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TvGenresTable,
    TvGenre,
    $$TvGenresTableFilterComposer,
    $$TvGenresTableOrderingComposer,
    $$TvGenresTableCreateCompanionBuilder,
    $$TvGenresTableUpdateCompanionBuilder,
    (TvGenre, $$TvGenresTableReferences),
    TvGenre,
    PrefetchHooks Function({bool seriesId, bool genreId})> {
  $$TvGenresTableTableManager(_$AppDatabase db, $TvGenresTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$TvGenresTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$TvGenresTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> seriesId = const Value.absent(),
            Value<int> genreId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TvGenresCompanion(
            seriesId: seriesId,
            genreId: genreId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int seriesId,
            required int genreId,
            Value<int> rowid = const Value.absent(),
          }) =>
              TvGenresCompanion.insert(
            seriesId: seriesId,
            genreId: genreId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$TvGenresTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({seriesId = false, genreId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (seriesId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.seriesId,
                    referencedTable:
                        $$TvGenresTableReferences._seriesIdTable(db),
                    referencedColumn:
                        $$TvGenresTableReferences._seriesIdTable(db).id,
                  ) as T;
                }
                if (genreId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.genreId,
                    referencedTable:
                        $$TvGenresTableReferences._genreIdTable(db),
                    referencedColumn:
                        $$TvGenresTableReferences._genreIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$TvGenresTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TvGenresTable,
    TvGenre,
    $$TvGenresTableFilterComposer,
    $$TvGenresTableOrderingComposer,
    $$TvGenresTableCreateCompanionBuilder,
    $$TvGenresTableUpdateCompanionBuilder,
    (TvGenre, $$TvGenresTableReferences),
    TvGenre,
    PrefetchHooks Function({bool seriesId, bool genreId})>;
typedef $$TvCastTableCreateCompanionBuilder = TvCastCompanion Function({
  required int actorId,
  required int seriesId,
  required String role,
  required String as,
  Value<int> rowid,
});
typedef $$TvCastTableUpdateCompanionBuilder = TvCastCompanion Function({
  Value<int> actorId,
  Value<int> seriesId,
  Value<String> role,
  Value<String> as,
  Value<int> rowid,
});

final class $$TvCastTableReferences
    extends BaseReferences<_$AppDatabase, $TvCastTable, TvCastData> {
  $$TvCastTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ActorsTable _actorIdTable(_$AppDatabase db) => db.actors
      .createAlias($_aliasNameGenerator(db.tvCast.actorId, db.actors.id));

  $$ActorsTableProcessedTableManager? get actorId {
    if ($_item.actorId == null) return null;
    final manager = $$ActorsTableTableManager($_db, $_db.actors)
        .filter((f) => f.id($_item.actorId!));
    final item = $_typedResult.readTableOrNull(_actorIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $SeriesTable _seriesIdTable(_$AppDatabase db) => db.series
      .createAlias($_aliasNameGenerator(db.tvCast.seriesId, db.series.id));

  $$SeriesTableProcessedTableManager? get seriesId {
    if ($_item.seriesId == null) return null;
    final manager = $$SeriesTableTableManager($_db, $_db.series)
        .filter((f) => f.id($_item.seriesId!));
    final item = $_typedResult.readTableOrNull(_seriesIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$TvCastTableFilterComposer
    extends FilterComposer<_$AppDatabase, $TvCastTable> {
  $$TvCastTableFilterComposer(super.$state);
  ColumnFilters<String> get role => $state.composableBuilder(
      column: $state.table.role,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get as => $state.composableBuilder(
      column: $state.table.as,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$ActorsTableFilterComposer get actorId {
    final $$ActorsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.actorId,
        referencedTable: $state.db.actors,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$ActorsTableFilterComposer(
            ComposerState(
                $state.db, $state.db.actors, joinBuilder, parentComposers)));
    return composer;
  }

  $$SeriesTableFilterComposer get seriesId {
    final $$SeriesTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.seriesId,
        referencedTable: $state.db.series,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$SeriesTableFilterComposer(
            ComposerState(
                $state.db, $state.db.series, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$TvCastTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $TvCastTable> {
  $$TvCastTableOrderingComposer(super.$state);
  ColumnOrderings<String> get role => $state.composableBuilder(
      column: $state.table.role,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get as => $state.composableBuilder(
      column: $state.table.as,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$ActorsTableOrderingComposer get actorId {
    final $$ActorsTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.actorId,
        referencedTable: $state.db.actors,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ActorsTableOrderingComposer(ComposerState(
                $state.db, $state.db.actors, joinBuilder, parentComposers)));
    return composer;
  }

  $$SeriesTableOrderingComposer get seriesId {
    final $$SeriesTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.seriesId,
        referencedTable: $state.db.series,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$SeriesTableOrderingComposer(ComposerState(
                $state.db, $state.db.series, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$TvCastTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TvCastTable,
    TvCastData,
    $$TvCastTableFilterComposer,
    $$TvCastTableOrderingComposer,
    $$TvCastTableCreateCompanionBuilder,
    $$TvCastTableUpdateCompanionBuilder,
    (TvCastData, $$TvCastTableReferences),
    TvCastData,
    PrefetchHooks Function({bool actorId, bool seriesId})> {
  $$TvCastTableTableManager(_$AppDatabase db, $TvCastTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$TvCastTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$TvCastTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> actorId = const Value.absent(),
            Value<int> seriesId = const Value.absent(),
            Value<String> role = const Value.absent(),
            Value<String> as = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TvCastCompanion(
            actorId: actorId,
            seriesId: seriesId,
            role: role,
            as: as,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int actorId,
            required int seriesId,
            required String role,
            required String as,
            Value<int> rowid = const Value.absent(),
          }) =>
              TvCastCompanion.insert(
            actorId: actorId,
            seriesId: seriesId,
            role: role,
            as: as,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$TvCastTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({actorId = false, seriesId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (actorId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.actorId,
                    referencedTable: $$TvCastTableReferences._actorIdTable(db),
                    referencedColumn:
                        $$TvCastTableReferences._actorIdTable(db).id,
                  ) as T;
                }
                if (seriesId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.seriesId,
                    referencedTable: $$TvCastTableReferences._seriesIdTable(db),
                    referencedColumn:
                        $$TvCastTableReferences._seriesIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$TvCastTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TvCastTable,
    TvCastData,
    $$TvCastTableFilterComposer,
    $$TvCastTableOrderingComposer,
    $$TvCastTableCreateCompanionBuilder,
    $$TvCastTableUpdateCompanionBuilder,
    (TvCastData, $$TvCastTableReferences),
    TvCastData,
    PrefetchHooks Function({bool actorId, bool seriesId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$MoviesTableTableTableManager get moviesTable =>
      $$MoviesTableTableTableManager(_db, _db.moviesTable);
  $$SeriesTableTableManager get series =>
      $$SeriesTableTableManager(_db, _db.series);
  $$SeasonsTableTableManager get seasons =>
      $$SeasonsTableTableManager(_db, _db.seasons);
  $$EpisodesTableTableManager get episodes =>
      $$EpisodesTableTableManager(_db, _db.episodes);
  $$ActorsTableTableManager get actors =>
      $$ActorsTableTableManager(_db, _db.actors);
  $$MovieCastTableTableManager get movieCast =>
      $$MovieCastTableTableManager(_db, _db.movieCast);
  $$GenresTableTableManager get genres =>
      $$GenresTableTableManager(_db, _db.genres);
  $$MovieGenresTableTableManager get movieGenres =>
      $$MovieGenresTableTableManager(_db, _db.movieGenres);
  $$TvGenresTableTableManager get tvGenres =>
      $$TvGenresTableTableManager(_db, _db.tvGenres);
  $$TvCastTableTableManager get tvCast =>
      $$TvCastTableTableManager(_db, _db.tvCast);
}
