import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';


@JsonSerializable(fieldRename: FieldRename.snake)
@Entity(tableName: 'user', indices: [Index(value: ['email'], unique: true)])
class UserModel {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String name;
  @PrimaryKey()
  String email;
  String password;

  UserModel(
      {this.id,
      required this.name,
      required this.email,
      required this.password});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
    };
  }
}
