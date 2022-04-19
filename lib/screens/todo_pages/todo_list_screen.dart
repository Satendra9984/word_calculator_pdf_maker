import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_calculator_pdf_maker/database/notes_database.dart';

import 'ToDoElement.dart';

class ToDoListScreen extends StatelessWidget {
  const ToDoListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Provider.of<TodoDao>(context).watchTodo(),
      builder: (BuildContext context, AsyncSnapshot<List<ToDoData>> snapshot) {
        List<ToDoData>? todos = snapshot.data;
        print(todos);
        if (todos != null) {
          return Column(
            children: todos
                .map(
                  (e) => ToDoElement(element: e),
                )
                .toList(),
          );
        }

        return const Text('Nothing todo');
      },
    );
  }
}
