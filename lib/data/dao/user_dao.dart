// dao/person_dao.dart

import 'package:floor/floor.dart';
import 'package:seccai/data/model/user_model.dart';

@dao
abstract class UserDao {
  @Query('SELECT * FROM user')
  Future<List<UserModel>> findAllUsers();

  @Query('SELECT * FROM user WHERE email = :email')
  Future<UserModel?> findUserByEmail(String email);

  @Query('SELECT * FROM user WHERE email = :email AND password = :password')
  Future<UserModel?> authUser(String email, String password);

  @insert
  Future<void> insertUser(UserModel person);
}
