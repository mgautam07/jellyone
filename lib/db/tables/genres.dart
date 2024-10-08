import 'package:drift/drift.dart';

class Genres extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}
