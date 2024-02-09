import 'package:get/get.dart';
import 'package:seccai/data/model/project_model.dart';
import 'package:seccai/repository/project_repo.dart';

class ProjectController extends GetxController implements GetxService {
  ProjectRepo projectRepo;
  ProjectController({required this.projectRepo});

  Future<bool> createProjectLocal({required ProjectModel project}) async {
    try {
      projectRepo.saveProject(project);
      return true;
    } catch (e) {
      return false;
    }
  }
}
