import 'package:drift/drift.dart';
import 'package:jellyone/db/tables/genres.dart';
import 'package:jellyone/db/tables/movies.dart';

class MovieGenres extends Table {
  IntColumn get movieId => integer().references(MoviesTable, #id)();
  IntColumn get genreId => integer().references(Genres, #id)();

  @override
  Set<Column<Object>>? get primaryKey => {movieId, genreId};
}
