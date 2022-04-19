// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class NotesTableData extends DataClass implements Insertable<NotesTableData> {
  final int id;
  final String title;
  final String desc;
  final int priority;
  final DateTime? date;
  NotesTableData(
      {required this.id,
      required this.title,
      required this.desc,
      required this.priority,
      this.date});
  factory NotesTableData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return NotesTableData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      desc: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}desc'])!,
      priority: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}priority'])!,
      date: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}date']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['desc'] = Variable<String>(desc);
    map['priority'] = Variable<int>(priority);
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<DateTime?>(date);
    }
    return map;
  }

  NotesTableCompanion toCompanion(bool nullToAbsent) {
    return NotesTableCompanion(
      id: Value(id),
      title: Value(title),
      desc: Value(desc),
      priority: Value(priority),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
    );
  }

  factory NotesTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NotesTableData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      desc: serializer.fromJson<String>(json['desc']),
      priority: serializer.fromJson<int>(json['priority']),
      date: serializer.fromJson<DateTime?>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'desc': serializer.toJson<String>(desc),
      'priority': serializer.toJson<int>(priority),
      'date': serializer.toJson<DateTime?>(date),
    };
  }

  NotesTableData copyWith(
          {int? id,
          String? title,
          String? desc,
          int? priority,
          DateTime? date}) =>
      NotesTableData(
        id: id ?? this.id,
        title: title ?? this.title,
        desc: desc ?? this.desc,
        priority: priority ?? this.priority,
        date: date ?? this.date,
      );
  @override
  String toString() {
    return (StringBuffer('NotesTableData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('desc: $desc, ')
          ..write('priority: $priority, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, desc, priority, date);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NotesTableData &&
          other.id == this.id &&
          other.title == this.title &&
          other.desc == this.desc &&
          other.priority == this.priority &&
          other.date == this.date);
}

class NotesTableCompanion extends UpdateCompanion<NotesTableData> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> desc;
  final Value<int> priority;
  final Value<DateTime?> date;
  const NotesTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.desc = const Value.absent(),
    this.priority = const Value.absent(),
    this.date = const Value.absent(),
  });
  NotesTableCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String desc,
    this.priority = const Value.absent(),
    this.date = const Value.absent(),
  })  : title = Value(title),
        desc = Value(desc);
  static Insertable<NotesTableData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? desc,
    Expression<int>? priority,
    Expression<DateTime?>? date,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (desc != null) 'desc': desc,
      if (priority != null) 'priority': priority,
      if (date != null) 'date': date,
    });
  }

  NotesTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? desc,
      Value<int>? priority,
      Value<DateTime?>? date}) {
    return NotesTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      desc: desc ?? this.desc,
      priority: priority ?? this.priority,
      date: date ?? this.date,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (desc.present) {
      map['desc'] = Variable<String>(desc.value);
    }
    if (priority.present) {
      map['priority'] = Variable<int>(priority.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime?>(date.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NotesTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('desc: $desc, ')
          ..write('priority: $priority, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }
}

class $NotesTableTable extends NotesTable
    with TableInfo<$NotesTableTable, NotesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NotesTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 20),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _descMeta = const VerificationMeta('desc');
  @override
  late final GeneratedColumn<String?> desc = GeneratedColumn<String?>(
      'desc', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 200),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _priorityMeta = const VerificationMeta('priority');
  @override
  late final GeneratedColumn<int?> priority = GeneratedColumn<int?>(
      'priority', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: Constant(0));
  final VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime?> date = GeneratedColumn<DateTime?>(
      'date', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, title, desc, priority, date];
  @override
  String get aliasedName => _alias ?? 'notes_table';
  @override
  String get actualTableName => 'notes_table';
  @override
  VerificationContext validateIntegrity(Insertable<NotesTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('desc')) {
      context.handle(
          _descMeta, desc.isAcceptableOrUnknown(data['desc']!, _descMeta));
    } else if (isInserting) {
      context.missing(_descMeta);
    }
    if (data.containsKey('priority')) {
      context.handle(_priorityMeta,
          priority.isAcceptableOrUnknown(data['priority']!, _priorityMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NotesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return NotesTableData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $NotesTableTable createAlias(String alias) {
    return $NotesTableTable(attachedDatabase, alias);
  }
}

class ToDoData extends DataClass implements Insertable<ToDoData> {
  final int id;
  final String task;
  final bool isCompleted;
  final DateTime? date;
  ToDoData(
      {required this.id,
      required this.task,
      required this.isCompleted,
      this.date});
  factory ToDoData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return ToDoData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      task: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}task'])!,
      isCompleted: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_completed'])!,
      date: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}date']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['task'] = Variable<String>(task);
    map['is_completed'] = Variable<bool>(isCompleted);
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<DateTime?>(date);
    }
    return map;
  }

  ToDoCompanion toCompanion(bool nullToAbsent) {
    return ToDoCompanion(
      id: Value(id),
      task: Value(task),
      isCompleted: Value(isCompleted),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
    );
  }

  factory ToDoData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ToDoData(
      id: serializer.fromJson<int>(json['id']),
      task: serializer.fromJson<String>(json['task']),
      isCompleted: serializer.fromJson<bool>(json['isCompleted']),
      date: serializer.fromJson<DateTime?>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'task': serializer.toJson<String>(task),
      'isCompleted': serializer.toJson<bool>(isCompleted),
      'date': serializer.toJson<DateTime?>(date),
    };
  }

  ToDoData copyWith(
          {int? id, String? task, bool? isCompleted, DateTime? date}) =>
      ToDoData(
        id: id ?? this.id,
        task: task ?? this.task,
        isCompleted: isCompleted ?? this.isCompleted,
        date: date ?? this.date,
      );
  @override
  String toString() {
    return (StringBuffer('ToDoData(')
          ..write('id: $id, ')
          ..write('task: $task, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, task, isCompleted, date);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ToDoData &&
          other.id == this.id &&
          other.task == this.task &&
          other.isCompleted == this.isCompleted &&
          other.date == this.date);
}

class ToDoCompanion extends UpdateCompanion<ToDoData> {
  final Value<int> id;
  final Value<String> task;
  final Value<bool> isCompleted;
  final Value<DateTime?> date;
  const ToDoCompanion({
    this.id = const Value.absent(),
    this.task = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.date = const Value.absent(),
  });
  ToDoCompanion.insert({
    this.id = const Value.absent(),
    required String task,
    this.isCompleted = const Value.absent(),
    this.date = const Value.absent(),
  }) : task = Value(task);
  static Insertable<ToDoData> custom({
    Expression<int>? id,
    Expression<String>? task,
    Expression<bool>? isCompleted,
    Expression<DateTime?>? date,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (task != null) 'task': task,
      if (isCompleted != null) 'is_completed': isCompleted,
      if (date != null) 'date': date,
    });
  }

  ToDoCompanion copyWith(
      {Value<int>? id,
      Value<String>? task,
      Value<bool>? isCompleted,
      Value<DateTime?>? date}) {
    return ToDoCompanion(
      id: id ?? this.id,
      task: task ?? this.task,
      isCompleted: isCompleted ?? this.isCompleted,
      date: date ?? this.date,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (task.present) {
      map['task'] = Variable<String>(task.value);
    }
    if (isCompleted.present) {
      map['is_completed'] = Variable<bool>(isCompleted.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime?>(date.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ToDoCompanion(')
          ..write('id: $id, ')
          ..write('task: $task, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }
}

class $ToDoTable extends ToDo with TableInfo<$ToDoTable, ToDoData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ToDoTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _taskMeta = const VerificationMeta('task');
  @override
  late final GeneratedColumn<String?> task = GeneratedColumn<String?>(
      'task', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 30),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _isCompletedMeta =
      const VerificationMeta('isCompleted');
  @override
  late final GeneratedColumn<bool?> isCompleted = GeneratedColumn<bool?>(
      'is_completed', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (is_completed IN (0, 1))',
      defaultValue: Constant(false));
  final VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime?> date = GeneratedColumn<DateTime?>(
      'date', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, task, isCompleted, date];
  @override
  String get aliasedName => _alias ?? 'to_do';
  @override
  String get actualTableName => 'to_do';
  @override
  VerificationContext validateIntegrity(Insertable<ToDoData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('task')) {
      context.handle(
          _taskMeta, task.isAcceptableOrUnknown(data['task']!, _taskMeta));
    } else if (isInserting) {
      context.missing(_taskMeta);
    }
    if (data.containsKey('is_completed')) {
      context.handle(
          _isCompletedMeta,
          isCompleted.isAcceptableOrUnknown(
              data['is_completed']!, _isCompletedMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ToDoData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return ToDoData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ToDoTable createAlias(String alias) {
    return $ToDoTable(attachedDatabase, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $NotesTableTable notesTable = $NotesTableTable(this);
  late final $ToDoTable toDo = $ToDoTable(this);
  late final NotesDao notesDao = NotesDao(this as MyDatabase);
  late final TodoDao todoDao = TodoDao(this as MyDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [notesTable, toDo];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$NotesDaoMixin on DatabaseAccessor<MyDatabase> {
  $NotesTableTable get notesTable => attachedDatabase.notesTable;
}
mixin _$TodoDaoMixin on DatabaseAccessor<MyDatabase> {
  $ToDoTable get toDo => attachedDatabase.toDo;
}
