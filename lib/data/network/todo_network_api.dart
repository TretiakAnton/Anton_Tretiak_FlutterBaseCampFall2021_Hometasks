import 'package:campnotes/data/network/network.dart';

abstract class TodoNetworkApi {
  Future<TodoNetworkModel> getTodoById(String id);
  Future<List<TodoNetworkModel>> getAllTodos();
  Future<List<TodoNetworkModel>> getActiveTodos();
  Future<List<TodoNetworkModel>> getCompletedTodos();

  Future<bool> removeTodoById(String id);
  Future<bool> removeTodosByIds(List<String> ids);
  Future<bool> saveItem(TodoNetworkModel todo);
}