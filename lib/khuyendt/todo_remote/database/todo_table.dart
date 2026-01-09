import 'package:drift/drift.dart';

@DataClassName('TodoEntity')
class TodoTable extends Table {
  IntColumn get userId => integer().autoIncrement()();
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  BoolColumn get completed => boolean()();
}
