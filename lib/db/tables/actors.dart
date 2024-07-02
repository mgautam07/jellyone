import 'package:drift/drift.dart';

class Actors extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  TextColumn get profilePath => text()();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}
