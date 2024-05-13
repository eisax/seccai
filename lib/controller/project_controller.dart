import 'dart:convert';
import 'dart:math';

import 'package:get/get.dart';
import 'package:seccai/data/model/project_model.dart';
import 'package:seccai/data/model/task_model.dart';
import 'package:seccai/repository/project_repo.dart';

class ProjectController extends GetxController implements GetxService {
  ProjectRepo projectRepo;
  ProjectController({required this.projectRepo});

  List<ProjectModel> projects = [];
  List<Task> tasks = [];

  //project locally
  Future<bool> createProjectLocal({required ProjectModel project}) async {
    try {
      projectRepo.saveProject(project);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> fetchProjects() async {
    return projectRepo.getAllProjects().then((value) => {
          if (value.isNotEmpty) {projects = value.cast()}
        });
  }

  Future<void> updateProject(ProjectModel project) async {
    return projectRepo.updateProject(project);
  }

  //task locally
  Future<bool> createTaskLocal({required Task task}) async {
    try {
      projectRepo.saveTask(task);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> fetchTasks() async {
    return projectRepo.getAllTasks().then((value) => {
          if (value.isNotEmpty) {tasks = value.cast()}
        });
  }

  Future<void> updateTask(Task task) async {
    return projectRepo.updateTask(task);
  }

  Future<String> generateTicketId() async {
    const alphanumeric = 'abcdefghijklmnopqrstuvwxyz0123456789';
    final random = Random();
    return String.fromCharCodes(
      Iterable.generate(
        10,
        (_) => alphanumeric.codeUnitAt(
          random.nextInt(alphanumeric.length),
        ),
      ),
    );
  }
}
