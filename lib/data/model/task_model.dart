import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:seccai/data/model/member_model.dart';
import 'package:seccai/data/model/project_model.dart';
import 'package:seccai/data/model/user_model.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
@Entity(
  tableName: 'task',
  foreignKeys: [
    ForeignKey(
      childColumns: ['project_id'],
      parentColumns: ['id'],
      entity: ProjectModel,
    ),
    ForeignKey(
      childColumns: ['leader_id'],
      parentColumns: ['id'],
      entity: UserModel,
    ),
  ],
  indices: [Index(value: ['ticket_id'], unique: true)]
)
class Task {
  @PrimaryKey(autoGenerate: true)
  int? id;
  @ColumnInfo(name: 'ticket_id')
  String? ticketId;
  String? title;
  @ColumnInfo(name: 'project_id')
  int projectId;
  String? description;
  @ColumnInfo(name: 'leader_id')
  int? leaderId;
  @ColumnInfo(name: 'created_at')
  String? createdAt;
  @ColumnInfo(name: 'due_at')
  String? dueAt;
  @ColumnInfo(name: 'collaborator')
  @ignore
  List<Member>? collaborator;

  Task(
      {this.id,
      this.title,
      this.description,
      this.leaderId,
      this.ticketId,
      this.createdAt,
      this.dueAt,
     required this.projectId,
      this.collaborator});

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
        id: json['id'],
        title: json['title'],
        createdAt: json['created_at'],
        dueAt: json['due_at'],
        description: json['description'],
        leaderId: json['leaderId'],
        ticketId: json['ticket_id'],
        projectId: json['project_id'],
        collaborator: json['collaborator']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'leader_id': leaderId,
      'created_at': createdAt,
      'due_at': dueAt,
      'collaborator': collaborator,
      'ticket_id': ticketId,
      'project_id':projectId
    };
  }
}
