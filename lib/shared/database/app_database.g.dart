// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  Callback _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  FloorNoteDao _noteDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
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
            'CREATE TABLE IF NOT EXISTS `Note` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `title` TEXT, `isChecked` INTEGER)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  FloorNoteDao get noteDao {
    return _noteDaoInstance ??= _$FloorNoteDao(database, changeListener);
  }
}

class _$FloorNoteDao extends FloorNoteDao {
  _$FloorNoteDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _noteInsertionAdapter = InsertionAdapter(
            database,
            'Note',
            (Note item) => <String, dynamic>{
                  'id': item.id,
                  'title': item.title,
                  'isChecked':
                      item.isChecked == null ? null : (item.isChecked ? 1 : 0)
                },
            changeListener),
        _noteUpdateAdapter = UpdateAdapter(
            database,
            'Note',
            ['id'],
            (Note item) => <String, dynamic>{
                  'id': item.id,
                  'title': item.title,
                  'isChecked':
                      item.isChecked == null ? null : (item.isChecked ? 1 : 0)
                },
            changeListener),
        _noteDeletionAdapter = DeletionAdapter(
            database,
            'Note',
            ['id'],
            (Note item) => <String, dynamic>{
                  'id': item.id,
                  'title': item.title,
                  'isChecked':
                      item.isChecked == null ? null : (item.isChecked ? 1 : 0)
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Note> _noteInsertionAdapter;

  final UpdateAdapter<Note> _noteUpdateAdapter;

  final DeletionAdapter<Note> _noteDeletionAdapter;

  @override
  Stream<List<Note>> findAllNotesAsStream() {
    return _queryAdapter.queryListStream('SELECT * FROM Note',
        queryableName: 'Note',
        isView: false,
        mapper: (Map<String, dynamic> row) => Note(row['title'] as String,
            row['isChecked'] == null ? null : (row['isChecked'] as int) != 0));
  }

  @override
  Future<List<Note>> findAllNotes() async {
    return _queryAdapter.queryList('SELECT * FROM Note',
        mapper: (Map<String, dynamic> row) => Note(row['title'] as String,
            row['isChecked'] == null ? null : (row['isChecked'] as int) != 0));
  }

  @override
  Stream<Note> findByIdAsStream(int id) {
    return _queryAdapter.queryStream('SELECT * FROM Note WHERE id = ?',
        arguments: <dynamic>[id],
        queryableName: 'Note',
        isView: false,
        mapper: (Map<String, dynamic> row) => Note(row['title'] as String,
            row['isChecked'] == null ? null : (row['isChecked'] as int) != 0));
  }

  @override
  Future<Note> findById(int id) async {
    return _queryAdapter.query('SELECT * FROM Note WHERE id = ?',
        arguments: <dynamic>[id],
        mapper: (Map<String, dynamic> row) => Note(row['title'] as String,
            row['isChecked'] == null ? null : (row['isChecked'] as int) != 0));
  }

  @override
  Future<void> saveNote(Note note) async {
    await _noteInsertionAdapter.insert(note, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateNote(Note note) async {
    await _noteUpdateAdapter.update(note, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteNote(Note note) async {
    await _noteDeletionAdapter.delete(note);
  }
}
