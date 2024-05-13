import 'package:seccai/data/SeccaiDB.dart';
import 'package:seccai/data/model/listing_model.dart';
import 'package:seccai/data/model/project_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:seccai/data/model/task_model.dart';

class ProjectRepo {
  final AppDatabase db;
  ProjectRepo({required this.db});
  final String baseUrl = 'http://';

  //project locally
  Future<void>? saveProject(ProjectModel Project) {
    return db.projectDao.insertProject(Project);
  }

  Future<List<ProjectModel?>> getAllProjects() {
    return db.projectDao.findAllProjects();
  }

  Future<ProjectModel?> findProjectById(id) {
    return db.projectDao.findProjecById(id);
  }

  Future<void> updateProject(ProjectModel project) {
    return db.projectDao.updateProject(project);
  }

  //task locally
  Future<void>? saveTask(Task task) {
    return db.taskDao.insertTask(task);
  }

  Future<List<Task?>> getAllTasks() {
    return db.taskDao.findAllTasks();
  }

  Future<Task?> findTaskById(id) {
    return db.taskDao.findTaskById(id);
  }

  Future<void> updateTask(Task task) {
    return db.taskDao.updateTask(task);
  }

  //listing locally
  Future<void>? saveListing(ListingModel listing) {
    return db.listingDao.insertListing(listing);
  }

  Future<List<ListingModel?>> getAllListings() {
    return db.listingDao.findAllListings();
  }

  Future<ListingModel?> findListingById(id) {
    return db.listingDao.findListingById(id);
  }

  Future<void> updateListing(ListingModel task) {
    return db.listingDao.updateListing(task);
  }
}
