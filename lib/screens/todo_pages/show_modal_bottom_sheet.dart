import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_calculator_pdf_maker/database/notes_database.dart';

class AddTask extends StatefulWidget {
  AddTask({Key? key}) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  String? task = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff757575),
      child: Container(
        padding: const EdgeInsets.all(18.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextField(
              textAlign: TextAlign.center,
              decoration: const InputDecoration(),
              onChanged: (value) {
                task = value;
              },
            ),
            ElevatedButton(
              onPressed: () {
                // Todo: add task in db
                if (task != null) {
                  Provider.of<TodoDao>(context, listen: false).insertTodo(
                    ToDoCompanion(
                      task: Value(task!),
                      date: Value(DateTime.now()),
                      isCompleted: Value(false),
                    ),
                  );
                }

                Navigator.pop(context);
              },
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
