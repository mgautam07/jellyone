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
  static const VerificationMeta _originalTitleMeta =
      const VerificationMeta('originalTitle');
  @override
  late final GeneratedColumn<String> originalTitle = GeneratedColumn<String>(
      'original_title', aliasedName, false,
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
  static const VerificationMeta _videoFileMeta =
      const VerificationMeta('videoFile');
  @override
  late final GeneratedColumn<String> videoFile = GeneratedColumn<String>(
      'video_file', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _resolutionMeta =
      const VerificationMeta('resolution');
  @override
  late final GeneratedColumn<String> resolution = GeneratedColumn<String>(
      'resolution', aliasedName, false,
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
  @override
  List<GeneratedColumn> get $columns => [
        id,
        adult,
        backdropPath,
        originalTitle,
        overview,
        posterPath,
        videoFile,
        resolution,
        vote,
        watchedTime,
        watchStatus
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
    if (data.containsKey('original_title')) {
      context.handle(
          _originalTitleMeta,
          originalTitle.isAcceptableOrUnknown(
              data['original_title']!, _originalTitleMeta));
    } else if (isInserting) {
      context.missing(_originalTitleMeta);
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
    if (data.containsKey('video_file')) {
      context.handle(_videoFileMeta,
          videoFile.isAcceptableOrUnknown(data['video_file']!, _videoFileMeta));
    } else if (isInserting) {
      context.missing(_videoFileMeta);
    }
    if (data.containsKey('resolution')) {
      context.handle(
          _resolutionMeta,
          resolution.isAcceptableOrUnknown(
              data['resolution']!, _resolutionMeta));
    } else if (isInserting) {
      context.missing(_resolutionMeta);
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
      originalTitle: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}original_title'])!,
      overview: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}overview'])!,
      posterPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}poster_path'])!,
      videoFile: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}video_file'])!,
      resolution: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}resolution'])!,
      vote: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}vote'])!,
      watchedTime: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}watched_time'])!,
      watchStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}watch_status'])!,
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
  final String originalTitle;
  final String overview;
  final String posterPath;
  final String videoFile;
  final String resolution;
  final double vote;
  final int watchedTime;
  final int watchStatus;
  const MoviesTableData(
      {required this.id,
      required this.adult,
      required this.backdropPath,
      required this.originalTitle,
      required this.overview,
      required this.posterPath,
      required this.videoFile,
      required this.resolution,
      required this.vote,
      required this.watchedTime,
      required this.watchStatus});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['adult'] = Variable<bool>(adult);
    map['backdrop_path'] = Variable<String>(backdropPath);
    map['original_title'] = Variable<String>(originalTitle);
    map['overview'] = Variable<String>(overview);
    map['poster_path'] = Variable<String>(posterPath);
    map['video_file'] = Variable<String>(videoFile);
    map['resolution'] = Variable<String>(resolution);
    map['vote'] = Variable<double>(vote);
    map['watched_time'] = Variable<int>(watchedTime);
    map['watch_status'] = Variable<int>(watchStatus);
    return map;
  }

  MoviesTableCompanion toCompanion(bool nullToAbsent) {
    return MoviesTableCompanion(
      id: Value(id),
      adult: Value(adult),
      backdropPath: Value(backdropPath),
      originalTitle: Value(originalTitle),
      overview: Value(overview),
      posterPath: Value(posterPath),
      videoFile: Value(videoFile),
      resolution: Value(resolution),
      vote: Value(vote),
      watchedTime: Value(watchedTime),
      watchStatus: Value(watchStatus),
    );
  }

  factory MoviesTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MoviesTableData(
      id: serializer.fromJson<int>(json['id']),
      adult: serializer.fromJson<bool>(json['adult']),
      backdropPath: serializer.fromJson<String>(json['backdropPath']),
      originalTitle: serializer.fromJson<String>(json['originalTitle']),
      overview: serializer.fromJson<String>(json['overview']),
      posterPath: serializer.fromJson<String>(json['posterPath']),
      videoFile: serializer.fromJson<String>(json['videoFile']),
      resolution: serializer.fromJson<String>(json['resolution']),
      vote: serializer.fromJson<double>(json['vote']),
      watchedTime: serializer.fromJson<int>(json['watchedTime']),
      watchStatus: serializer.fromJson<int>(json['watchStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'adult': serializer.toJson<bool>(adult),
      'backdropPath': serializer.toJson<String>(backdropPath),
      'originalTitle': serializer.toJson<String>(originalTitle),
      'overview': serializer.toJson<String>(overview),
      'posterPath': serializer.toJson<String>(posterPath),
      'videoFile': serializer.toJson<String>(videoFile),
      'resolution': serializer.toJson<String>(resolution),
      'vote': serializer.toJson<double>(vote),
      'watchedTime': serializer.toJson<int>(watchedTime),
      'watchStatus': serializer.toJson<int>(watchStatus),
    };
  }

  MoviesTableData copyWith(
          {int? id,
          bool? adult,
          String? backdropPath,
          String? originalTitle,
          String? overview,
          String? posterPath,
          String? videoFile,
          String? resolution,
          double? vote,
          int? watchedTime,
          int? watchStatus}) =>
      MoviesTableData(
        id: id ?? this.id,
        adult: adult ?? this.adult,
        backdropPath: backdropPath ?? this.backdropPath,
        originalTitle: originalTitle ?? this.originalTitle,
        overview: overview ?? this.overview,
        posterPath: posterPath ?? this.posterPath,
        videoFile: videoFile ?? this.videoFile,
        resolution: resolution ?? this.resolution,
        vote: vote ?? this.vote,
        watchedTime: watchedTime ?? this.watchedTime,
        watchStatus: watchStatus ?? this.watchStatus,
      );
  @override
  String toString() {
    return (StringBuffer('MoviesTableData(')
          ..write('id: $id, ')
          ..write('adult: $adult, ')
          ..write('backdropPath: $backdropPath, ')
          ..write('originalTitle: $originalTitle, ')
          ..write('overview: $overview, ')
          ..write('posterPath: $posterPath, ')
          ..write('videoFile: $videoFile, ')
          ..write('resolution: $resolution, ')
          ..write('vote: $vote, ')
          ..write('watchedTime: $watchedTime, ')
          ..write('watchStatus: $watchStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      adult,
      backdropPath,
      originalTitle,
      overview,
      posterPath,
      videoFile,
      resolution,
      vote,
      watchedTime,
      watchStatus);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MoviesTableData &&
          other.id == this.id &&
          other.adult == this.adult &&
          other.backdropPath == this.backdropPath &&
          other.originalTitle == this.originalTitle &&
          other.overview == this.overview &&
          other.posterPath == this.posterPath &&
          other.videoFile == this.videoFile &&
          other.resolution == this.resolution &&
          other.vote == this.vote &&
          other.watchedTime == this.watchedTime &&
          other.watchStatus == this.watchStatus);
}

class MoviesTableCompanion extends UpdateCompanion<MoviesTableData> {
  final Value<int> id;
  final Value<bool> adult;
  final Value<String> backdropPath;
  final Value<String> originalTitle;
  final Value<String> overview;
  final Value<String> posterPath;
  final Value<String> videoFile;
  final Value<String> resolution;
  final Value<double> vote;
  final Value<int> watchedTime;
  final Value<int> watchStatus;
  final Value<int> rowid;
  const MoviesTableCompanion({
    this.id = const Value.absent(),
    this.adult = const Value.absent(),
    this.backdropPath = const Value.absent(),
    this.originalTitle = const Value.absent(),
    this.overview = const Value.absent(),
    this.posterPath = const Value.absent(),
    this.videoFile = const Value.absent(),
    this.resolution = const Value.absent(),
    this.vote = const Value.absent(),
    this.watchedTime = const Value.absent(),
    this.watchStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MoviesTableCompanion.insert({
    required int id,
    required bool adult,
    required String backdropPath,
    required String originalTitle,
    required String overview,
    required String posterPath,
    required String videoFile,
    required String resolution,
    required double vote,
    this.watchedTime = const Value.absent(),
    this.watchStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        adult = Value(adult),
        backdropPath = Value(backdropPath),
        originalTitle = Value(originalTitle),
        overview = Value(overview),
        posterPath = Value(posterPath),
        videoFile = Value(videoFile),
        resolution = Value(resolution),
        vote = Value(vote);
  static Insertable<MoviesTableData> custom({
    Expression<int>? id,
    Expression<bool>? adult,
    Expression<String>? backdropPath,
    Expression<String>? originalTitle,
    Expression<String>? overview,
    Expression<String>? posterPath,
    Expression<String>? videoFile,
    Expression<String>? resolution,
    Expression<double>? vote,
    Expression<int>? watchedTime,
    Expression<int>? watchStatus,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (adult != null) 'adult': adult,
      if (backdropPath != null) 'backdrop_path': backdropPath,
      if (originalTitle != null) 'original_title': originalTitle,
      if (overview != null) 'overview': overview,
      if (posterPath != null) 'poster_path': posterPath,
      if (videoFile != null) 'video_file': videoFile,
      if (resolution != null) 'resolution': resolution,
      if (vote != null) 'vote': vote,
      if (watchedTime != null) 'watched_time': watchedTime,
      if (watchStatus != null) 'watch_status': watchStatus,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MoviesTableCompanion copyWith(
      {Value<int>? id,
      Value<bool>? adult,
      Value<String>? backdropPath,
      Value<String>? originalTitle,
      Value<String>? overview,
      Value<String>? posterPath,
      Value<String>? videoFile,
      Value<String>? resolution,
      Value<double>? vote,
      Value<int>? watchedTime,
      Value<int>? watchStatus,
      Value<int>? rowid}) {
    return MoviesTableCompanion(
      id: id ?? this.id,
      adult: adult ?? this.adult,
      backdropPath: backdropPath ?? this.backdropPath,
      originalTitle: originalTitle ?? this.originalTitle,
      overview: overview ?? this.overview,
      posterPath: posterPath ?? this.posterPath,
      videoFile: videoFile ?? this.videoFile,
      resolution: resolution ?? this.resolution,
      vote: vote ?? this.vote,
      watchedTime: watchedTime ?? this.watchedTime,
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
    if (adult.present) {
      map['adult'] = Variable<bool>(adult.value);
    }
    if (backdropPath.present) {
      map['backdrop_path'] = Variable<String>(backdropPath.value);
    }
    if (originalTitle.present) {
      map['original_title'] = Variable<String>(originalTitle.value);
    }
    if (overview.present) {
      map['overview'] = Variable<String>(overview.value);
    }
    if (posterPath.present) {
      map['poster_path'] = Variable<String>(posterPath.value);
    }
    if (videoFile.present) {
      map['video_file'] = Variable<String>(videoFile.value);
    }
    if (resolution.present) {
      map['resolution'] = Variable<String>(resolution.value);
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
          ..write('originalTitle: $originalTitle, ')
          ..write('overview: $overview, ')
          ..write('posterPath: $posterPath, ')
          ..write('videoFile: $videoFile, ')
          ..write('resolution: $resolution, ')
          ..write('vote: $vote, ')
          ..write('watchedTime: $watchedTime, ')
          ..write('watchStatus: $watchStatus, ')
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
  @override
  List<GeneratedColumn> get $columns => [id];
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
    );
  }

  @override
  $SeriesTable createAlias(String alias) {
    return $SeriesTable(attachedDatabase, alias);
  }
}

class Sery extends DataClass implements Insertable<Sery> {
  final int id;
  const Sery({required this.id});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    return map;
  }

  SeriesCompanion toCompanion(bool nullToAbsent) {
    return SeriesCompanion(
      id: Value(id),
    );
  }

  factory Sery.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Sery(
      id: serializer.fromJson<int>(json['id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
    };
  }

  Sery copyWith({int? id}) => Sery(
        id: id ?? this.id,
      );
  @override
  String toString() {
    return (StringBuffer('Sery(')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => id.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is Sery && other.id == this.id);
}

class SeriesCompanion extends UpdateCompanion<Sery> {
  final Value<int> id;
  final Value<int> rowid;
  const SeriesCompanion({
    this.id = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SeriesCompanion.insert({
    required int id,
    this.rowid = const Value.absent(),
  }) : id = Value(id);
  static Insertable<Sery> custom({
    Expression<int>? id,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SeriesCompanion copyWith({Value<int>? id, Value<int>? rowid}) {
    return SeriesCompanion(
      id: id ?? this.id,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
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
  @override
  List<GeneratedColumn> get $columns => [id];
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
    );
  }

  @override
  $SeasonsTable createAlias(String alias) {
    return $SeasonsTable(attachedDatabase, alias);
  }
}

class Season extends DataClass implements Insertable<Season> {
  final int id;
  const Season({required this.id});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    return map;
  }

  SeasonsCompanion toCompanion(bool nullToAbsent) {
    return SeasonsCompanion(
      id: Value(id),
    );
  }

  factory Season.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Season(
      id: serializer.fromJson<int>(json['id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
    };
  }

  Season copyWith({int? id}) => Season(
        id: id ?? this.id,
      );
  @override
  String toString() {
    return (StringBuffer('Season(')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => id.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is Season && other.id == this.id);
}

class SeasonsCompanion extends UpdateCompanion<Season> {
  final Value<int> id;
  final Value<int> rowid;
  const SeasonsCompanion({
    this.id = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SeasonsCompanion.insert({
    required int id,
    this.rowid = const Value.absent(),
  }) : id = Value(id);
  static Insertable<Season> custom({
    Expression<int>? id,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SeasonsCompanion copyWith({Value<int>? id, Value<int>? rowid}) {
    return SeasonsCompanion(
      id: id ?? this.id,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
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
  @override
  List<GeneratedColumn> get $columns => [id];
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
    );
  }

  @override
  $EpisodesTable createAlias(String alias) {
    return $EpisodesTable(attachedDatabase, alias);
  }
}

class Episode extends DataClass implements Insertable<Episode> {
  final int id;
  const Episode({required this.id});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    return map;
  }

  EpisodesCompanion toCompanion(bool nullToAbsent) {
    return EpisodesCompanion(
      id: Value(id),
    );
  }

  factory Episode.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Episode(
      id: serializer.fromJson<int>(json['id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
    };
  }

  Episode copyWith({int? id}) => Episode(
        id: id ?? this.id,
      );
  @override
  String toString() {
    return (StringBuffer('Episode(')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => id.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is Episode && other.id == this.id);
}

class EpisodesCompanion extends UpdateCompanion<Episode> {
  final Value<int> id;
  final Value<int> rowid;
  const EpisodesCompanion({
    this.id = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EpisodesCompanion.insert({
    required int id,
    this.rowid = const Value.absent(),
  }) : id = Value(id);
  static Insertable<Episode> custom({
    Expression<int>? id,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EpisodesCompanion copyWith({Value<int>? id, Value<int>? rowid}) {
    return EpisodesCompanion(
      id: id ?? this.id,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
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
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  _$AppDatabaseManager get managers => _$AppDatabaseManager(this);
  late final $MoviesTableTable moviesTable = $MoviesTableTable(this);
  late final $SeriesTable series = $SeriesTable(this);
  late final $SeasonsTable seasons = $SeasonsTable(this);
  late final $EpisodesTable episodes = $EpisodesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [moviesTable, series, seasons, episodes];
}

typedef $$MoviesTableTableInsertCompanionBuilder = MoviesTableCompanion
    Function({
  required int id,
  required bool adult,
  required String backdropPath,
  required String originalTitle,
  required String overview,
  required String posterPath,
  required String videoFile,
  required String resolution,
  required double vote,
  Value<int> watchedTime,
  Value<int> watchStatus,
  Value<int> rowid,
});
typedef $$MoviesTableTableUpdateCompanionBuilder = MoviesTableCompanion
    Function({
  Value<int> id,
  Value<bool> adult,
  Value<String> backdropPath,
  Value<String> originalTitle,
  Value<String> overview,
  Value<String> posterPath,
  Value<String> videoFile,
  Value<String> resolution,
  Value<double> vote,
  Value<int> watchedTime,
  Value<int> watchStatus,
  Value<int> rowid,
});

class $$MoviesTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MoviesTableTable,
    MoviesTableData,
    $$MoviesTableTableFilterComposer,
    $$MoviesTableTableOrderingComposer,
    $$MoviesTableTableProcessedTableManager,
    $$MoviesTableTableInsertCompanionBuilder,
    $$MoviesTableTableUpdateCompanionBuilder> {
  $$MoviesTableTableTableManager(_$AppDatabase db, $MoviesTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$MoviesTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$MoviesTableTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$MoviesTableTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<bool> adult = const Value.absent(),
            Value<String> backdropPath = const Value.absent(),
            Value<String> originalTitle = const Value.absent(),
            Value<String> overview = const Value.absent(),
            Value<String> posterPath = const Value.absent(),
            Value<String> videoFile = const Value.absent(),
            Value<String> resolution = const Value.absent(),
            Value<double> vote = const Value.absent(),
            Value<int> watchedTime = const Value.absent(),
            Value<int> watchStatus = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MoviesTableCompanion(
            id: id,
            adult: adult,
            backdropPath: backdropPath,
            originalTitle: originalTitle,
            overview: overview,
            posterPath: posterPath,
            videoFile: videoFile,
            resolution: resolution,
            vote: vote,
            watchedTime: watchedTime,
            watchStatus: watchStatus,
            rowid: rowid,
          ),
          getInsertCompanionBuilder: ({
            required int id,
            required bool adult,
            required String backdropPath,
            required String originalTitle,
            required String overview,
            required String posterPath,
            required String videoFile,
            required String resolution,
            required double vote,
            Value<int> watchedTime = const Value.absent(),
            Value<int> watchStatus = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MoviesTableCompanion.insert(
            id: id,
            adult: adult,
            backdropPath: backdropPath,
            originalTitle: originalTitle,
            overview: overview,
            posterPath: posterPath,
            videoFile: videoFile,
            resolution: resolution,
            vote: vote,
            watchedTime: watchedTime,
            watchStatus: watchStatus,
            rowid: rowid,
          ),
        ));
}

class $$MoviesTableTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $MoviesTableTable,
    MoviesTableData,
    $$MoviesTableTableFilterComposer,
    $$MoviesTableTableOrderingComposer,
    $$MoviesTableTableProcessedTableManager,
    $$MoviesTableTableInsertCompanionBuilder,
    $$MoviesTableTableUpdateCompanionBuilder> {
  $$MoviesTableTableProcessedTableManager(super.$state);
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

  ColumnFilters<String> get originalTitle => $state.composableBuilder(
      column: $state.table.originalTitle,
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

  ColumnFilters<String> get videoFile => $state.composableBuilder(
      column: $state.table.videoFile,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get resolution => $state.composableBuilder(
      column: $state.table.resolution,
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

  ColumnOrderings<String> get originalTitle => $state.composableBuilder(
      column: $state.table.originalTitle,
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

  ColumnOrderings<String> get videoFile => $state.composableBuilder(
      column: $state.table.videoFile,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get resolution => $state.composableBuilder(
      column: $state.table.resolution,
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
}

typedef $$SeriesTableInsertCompanionBuilder = SeriesCompanion Function({
  required int id,
  Value<int> rowid,
});
typedef $$SeriesTableUpdateCompanionBuilder = SeriesCompanion Function({
  Value<int> id,
  Value<int> rowid,
});

class $$SeriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SeriesTable,
    Sery,
    $$SeriesTableFilterComposer,
    $$SeriesTableOrderingComposer,
    $$SeriesTableProcessedTableManager,
    $$SeriesTableInsertCompanionBuilder,
    $$SeriesTableUpdateCompanionBuilder> {
  $$SeriesTableTableManager(_$AppDatabase db, $SeriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$SeriesTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$SeriesTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) => $$SeriesTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SeriesCompanion(
            id: id,
            rowid: rowid,
          ),
          getInsertCompanionBuilder: ({
            required int id,
            Value<int> rowid = const Value.absent(),
          }) =>
              SeriesCompanion.insert(
            id: id,
            rowid: rowid,
          ),
        ));
}

class $$SeriesTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $SeriesTable,
    Sery,
    $$SeriesTableFilterComposer,
    $$SeriesTableOrderingComposer,
    $$SeriesTableProcessedTableManager,
    $$SeriesTableInsertCompanionBuilder,
    $$SeriesTableUpdateCompanionBuilder> {
  $$SeriesTableProcessedTableManager(super.$state);
}

class $$SeriesTableFilterComposer
    extends FilterComposer<_$AppDatabase, $SeriesTable> {
  $$SeriesTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$SeriesTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $SeriesTable> {
  $$SeriesTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$SeasonsTableInsertCompanionBuilder = SeasonsCompanion Function({
  required int id,
  Value<int> rowid,
});
typedef $$SeasonsTableUpdateCompanionBuilder = SeasonsCompanion Function({
  Value<int> id,
  Value<int> rowid,
});

class $$SeasonsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SeasonsTable,
    Season,
    $$SeasonsTableFilterComposer,
    $$SeasonsTableOrderingComposer,
    $$SeasonsTableProcessedTableManager,
    $$SeasonsTableInsertCompanionBuilder,
    $$SeasonsTableUpdateCompanionBuilder> {
  $$SeasonsTableTableManager(_$AppDatabase db, $SeasonsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$SeasonsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$SeasonsTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) => $$SeasonsTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SeasonsCompanion(
            id: id,
            rowid: rowid,
          ),
          getInsertCompanionBuilder: ({
            required int id,
            Value<int> rowid = const Value.absent(),
          }) =>
              SeasonsCompanion.insert(
            id: id,
            rowid: rowid,
          ),
        ));
}

class $$SeasonsTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $SeasonsTable,
    Season,
    $$SeasonsTableFilterComposer,
    $$SeasonsTableOrderingComposer,
    $$SeasonsTableProcessedTableManager,
    $$SeasonsTableInsertCompanionBuilder,
    $$SeasonsTableUpdateCompanionBuilder> {
  $$SeasonsTableProcessedTableManager(super.$state);
}

class $$SeasonsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $SeasonsTable> {
  $$SeasonsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$SeasonsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $SeasonsTable> {
  $$SeasonsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$EpisodesTableInsertCompanionBuilder = EpisodesCompanion Function({
  required int id,
  Value<int> rowid,
});
typedef $$EpisodesTableUpdateCompanionBuilder = EpisodesCompanion Function({
  Value<int> id,
  Value<int> rowid,
});

class $$EpisodesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $EpisodesTable,
    Episode,
    $$EpisodesTableFilterComposer,
    $$EpisodesTableOrderingComposer,
    $$EpisodesTableProcessedTableManager,
    $$EpisodesTableInsertCompanionBuilder,
    $$EpisodesTableUpdateCompanionBuilder> {
  $$EpisodesTableTableManager(_$AppDatabase db, $EpisodesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$EpisodesTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$EpisodesTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$EpisodesTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              EpisodesCompanion(
            id: id,
            rowid: rowid,
          ),
          getInsertCompanionBuilder: ({
            required int id,
            Value<int> rowid = const Value.absent(),
          }) =>
              EpisodesCompanion.insert(
            id: id,
            rowid: rowid,
          ),
        ));
}

class $$EpisodesTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $EpisodesTable,
    Episode,
    $$EpisodesTableFilterComposer,
    $$EpisodesTableOrderingComposer,
    $$EpisodesTableProcessedTableManager,
    $$EpisodesTableInsertCompanionBuilder,
    $$EpisodesTableUpdateCompanionBuilder> {
  $$EpisodesTableProcessedTableManager(super.$state);
}

class $$EpisodesTableFilterComposer
    extends FilterComposer<_$AppDatabase, $EpisodesTable> {
  $$EpisodesTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$EpisodesTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $EpisodesTable> {
  $$EpisodesTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class _$AppDatabaseManager {
  final _$AppDatabase _db;
  _$AppDatabaseManager(this._db);
  $$MoviesTableTableTableManager get moviesTable =>
      $$MoviesTableTableTableManager(_db, _db.moviesTable);
  $$SeriesTableTableManager get series =>
      $$SeriesTableTableManager(_db, _db.series);
  $$SeasonsTableTableManager get seasons =>
      $$SeasonsTableTableManager(_db, _db.seasons);
  $$EpisodesTableTableManager get episodes =>
      $$EpisodesTableTableManager(_db, _db.episodes);
}
