import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';

import 'Api.dart';

TodoModel todoModelFromJson(String str) => TodoModel.fromJson(json.decode(str));

String todoModelToJson(TodoModel data) => json.encode(data.toJson());

class TodoModel {
  TodoModel({
    this.id,
    this.title,
    this.done = false,
  });

  String id;
  String title;
  bool done;

  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
        id: json["id"],
        title: json["title"],
        done: json["done"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "done": done,
      };
}

class MyState extends ChangeNotifier {
  List<TodoModel> _list = [];
  List<TodoModel> get list => _list;

  String _filterBy = 'All';
  String get filterBy => _filterBy;

  Future getTodoModel() async {
    List<TodoModel> list = await Api.getTodoModel();
    _list = list;
    print(list);
    notifyListeners();
  }

  void addTodoModel(TodoModel todo) async {
    _list.add(todo);
    await Api.addTodoModel(todo);
    await getTodoModel();
  }

  void setDoneTodoModel(TodoModel todo, bool done) async {
    todo.done = done;
    await Api.updateTodo(todo, todo.id);
    await getTodoModel();
  }

  void removeTodoModel(TodoModel todo) async {
    await Api.removeTodoModel(todo.id);
    await getTodoModel();
  }

  void setFilterBy(String filterBy) {
    this._filterBy = filterBy;
    notifyListeners();
  }
}
