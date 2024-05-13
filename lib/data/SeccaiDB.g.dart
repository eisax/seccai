// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SeccaiDB.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
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

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

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
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
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
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  UserDao? _userDaoInstance;

  ProjectDao? _projectDaoInstance;

  TaskDao? _taskDaoInstance;

  ListingDao? _listingDaoInstance;

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
            'CREATE TABLE IF NOT EXISTS `user` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT NOT NULL, `email` TEXT NOT NULL, `password` TEXT NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `project` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `project_name` TEXT, `description` TEXT, `created_at` TEXT, `due_at` TEXT, `user_id` INTEGER, FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `task` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `ticket_id` TEXT, `title` TEXT, `project_id` INTEGER NOT NULL, `description` TEXT, `leader_id` INTEGER, `created_at` TEXT, `due_at` TEXT, FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, FOREIGN KEY (`leader_id`) REFERENCES `user` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `listing` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT NOT NULL)');
        await database.execute(
            'CREATE UNIQUE INDEX `index_user_email` ON `user` (`email`)');
        await database.execute(
            'CREATE UNIQUE INDEX `index_task_ticket_id` ON `task` (`ticket_id`)');
        await database.execute(
            'CREATE UNIQUE INDEX `index_listing_name` ON `listing` (`name`)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  UserDao get userDao {
    return _userDaoInstance ??= _$UserDao(database, changeListener);
  }

  @override
  ProjectDao get projectDao {
    return _projectDaoInstance ??= _$ProjectDao(database, changeListener);
  }

  @override
  TaskDao get taskDao {
    return _taskDaoInstance ??= _$TaskDao(database, changeListener);
  }

  @override
  ListingDao get listingDao {
    return _listingDaoInstance ??= _$ListingDao(database, changeListener);
  }
}

