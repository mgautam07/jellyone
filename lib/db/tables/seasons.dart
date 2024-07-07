import 'package:drift/drift.dart';
import 'package:jellyone/db/tables/series.dart';

class Seasons extends Table {
  IntColumn get id => integer()();
  IntColumn get number => integer()();
  IntColumn get seriesid => integer().references(Series, #id)();
  TextColumn get overview => text()();
  TextColumn get posterPath => text()();
  DateTimeColumn get airDate => dateTime()();
  RealColumn get vote => real()();
  IntColumn get watchStatus => integer().withDefault(const Constant(0))();
}
