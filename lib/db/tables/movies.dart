import 'package:drift/drift.dart';

class MoviesTable extends Table {
  IntColumn get id => integer()();
  BoolColumn get adult => boolean()();
  TextColumn get backdropPath => text()();
  TextColumn get name => text()();
  TextColumn get tagLine => text()();
  TextColumn get overview => text()();
  TextColumn get posterPath => text()();
  TextColumn get logoPath => text()();
  TextColumn get videoFile => text()();
  TextColumn get subtitlesFolder => text().nullable()();
  TextColumn get resolution => text()();
  TextColumn get homePage => text()();
  DateTimeColumn get releaseDate => dateTime()();
  TextColumn get imdb => text()();
  RealColumn get vote => real()();
  IntColumn get watchedTime => integer().withDefault(const Constant(0))();
  IntColumn get watchStatus => integer().withDefault(const Constant(0))();
  IntColumn get runTime => integer()();
}
