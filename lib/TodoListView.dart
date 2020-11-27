import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'EditTodoView.dart';
import 'TodoList.dart';
import 'model.dart';

class TodoListView extends StatefulWidget {
  @override
  _TodoListViewState createState() => _TodoListViewState();
}

class _TodoListViewState extends State<TodoListView> {
  final List<String> filteredAlternatives = ['All', 'Done', 'Undone'];
  String filterValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "TIG169 TODO",
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          _todoFilter(),
        ],
      ),
      body: Consumer<MyState>(
        builder: (context, state, child) => TodoList(state.filter(filterValue)),
      ),
      floatingActionButton: _addTodoButton(context),
    );
  }

  Widget _todoFilter() {
    return PopupMenuButton<String>(
      onSelected: (String value) {
        setState(() {
          filterValue = value;
        });
      },
      itemBuilder: (BuildContext context) {
        return filteredAlternatives
            .map((filterAlternatives) => PopupMenuItem(
                value: filterAlternatives, child: Text(filterAlternatives)))
            .toList();
      },
      icon: Icon(Icons.more_vert, size: 20, color: Colors.black),
    );
  }

  Widget _addTodoButton(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: (Colors.grey),
        child: Icon(Icons.add),
        onPressed: () async {
          var newTodo = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EditTodoView(
                      TodoModel(
                        title: '',
                      ),
                    )),
          );
          if (newTodo != null) {
            Provider.of<MyState>(context, listen: false).addTodoModel(newTodo);
          }
        });
  }
}