class _$UserDao extends UserDao {
  _$UserDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _userModelInsertionAdapter = InsertionAdapter(
            database,
            'user',
            (UserModel item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'email': item.email,
                  'password': item.password
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<UserModel> _userModelInsertionAdapter;

  @override
  Future<List<UserModel>> findAllUsers() async {
    return _queryAdapter.queryList('SELECT * FROM user',
        mapper: (Map<String, Object?> row) => UserModel(
            id: row['id'] as int?,
            name: row['name'] as String,
            email: row['email'] as String,
            password: row['password'] as String));
  }

  @override
  Future<UserModel?> findUserByEmail(String email) async {
    return _queryAdapter.query('SELECT * FROM user WHERE email = ?1',
        mapper: (Map<String, Object?> row) => UserModel(
            id: row['id'] as int?,
            name: row['name'] as String,
            email: row['email'] as String,
            password: row['password'] as String),
        arguments: [email]);
  }

  @override
  Future<UserModel?> authUser(
    String email,
    String password,
  ) async {
    return _queryAdapter.query(
        'SELECT * FROM user WHERE email = ?1 AND password = ?2',
        mapper: (Map<String, Object?> row) => UserModel(
            id: row['id'] as int?,
            name: row['name'] as String,
            email: row['email'] as String,
            password: row['password'] as String),
        arguments: [email, password]);
  }

  @override
  Future<void> insertUser(UserModel person) async {
    await _userModelInsertionAdapter.insert(person, OnConflictStrategy.abort);
  }
}

class _$ProjectDao extends ProjectDao {
  _$ProjectDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _projectModelInsertionAdapter = InsertionAdapter(
            database,
            'project',
            (ProjectModel item) => <String, Object?>{
                  'id': item.id,
                  'project_name': item.projectName,
                  'description': item.description,
                  'created_at': item.createdAt,
                  'due_at': item.dueAt,
                  'user_id': item.userId
                }),
        _projectModelUpdateAdapter = UpdateAdapter(
            database,
            'project',
            ['id'],
            (ProjectModel item) => <String, Object?>{
                  'id': item.id,
                  'project_name': item.projectName,
                  'description': item.description,
                  'created_at': item.createdAt,
                  'due_at': item.dueAt,
                  'user_id': item.userId
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<ProjectModel> _projectModelInsertionAdapter;

  final UpdateAdapter<ProjectModel> _projectModelUpdateAdapter;

  @override
  Future<List<ProjectModel>> findAllProjects() async {
    return _queryAdapter.queryList('SELECT * FROM project',
        mapper: (Map<String, Object?> row) => ProjectModel(
            id: row['id'] as int?,
            projectName: row['project_name'] as String?,
            description: row['description'] as String?,
            createdAt: row['created_at'] as String?,
            dueAt: row['due_at'] as String?,
            userId: row['user_id'] as int?));
  }

  @override
  Future<ProjectModel?> findProjecById(String id) async {
    return _queryAdapter.query('SELECT * FROM project WHERE id = ?1',
        mapper: (Map<String, Object?> row) => ProjectModel(
            id: row['id'] as int?,
            projectName: row['project_name'] as String?,
            description: row['description'] as String?,
            createdAt: row['created_at'] as String?,
            dueAt: row['due_at'] as String?,
            userId: row['user_id'] as int?),
        arguments: [id]);
  }

  @override
  Future<void> insertProject(ProjectModel project) async {
    await _projectModelInsertionAdapter.insert(
        project, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateProject(ProjectModel myEntity) async {
    await _projectModelUpdateAdapter.update(myEntity, OnConflictStrategy.abort);
  }
}

class _$TaskDao extends TaskDao {
  _$TaskDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _taskInsertionAdapter = InsertionAdapter(
            database,
            'task',
            (Task item) => <String, Object?>{
                  'id': item.id,
                  'ticket_id': item.ticketId,
                  'title': item.title,
                  'project_id': item.projectId,
                  'description': item.description,
                  'leader_id': item.leaderId,
                  'created_at': item.createdAt,
                  'due_at': item.dueAt
                }),
        _taskUpdateAdapter = UpdateAdapter(
            database,
            'task',
            ['id'],
            (Task item) => <String, Object?>{
                  'id': item.id,
                  'ticket_id': item.ticketId,
                  'title': item.title,
                  'project_id': item.projectId,
                  'description': item.description,
                  'leader_id': item.leaderId,
                  'created_at': item.createdAt,
                  'due_at': item.dueAt
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Task> _taskInsertionAdapter;

  final UpdateAdapter<Task> _taskUpdateAdapter;

  @override
  Future<List<Task>> findAllTasks() async {
    return _queryAdapter.queryList('SELECT * FROM task',
        mapper: (Map<String, Object?> row) => Task(
            id: row['id'] as int?,
            title: row['title'] as String?,
            description: row['description'] as String?,
            leaderId: row['leader_id'] as int?,
            ticketId: row['ticket_id'] as String?,
            createdAt: row['created_at'] as String?,
            dueAt: row['due_at'] as String?,
            projectId: row['project_id'] as int));
  }

  @override
  Future<Task?> findTaskById(String id) async {
    return _queryAdapter.query('SELECT * FROM task WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Task(
            id: row['id'] as int?,
            title: row['title'] as String?,
            description: row['description'] as String?,
            leaderId: row['leader_id'] as int?,
            ticketId: row['ticket_id'] as String?,
            createdAt: row['created_at'] as String?,
            dueAt: row['due_at'] as String?,
            projectId: row['project_id'] as int),
        arguments: [id]);
  }

  @override
  Future<void> insertTask(Task task) async {
    await _taskInsertionAdapter.insert(task, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateTask(Task task) async {
    await _taskUpdateAdapter.update(task, OnConflictStrategy.abort);
  }
}

class _$ListingDao extends ListingDao {
  _$ListingDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _listingModelInsertionAdapter = InsertionAdapter(
            database,
            'listing',
            (ListingModel item) =>
                <String, Object?>{'id': item.id, 'name': item.name}),
        _listingModelUpdateAdapter = UpdateAdapter(
            database,
            'listing',
            ['id'],
            (ListingModel item) =>
                <String, Object?>{'id': item.id, 'name': item.name});

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<ListingModel> _listingModelInsertionAdapter;

  final UpdateAdapter<ListingModel> _listingModelUpdateAdapter;

  @override
  Future<List<ListingModel>> findAllListings() async {
    return _queryAdapter.queryList('SELECT * FROM listing',
        mapper: (Map<String, Object?> row) =>
            ListingModel(id: row['id'] as int?, name: row['name'] as String));
  }

  @override
  Future<ListingModel?> findListingById(String id) async {
    return _queryAdapter.query('SELECT * FROM listing WHERE id = ?1',
        mapper: (Map<String, Object?> row) =>
            ListingModel(id: row['id'] as int?, name: row['name'] as String),
        arguments: [id]);
  }

  @override
  Future<void> insertListing(ListingModel task) async {
    await _listingModelInsertionAdapter.insert(task, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateListing(ListingModel task) async {
    await _listingModelUpdateAdapter.update(task, OnConflictStrategy.abort);
  }
}

// ignore_for_file: unused_element
final _dateTimeConverter = DateTimeConverter();
