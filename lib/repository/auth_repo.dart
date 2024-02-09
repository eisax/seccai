import 'package:seccai/data/SeccaiDB.dart';
import 'package:seccai/data/model/user_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthRepo {
  final AppDatabase db;
  AuthRepo({required this.db});
   final String baseUrl = 'http://';

  Future<void>? saveUser(UserModel user) {
    return db.userDao.insertUser(user);
  }

  Future<List<UserModel?>> getAllUsers() {
    return db.userDao.findAllUsers();
  }

  Future<UserModel?> authUser(email, password) {
    return db.userDao.authUser(email, password);
  }

  Future<UserModel?> findUserByEmail(email) {
    return db.userDao.findUserByEmail(email);
  }

  Future<bool> register(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      body: jsonEncode({'email': email, 'password': password}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      return true;
    } else {
      return false;
    }
  }
}
