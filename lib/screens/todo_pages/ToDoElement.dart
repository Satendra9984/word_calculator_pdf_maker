import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:word_calculator_pdf_maker/database/notes_database.dart';
import 'package:provider/provider.dart';

class ToDoElement extends StatefulWidget {
  final ToDoData element;
  ToDoElement({Key? key, required this.element}) : super(key: key);

  @override
  State<ToDoElement> createState() => _ToDoElementState();
}

class _ToDoElementState extends State<ToDoElement> {
  bool isCheck = false;
  @override
  void initState() {
    // TODO: implement initState
    isCheck = widget.element.isCompleted;
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // Provider.of<TodoDao>(context, listen: false).updateTodo(
    //   ToDoCompanion(
    //     id: Value(widget.element.id),
    //     task: Value(widget.element.task),
    //     isCompleted: Value(isCheck),
    //     date: Value(widget.element.date),
    //   ),
    // );
    print('disposed--> ');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        Provider.of<TodoDao>(context, listen: false).deleteTodo(
          ToDoCompanion(
            id: Value(widget.element.id),
            task: Value(widget.element.task),
            // isCompleted: Value(isCheck),
            date: Value(widget.element.date),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 8,
              child: Text(
                widget.element.task.toString(),
                style: TextStyle(
                  decoration: widget.element.isCompleted
                      ? TextDecoration.lineThrough
                      : null,
                  fontSize: 18,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Checkbox(
                value: isCheck,
                onChanged: (bool? value) async {
                  // TODO: IMPLEMENT TOGGLE
                  setState(() {
                    isCheck = !isCheck;
                  });
                  await Provider.of<TodoDao>(context, listen: false).updateTodo(
                    ToDoCompanion(
                      id: Value(widget.element.id),
                      task: Value(widget.element.task),
                      isCompleted: Value(isCheck),
                      date: Value(widget.element.date),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
