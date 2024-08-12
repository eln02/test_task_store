import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'products_db.g.dart';

class MyProducts extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 100)();
  RealColumn get price => real()();
  TextColumn get description => text().withLength(min: 1, max: 5000)();
  TextColumn get url => text().withLength(min: 1, max: 5000)();
  BoolColumn get isFavorite => boolean()();
}


@DriftDatabase(tables: [MyProducts])
class ProductDatabase extends _$ProductDatabase {
  ProductDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'my_database');
  }
}
