import 'package:campnotes/data/models/todo.dart';
import 'package:campnotes/data/repositories/todo_repository.dart';

class TodoInMemoryRepository implements TodoRepository {
  TodoInMemoryRepository({List<Todo> initialTodos = const <Todo>[]})
      : _todos = initialTodos;

  final List<Todo> _todos;

  @override
  Future<Todo> getItemById(String id) async {
    return _todos.firstWhere((todo) => todo.id == id);
  }

  @override
  Future<List<Todo>> getAllItems() => Future.value(List.from(_todos));

  @override
  Future<void> removeItemById(String id) async {
    _todos.removeWhere((todo) => todo.id == id);
  }

  @override
  Future<void> removeItemsByIds(List<String> ids) async {
    _todos.removeWhere((todo) => ids.contains(todo.id));
  }

  @override
  Future<void> updateItem(Todo todo) async {
    final todoFromStorageIndex =
        _todos.indexWhere((storageTodo) => storageTodo.id == todo.id);
    if (todoFromStorageIndex != -1) {
      _todos[todoFromStorageIndex] = todo;
    }
  }

  @override
  Future<void> createItem(Todo todo) async {
    _todos.add(todo);
  }

  @override
  Future<List<Todo>> getActiveTodos() => Future.value(
        _todos.where((todo) => todo.complete == false).toList(),
      );

  @override
  Future<List<Todo>> getCompletedTodos() => Future.value(
        _todos.where((todo) => todo.complete == true).toList(),
      );
}
