import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:word_calculator_pdf_maker/screens/note_pages/notes_details_screen.dart';
import 'package:word_calculator_pdf_maker/screens/note_pages/notes_list_view.dart';
import 'package:word_calculator_pdf_maker/screens/note_pages/search_notes.dart';
import 'notes_list.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  bool _isListView = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Card(
          elevation: 0,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              'Notes',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => const SearchNote(),
              ),
            ),
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () => Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (context) =>
                    const NotesDetailScreen(barTitle: 'Add Note'),
              ),
            ),
            icon: const Icon(
              Icons.add,
              color: Colors.black,
            ),
          ),
          PopupMenuButton(
            // iconSize: 1,
            elevation: 30,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: CupertinoColors.white,
            icon: const Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: IconButton(
                      icon: const Icon(
                        Icons.grid_view,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          _isListView = false;
                        });
                      }),
                ),
                PopupMenuItem(
                  textStyle: const TextStyle(),
                  child: IconButton(
                    icon: const Icon(
                      Icons.list,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        _isListView = true;
                      });
                    },

                    // title: Text(
                    //   'Grid View',
                    //   style: TextStyle(
                    //     color: Colors.black,
                    //   ),
                    // ),
                  ),
                ),
              ].toList();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            // THIS IS THE NOTES LIST
            // NotesListStaggered(),
            _isListView ? NotesListView() : NotesListStaggered(),
          ],
        ),
      ),
    );
  }
}
