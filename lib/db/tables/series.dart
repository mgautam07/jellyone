import 'package:drift/drift.dart';

class Series extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  TextColumn get tagLine => text()();
  TextColumn get overview => text()();
  TextColumn get logoPath => text()();
  TextColumn get posterPath => text()();
  TextColumn get backdropPath => text()();
  TextColumn get homePage => text()();
  DateTimeColumn get firstAirDate => dateTime()();
  DateTimeColumn get lastAirDate => dateTime()();
  RealColumn get vote => real()();
  IntColumn get watchStatus => integer().withDefault(const Constant(0))();
}
