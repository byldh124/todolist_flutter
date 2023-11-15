// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memo_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorMemoDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$MemoDatabaseBuilder databaseBuilder(String name) =>
      _$MemoDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$MemoDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$MemoDatabaseBuilder(null);
}

class _$MemoDatabaseBuilder {
  _$MemoDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$MemoDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$MemoDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<MemoDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$MemoDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$MemoDatabase extends MemoDatabase {
  _$MemoDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  MemoDao? _memoDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Memo` (`id` INTEGER NOT NULL, `desc` TEXT NOT NULL, `date` INTEGER NOT NULL, `color` INTEGER NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  MemoDao get memoDao {
    return _memoDaoInstance ??= _$MemoDao(database, changeListener);
  }
}

class _$MemoDao extends MemoDao {
  _$MemoDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _memoInsertionAdapter = InsertionAdapter(
            database,
            'Memo',
            (Memo item) => <String, Object?>{
                  'id': item.id,
                  'desc': item.desc,
                  'date': item.date,
                  'color': item.color
                },
            changeListener),
        _memoUpdateAdapter = UpdateAdapter(
            database,
            'Memo',
            ['id'],
            (Memo item) => <String, Object?>{
                  'id': item.id,
                  'desc': item.desc,
                  'date': item.date,
                  'color': item.color
                },
            changeListener),
        _memoDeletionAdapter = DeletionAdapter(
            database,
            'Memo',
            ['id'],
            (Memo item) => <String, Object?>{
                  'id': item.id,
                  'desc': item.desc,
                  'date': item.date,
                  'color': item.color
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Memo> _memoInsertionAdapter;

  final UpdateAdapter<Memo> _memoUpdateAdapter;

  final DeletionAdapter<Memo> _memoDeletionAdapter;

  @override
  Future<List<Memo>> getAllMemos() async {
    return _queryAdapter.queryList('SELECT * FROM Memo',
        mapper: (Map<String, Object?> row) => Memo(
            id: row['id'] as int,
            desc: row['desc'] as String,
            date: row['date'] as int,
            color: row['color'] as int));
  }

  @override
  Stream<Memo?> getMemoById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM Memo WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Memo(
            id: row['id'] as int,
            desc: row['desc'] as String,
            date: row['date'] as int,
            color: row['color'] as int),
        arguments: [id],
        queryableName: 'Memo',
        isView: false);
  }

  @override
  Future<void> insertMemo(Memo memo) async {
    await _memoInsertionAdapter.insert(memo, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateTask(Memo memo) async {
    await _memoUpdateAdapter.update(memo, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteMemo(Memo memo) async {
    await _memoDeletionAdapter.delete(memo);
  }
}
