import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'model.dart';

const API_URL = 'https://todoapp-api-vldfm.ondigitalocean.app';
const API_KEY = '13978a5c-7f81-4f2c-ad3e-f871278553ec';

class Api {
  static Future addTodoModel(TodoModel todo) async {
    var json = todo.toJson();
    var bodyString = jsonEncode(json);

    await http.post('$API_URL/todos?key=$API_KEY',
        body: bodyString, headers: {'Content-Type': 'application/json'});
  }

  static Future updateTodo(TodoModel todo, todoId) async {
    var json = todo.toJson();
    var bodyString = jsonEncode(json);

    await http.put('$API_URL/todos/$todoId?key=$API_KEY',
        body: bodyString, headers: {'Content-Type': 'application/json'});
  }

  static Future removeTodoModel(String todoId) async {
    await http.delete('$API_URL/todos/$todoId?key=$API_KEY');
  }

  static Future<List<TodoModel>> getTodoModel() async {
    var response = await http.get('$API_URL/todos?key=$API_KEY');
    var json = jsonDecode(response.body);
    return json.map<TodoModel>((data) {
      return TodoModel.fromJson(data);
    }).toList();
  }
}
