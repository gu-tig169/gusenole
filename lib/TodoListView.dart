import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'EditTodoView.dart';
import 'TodoList.dart';
import 'model.dart';

class TodoListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "TIG169 TODO",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          PopupMenuButton(
              onSelected: (value) {
                Provider.of<MyState>(context, listen: false)
                    .filterTodoModel(value);
              },
              itemBuilder: (context) => [
                    PopupMenuItem(child: Text('All'), value: 'All'),
                    PopupMenuItem(child: Text('Done'), value: 'Done'),
                    PopupMenuItem(child: Text('Undone'), value: 'Undone'),
                  ]),
        ],
      ),
      body: Consumer<MyState>(
        builder: (context, state, child) =>
            TodoList(_filter(state.list, state.filterValue)),
      ),
      floatingActionButton: _addTodoButton(context),
    );
  }

  List<TodoModel> _filter(list, filterValue) {
    if (filterValue == "Done") {
      return list.where((todo) => todo.done == true).toList();
    } else if (filterValue == "Undone") {
      return list.where((todo) => todo.done == false).toList();
    }
    return list;
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
