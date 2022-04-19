import 'package:flutter/material.dart';
import 'package:word_calculator_pdf_maker/database/notes_database.dart';
import 'package:word_calculator_pdf_maker/screens/todo_pages/show_modal_bottom_sheet.dart';
import 'package:word_calculator_pdf_maker/screens/todo_pages/todo_list_screen.dart';
import 'package:provider/provider.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ToDo'),
          actions: [
            IconButton(
              onPressed: () {
                // TODO: ADD TASK BOTTOM SHEET
                showModalBottomSheet(
                  context: context,
                  builder: (context) => SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: AddTask(),
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: ToDoListScreen(),
        ),
      ),
    );
  }
}
/*
* SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: const Text('ToDo'),
              actions: [
                IconButton(
                  onPressed: () {
                    // TODO: ADD TASK BOTTOM SHEET
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: AddTask(),
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(10),
              child: ToDoListScreen(),
            ),
          ),
        )
* */
