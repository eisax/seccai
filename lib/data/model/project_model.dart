import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:seccai/data/model/member_model.dart';
import 'package:seccai/data/model/task_model.dart';
import 'package:seccai/data/model/user_model.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
@Entity(
  tableName: 'project', 
  foreignKeys: [
    ForeignKey(
      childColumns: ['user_id'],
      parentColumns: ['id'],
      entity: UserModel,
    )
  ],
)
class ProjectModel {
  @PrimaryKey(autoGenerate: true)
  int? id;
  @ColumnInfo(name: 'project_name')
  String? projectName;
  String? description;
  @ColumnInfo(name: 'created_at')
  String? createdAt;
  @ColumnInfo(name: 'due_at')
  String? dueAt;
  @ColumnInfo(name: 'user_id')
  int? userId;
  @ignore
  List<Task>? tasks;
  @ignore
  List<Member>? members;

  ProjectModel({
    this.id,
    this.projectName,
    this.description,
    this.createdAt,
    this.dueAt,
    this.userId,
    this.tasks,
    this.members,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      id: json['id'] as int?,
      projectName: json['project_name'] as String?,
      description: json['description'] as String?,
      createdAt: json['created_at'] as String?,
      dueAt: json['due_at'] as String?,
      userId: json['user_id'] as int?,
      tasks: (json['tasks'] as List<dynamic>?)?.map((e) => Task.fromJson(e)).toList(),
      members: (json['members'] as List<dynamic>?)?.map((e) => Member.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'project_name': projectName,
      'description': description,
      'created_at': createdAt,
      'due_at': dueAt,
      'user_id': userId,
      'tasks': tasks?.map((e) => e.toJson()).toList(),
      'members': members?.map((e) => e.toJson()).toList(),
    };
  }
}
