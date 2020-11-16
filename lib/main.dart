import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainView(),
    );
  }
}

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        centerTitle: true,
        title: Text(
          "TIG169 TODO",
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          _todoFilter(),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            _todoItem('vakna'),
            _todoItem('plugga inlämning'),
            _todoItem('lämna in'),
            _todoItem('gå och lägga mig igen'),
          ],
        ),
      ),
      floatingActionButton: _addButton(context),
    );
  }

  Widget _todoFilter() {
    return PopupMenuButton<String>(
      itemBuilder: (context) => [
        PopupMenuItem(
          child: Text("All"),
        ),
        PopupMenuItem(
          child: Text("Done"),
        ),
        PopupMenuItem(
          child: Text("Undone"),
        ),
      ],
      icon: Icon(Icons.more_vert, size: 20, color: Colors.black),
    );
  }

  Widget _todoItem(String text) {
    return Row(
      children: [
        Checkbox(
          value: false,
          onChanged: (val) {},
        ),
        Expanded(
          flex: 5,
          child: Text(
            text,
            style: TextStyle(fontSize: 14),
          ),
        ),
        Expanded(
          flex: 1,
          child: IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  Widget _addButton(BuildContext context) {
    return FloatingActionButton(
      elevation: 0.0,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SecondView()),
        );
      },
      backgroundColor: (Colors.grey),
      child: Icon(
        Icons.add,
        size: 50,
      ),
    );
  }
}

class SecondView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        centerTitle: true,
        title: Text(
          "TIG169 TODO",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            _textField(),
            _addButton(),
          ],
        ),
      ),
    );
  }

  Widget _textField() {
    return Container(
      padding: EdgeInsets.all(24),
      child: TextField(
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black, width: 2),
            ),
            hintText: "What are you going to do?"),
      ),
    );
  }

  Widget _addButton() {
    return Column(
      children: [
        FlatButton.icon(
          onPressed: () {},
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
