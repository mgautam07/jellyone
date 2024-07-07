import 'package:drift/drift.dart';
import 'package:jellyone/db/tables/actors.dart';
import 'package:jellyone/db/tables/series.dart';

class TvCast extends Table {
  IntColumn get actorId => integer().references(Actors, #id)();
  IntColumn get seriesId => integer().references(Series, #id)();
  TextColumn get role => text()();
  TextColumn get as => text()();

  @override
  Set<Column<Object>>? get primaryKey => {actorId, seriesId, role};
}
