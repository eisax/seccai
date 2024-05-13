import 'package:floor/floor.dart';
import 'package:seccai/data/model/task_model.dart';

@dao
abstract class TaskDao {
  @Query('SELECT * FROM task')
  Future<List<Task>> findAllTasks();

  @Query('SELECT * FROM task WHERE id = :id')
  Future<Task?> findTaskById(String id);

  @insert
  Future<void> insertTask(Task task);

  @update
  Future<void> updateTask(Task task);
}
