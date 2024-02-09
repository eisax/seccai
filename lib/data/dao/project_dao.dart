import 'package:floor/floor.dart';
import 'package:seccai/data/model/project_model.dart';
import 'package:seccai/data/model/user_model.dart';

@dao
abstract class ProjectDao {
  @Query('SELECT * FROM project')
  Future<List<ProjectModel>> findAllProjects();

  @Query('SELECT * FROM project WHERE id = :id')
  Future<ProjectModel?> findProjecById(String id);

  @insert
  Future<void> insertProject(ProjectModel project);
}
