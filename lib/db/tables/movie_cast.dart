import 'package:drift/drift.dart';
import 'package:jellyone/db/tables/actors.dart';
import 'package:jellyone/db/tables/movies.dart';

class MovieCast extends Table {
  IntColumn get actorId => integer().references(Actors, #id)();
  IntColumn get movieId => integer().references(MoviesTable, #id)();
  TextColumn get role => text()();
  TextColumn get as => text()();

  @override
  Set<Column<Object>>? get primaryKey => {actorId, movieId, role};
}
