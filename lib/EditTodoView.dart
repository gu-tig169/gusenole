import 'package:flutter/material.dart';

import 'model.dart';

class EditTodoView extends StatefulWidget {
  final TodoModel todo;

  EditTodoView(this.todo);

  @override
  State<StatefulWidget> createState() {
    return EditTodoViewState(todo);
  }
}

class EditTodoViewState extends State<EditTodoView> {
  String title;

  TextEditingController textEditingController;

  EditTodoViewState(TodoModel todo) {
    this.title = todo.title;

    textEditingController = TextEditingController(text: todo.title);

    textEditingController.addListener(() {
      setState(() {
        title = textEditingController.text;
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        centerTitle: true,
        title: Text(
          "Create a Todo",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            textField(),
            saveTodo(),
          ],
        ),
      ),
    );
  }

  Widget textField() {
    return Container(
      padding: EdgeInsets.all(24),
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
          hintText: 'What are you going to do?',
          enabledBorder: const OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black, width: 2),
          ),
        ),
      ),
    );
  }

  Widget saveTodo() {
    return Column(
      children: [
        FlatButton.icon(
          onPressed: () {
            Navigator.pop(context, TodoModel(title: title));
          },
          icon: Icon(Icons.add),
          label: Text(
            'Add',
            style: TextStyle(fontSize: 16),
          ),
        )
      ],
    );
  }
}
