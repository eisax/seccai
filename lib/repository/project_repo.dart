import 'package:seccai/data/SeccaiDB.dart';
import 'package:seccai/data/model/project_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ProjectRepo {
  final AppDatabase db;
  ProjectRepo({required this.db});
  final String baseUrl = 'http://';

  Future<void>? saveProject(ProjectModel Project) {
    return db.projectDao.insertProject(Project);
  }

  Future<List<ProjectModel?>> getAllProjects() {
    return db.projectDao.findAllProjects();
  }

  Future<ProjectModel?> findProjectById(id) {
    return db.projectDao.findProjecById(id);
  }
}
