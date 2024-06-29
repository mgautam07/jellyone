import 'package:drift/drift.dart';

class MoviesTable extends Table {
  IntColumn get id => integer()();
  BoolColumn get adult => boolean()();
  TextColumn get backdropPath => text()();
  TextColumn get originalTitle => text()();
  TextColumn get overview => text()();
  TextColumn get posterPath => text()();
  TextColumn get videoFile => text()();
  TextColumn get resolution => text()();
  RealColumn get vote => real()();
  IntColumn get watchedTime => integer().withDefault(const Constant(0))();
  IntColumn get watchStatus => integer().withDefault(const Constant(0))();
}
