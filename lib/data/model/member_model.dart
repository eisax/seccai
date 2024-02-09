import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';


@JsonSerializable(fieldRename: FieldRename.snake)
@Entity(tableName: 'member')
class Member {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String name;
  String email;

  Member(
      {this.id,
      required this.name,
      required this.email});

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }
}
