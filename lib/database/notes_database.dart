import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:word_calculator_pdf_maker/database/database_tables.dart';
import 'package:path/path.dart' as p;

part 'notes_database.g.dart';

@DriftDatabase(tables: [NotesTable, ToDo], daos: [NotesDao, TodoDao])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnectionNotes());

  @override
  // TODO: implement schemaVersion
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onUpgrade: (migrator, from, to) async {
          if (from == 1) {
            await migrator.createTable(toDo);
          }
        },
      );
}

LazyDatabase _openConnectionNotes() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftAccessor(tables: [NotesTable])
class NotesDao extends DatabaseAccessor<MyDatabase> with _$NotesDaoMixin {
  final MyDatabase db;
  NotesDao(this.db) : super(db);

  Future<List<NotesTableData>> getAllNotes() => select(notesTable).get();
  Stream<List<NotesTableData>> watchAllNotes() => select(notesTable).watch();
  Future insertNote(NotesTableCompanion note) => into(notesTable).insert(note);
  Future deleteNote(NotesTableCompanion note) =>
      delete(notesTable).delete(note);
  Future updateNote(NotesTableCompanion note) {
    // print('id came for update in db--> ' + note.id.toString());
    return (update(notesTable).replace(note));
  }
}

// Dao object for ToDos table
@DriftAccessor(tables: [ToDo])
class TodoDao extends DatabaseAccessor<MyDatabase> with _$TodoDaoMixin {
  TodoDao(MyDatabase attachedDatabase) : super(attachedDatabase);

  Stream<List<ToDoData>> watchTodo() => select(toDo).watch();
  Future insertTodo(ToDoCompanion todo) => into(toDo).insert(todo);
  Future deleteTodo(ToDoCompanion todo) => delete(toDo).delete(todo);
  Future updateTodo(ToDoCompanion todo) => update(toDo).replace(todo);
}
