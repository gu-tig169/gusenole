import 'package:flutter/material.dart';
import 'model.dart';
import 'TodoListView.dart';
import 'package:provider/provider.dart';

void main() {
  var state = MyState();
  state.getTodoModel();

  runApp(
    ChangeNotifierProvider(
      create: (context) => state,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo TIG169',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TodoListView(),
    );
  }
}
