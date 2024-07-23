import 'package:drift/drift.dart';
import 'package:jellyone/db/tables/seasons.dart';

class Episodes extends Table {
  IntColumn get id => integer()();
  IntColumn get seasonid => integer().references(Seasons, #id)();
  IntColumn get number => integer()();
  TextColumn get name => text()();
  TextColumn get overview => text()();
  TextColumn get filePath => text()();
  TextColumn get posterPath => text()();
  DateTimeColumn get airDate => dateTime()();
  RealColumn get vote => real()();
  IntColumn get watchedTime => integer().withDefault(const Constant(0))();
  IntColumn get watchStatus => integer().withDefault(const Constant(0))();
  IntColumn get runTime => integer()();
}
