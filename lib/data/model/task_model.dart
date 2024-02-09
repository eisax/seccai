import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:seccai/data/model/member_model.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
@Entity(tableName: 'task')
class Task {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String? title;
  String? description;
  @ColumnInfo(name: 'leader_id')
  int? leaderId;
  @ColumnInfo(name: 'created_at')
  String? createdAt;
  @ColumnInfo(name: 'due_at')
  String? dueAt;
  @ColumnInfo(name: 'team_members')
  List<Member>? teammembers;

  Task(
      {this.id,
      this.title,
      this.description,
      this.leaderId,
      this.createdAt,
      this.dueAt,
      this.teammembers});

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
        id: json['id'],
        title: json['title'],
        createdAt: json['created_at'],
        dueAt: json['due_at'],
        description: json['description'],
        leaderId: json['leaderId'],
        teammembers: json['team_members']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'leaderId': leaderId,
      'created_at': createdAt,
      'due_at': dueAt,
      'team_members': teammembers
    };
  }
}
