import 'package:drift/drift.dart';

class NotesTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 1, max: 20)();
  TextColumn get desc => text().withLength(max: 200)();
  IntColumn get priority => integer().withDefault(Constant(0))();
  DateTimeColumn get date => dateTime().nullable()();

  // @override
  // Set<Column> get primaryKey => {id};
}

// table for the todos
class ToDo extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get task => text().withLength(max: 30, min: 1)();
  BoolColumn get isCompleted => boolean().withDefault(Constant(false))();
  DateTimeColumn get date => dateTime().nullable()();

  // @override
  // Set<Column> get primaryKey => {id};
}
