import 'package:campnotes/data/models/todo.dart';

abstract class TodoRepository {
  Future<Todo> getItemById(String id);
  Future<List<Todo>> getAllItems();

  Future<void> removeItemById(String id);
  Future<void> removeItemsByIds(List<String> ids);
  Future<void> updateItem(Todo todo);
  Future<void> createItem(Todo todo);

  Future<List<Todo>> getActiveTodos();
  Future<List<Todo>> getCompletedTodos();
}