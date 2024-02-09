// database.dart
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:seccai/data/dao/project_dao.dart';
import 'package:seccai/data/dao/user_dao.dart';
import 'package:seccai/helper/converter/date_converter.dart';
import 'package:seccai/data/model/project_model.dart';
import 'package:seccai/data/model/user_model.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'SeccaiDB.g.dart'; // the generated code will be there

@TypeConverters([DateTimeConverter])
@Database(
    version: 1,
    entities: [UserModel,ProjectModel])
abstract class AppDatabase extends FloorDatabase {

  UserDao get userDao;
  ProjectDao get projectDao;
  static Future<AppDatabase> init() async {
    AppDatabase instance = await $FloorAppDatabase.databaseBuilder("seccaidb")
        .build();
    return instance;
  }
}
