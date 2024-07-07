import 'package:drift/drift.dart';
import 'package:jellyone/db/tables/genres.dart';
import 'package:jellyone/db/tables/series.dart';

class TvGenres extends Table {
  IntColumn get seriesId => integer().references(Series, #id)();
  IntColumn get genreId => integer().references(Genres, #id)();

  @override
  Set<Column<Object>>? get primaryKey => {seriesId, genreId};
}
