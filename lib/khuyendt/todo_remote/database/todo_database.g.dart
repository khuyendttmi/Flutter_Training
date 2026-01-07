// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_database.dart';

// ignore_for_file: type=lint
class $TodoTableTable extends TodoTable
    with TableInfo<$TodoTableTable, TodoEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TodoTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _completedMeta = const VerificationMeta(
    'completed',
  );
  @override
  late final GeneratedColumn<bool> completed = GeneratedColumn<bool>(
    'completed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("completed" IN (0, 1))',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [userId, id, title, completed];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'todo_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<TodoEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('completed')) {
      context.handle(
        _completedMeta,
        completed.isAcceptableOrUnknown(data['completed']!, _completedMeta),
      );
    } else if (isInserting) {
      context.missing(_completedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {userId, id};
  @override
  TodoEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TodoEntity(
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_id'],
      )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      completed: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}completed'],
      )!,
    );
  }

  @override
  $TodoTableTable createAlias(String alias) {
    return $TodoTableTable(attachedDatabase, alias);
  }
}

class TodoEntity extends DataClass implements Insertable<TodoEntity> {
  final int userId;
  final int id;
  final String title;
  final bool completed;
  const TodoEntity({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<int>(userId);
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['completed'] = Variable<bool>(completed);
    return map;
  }

  TodoTableCompanion toCompanion(bool nullToAbsent) {
    return TodoTableCompanion(
      userId: Value(userId),
      id: Value(id),
      title: Value(title),
      completed: Value(completed),
    );
  }

  factory TodoEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TodoEntity(
      userId: serializer.fromJson<int>(json['userId']),
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      completed: serializer.fromJson<bool>(json['completed']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userId': serializer.toJson<int>(userId),
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'completed': serializer.toJson<bool>(completed),
    };
  }

  TodoEntity copyWith({int? userId, int? id, String? title, bool? completed}) =>
      TodoEntity(
        userId: userId ?? this.userId,
        id: id ?? this.id,
        title: title ?? this.title,
        completed: completed ?? this.completed,
      );
  TodoEntity copyWithCompanion(TodoTableCompanion data) {
    return TodoEntity(
      userId: data.userId.present ? data.userId.value : this.userId,
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      completed: data.completed.present ? data.completed.value : this.completed,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TodoEntity(')
          ..write('userId: $userId, ')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('completed: $completed')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(userId, id, title, completed);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TodoEntity &&
          other.userId == this.userId &&
          other.id == this.id &&
          other.title == this.title &&
          other.completed == this.completed);
}

class TodoTableCompanion extends UpdateCompanion<TodoEntity> {
  final Value<int> userId;
  final Value<int> id;
  final Value<String> title;
  final Value<bool> completed;
  final Value<int> rowid;
  const TodoTableCompanion({
    this.userId = const Value.absent(),
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.completed = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TodoTableCompanion.insert({
    required int userId,
    required int id,
    required String title,
    required bool completed,
    this.rowid = const Value.absent(),
  }) : userId = Value(userId),
       id = Value(id),
       title = Value(title),
       completed = Value(completed);
  static Insertable<TodoEntity> custom({
    Expression<int>? userId,
    Expression<int>? id,
    Expression<String>? title,
    Expression<bool>? completed,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (completed != null) 'completed': completed,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TodoTableCompanion copyWith({
    Value<int>? userId,
    Value<int>? id,
    Value<String>? title,
    Value<bool>? completed,
    Value<int>? rowid,
  }) {
    return TodoTableCompanion(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      completed: completed ?? this.completed,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (completed.present) {
      map['completed'] = Variable<bool>(completed.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TodoTableCompanion(')
          ..write('userId: $userId, ')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('completed: $completed, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$TodoDatabase extends GeneratedDatabase {
  _$TodoDatabase(QueryExecutor e) : super(e);
  $TodoDatabaseManager get managers => $TodoDatabaseManager(this);
  late final $TodoTableTable todoTable = $TodoTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [todoTable];
}

typedef $$TodoTableTableCreateCompanionBuilder =
    TodoTableCompanion Function({
      required int userId,
      required int id,
      required String title,
      required bool completed,
      Value<int> rowid,
    });
typedef $$TodoTableTableUpdateCompanionBuilder =
    TodoTableCompanion Function({
      Value<int> userId,
      Value<int> id,
      Value<String> title,
      Value<bool> completed,
      Value<int> rowid,
    });

class $$TodoTableTableFilterComposer
    extends Composer<_$TodoDatabase, $TodoTableTable> {
  $$TodoTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get completed => $composableBuilder(
    column: $table.completed,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TodoTableTableOrderingComposer
    extends Composer<_$TodoDatabase, $TodoTableTable> {
  $$TodoTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get completed => $composableBuilder(
    column: $table.completed,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TodoTableTableAnnotationComposer
    extends Composer<_$TodoDatabase, $TodoTableTable> {
  $$TodoTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<bool> get completed =>
      $composableBuilder(column: $table.completed, builder: (column) => column);
}

class $$TodoTableTableTableManager
    extends
        RootTableManager<
          _$TodoDatabase,
          $TodoTableTable,
          TodoEntity,
          $$TodoTableTableFilterComposer,
          $$TodoTableTableOrderingComposer,
          $$TodoTableTableAnnotationComposer,
          $$TodoTableTableCreateCompanionBuilder,
          $$TodoTableTableUpdateCompanionBuilder,
          (
            TodoEntity,
            BaseReferences<_$TodoDatabase, $TodoTableTable, TodoEntity>,
          ),
          TodoEntity,
          PrefetchHooks Function()
        > {
  $$TodoTableTableTableManager(_$TodoDatabase db, $TodoTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TodoTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TodoTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TodoTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> userId = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<bool> completed = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TodoTableCompanion(
                userId: userId,
                id: id,
                title: title,
                completed: completed,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int userId,
                required int id,
                required String title,
                required bool completed,
                Value<int> rowid = const Value.absent(),
              }) => TodoTableCompanion.insert(
                userId: userId,
                id: id,
                title: title,
                completed: completed,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TodoTableTableProcessedTableManager =
    ProcessedTableManager<
      _$TodoDatabase,
      $TodoTableTable,
      TodoEntity,
      $$TodoTableTableFilterComposer,
      $$TodoTableTableOrderingComposer,
      $$TodoTableTableAnnotationComposer,
      $$TodoTableTableCreateCompanionBuilder,
      $$TodoTableTableUpdateCompanionBuilder,
      (TodoEntity, BaseReferences<_$TodoDatabase, $TodoTableTable, TodoEntity>),
      TodoEntity,
      PrefetchHooks Function()
    >;

class $TodoDatabaseManager {
  final _$TodoDatabase _db;
  $TodoDatabaseManager(this._db);
  $$TodoTableTableTableManager get todoTable =>
      $$TodoTableTableTableManager(_db, _db.todoTable);
}
