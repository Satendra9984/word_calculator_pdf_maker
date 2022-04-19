import 'dart:math';

import 'package:drift/drift.dart' hide Column;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_calculator_pdf_maker/screens/note_pages/notes_details_screen.dart';

import '../database/note_model.dart';
import '../database/notes_database.dart';

class NoteCard extends StatelessWidget {
  final Notes note;

  const NoteCard({Key? key, required this.note}) : super(key: key);

  Color getColour() {
    int rand = Random(note.id).nextInt(10);
    // int rand = note.id % s10;
    switch (rand) {
      case 0:
        return Colors.red.shade400;
      case 1:
        return Colors.orange;
      case 2:
        return Colors.green.shade400;
      case 3:
        return Colors.blue;
      case 4:
        return Colors.white;
      case 5:
        return Colors.yellow.shade600;
      case 6:
        return Colors.pink.shade100;
      case 7:
        return Colors.grey;
      case 8:
        return Colors.redAccent;
      case 9:
        return Colors.brown.shade300;
    }
    return Colors.brown.shade300;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //DO: NAVIGATE TO DETAILS PAGE
        Navigator.of(context).push(
          CupertinoPageRoute(
            builder: (context) => const NotesDetailScreen(
              barTitle: 'Editing',
            ),
            settings: RouteSettings(
              arguments: note,
            ),
          ),
        );
      },
      onLongPress: () async {
        //TODO: DELETE THIS ITEM
        await Provider.of<NotesDao>(context, listen: false).deleteNote(
          NotesTableCompanion(
            id: Value(note.id),
            title: Value(note.title),
            desc: Value(note.description),
            date: Value(note.date),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
        color: getColour(),
        elevation: 8,
        child: Container(
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.all(
          //     Radius.circular(300),
          //   ),
          // ),
          width: double.infinity,
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Text(
                note.title,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
                // softWrap: true,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                note.description,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
                // softWrap: true,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                note.date.toLocal().toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: CupertinoColors.white,
                ),
                // softWrap: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
