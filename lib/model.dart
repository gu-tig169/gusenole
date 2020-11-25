import 'package:flutter/material.dart';

class Todo {
  String todoText;
  bool completed;

  Todo({this.todoText, this.completed = false});
}

class MyState extends ChangeNotifier {
  //flitered _list
  //kolla vilka filter som är satt
  List<Todo> _list = [];

  List<Todo> get list => _list;

  void addTodo(Todo todo) {
    _list.add(todo);
    notifyListeners();
  }

  void setCompletedTodo(Todo todo, bool completed) {
    var index = _list.indexWhere((listTodo) => listTodo == todo);
    _list[index].completed = completed;
    notifyListeners();
  }

  void removeTodo(Todo todo) {
    _list.remove(todo);
    notifyListeners();
  }

  List<Todo> filter(String filterAlternatives) {
    if (filterAlternatives == "Done") {
      return _list.where((todo) => todo.completed == true).toList();
    } else if (filterAlternatives == "Undone") {
      return _list.where((todo) => todo.completed == false).toList();
    }
    return _list;
  }
}
