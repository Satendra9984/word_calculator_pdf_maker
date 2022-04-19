import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import '../../custom_widgets/note_card.dart';
import '../../custom_widgets/search_widget.dart';
import '../../database/note_model.dart';
import '../../database/notes_database.dart';

class SearchNote extends StatefulWidget {
  const SearchNote({Key? key}) : super(key: key);

  @override
  State<SearchNote> createState() => _SearchNoteState();
}

class _SearchNoteState extends State<SearchNote> {
  late List<NotesTableData> noteList, searchNoteList;
  bool isInit = false;

  String query = '';
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies

    super.didChangeDependencies();
  }

  @override
  void initState() {
    // TODO: implement initState
    initializeData();
    super.initState();
  }

  Future<void> initializeData() async {
    List<NotesTableData>? notes =
        await Provider.of<NotesDao>(context, listen: false).getAllNotes();
    noteList = notes;
    searchNoteList = noteList;
    setState(() {
      isInit = !isInit;
      print('data initialized--> ');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: CupertinoColors.activeGreen,
        title: const Text(
          'Search Notes',
          style: TextStyle(
            color: CupertinoColors.black,
          ),
        ),
      ),
      body: !isInit
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  SearchWidget(
                    text: query,
                    onChanged: (String val) {
                      final notes = noteList.where((element) {
                        final title = element.title.toLowerCase();
                        final desc = element.desc.toLowerCase();
                        final search = val.toLowerCase();

                        return title.contains(search) || desc.contains(search);
                      }).toList();
                      setState(() {
                        searchNoteList = notes;
                        print('search list changed--> ');
                        print(searchNoteList);
                      });
                    },
                    hintText: 'Enter title, description etc.,',

                    // hintText: 'Enter title, description',
                  ),
                  searchNoteList.isNotEmpty
                      ? StaggeredGrid.count(
                          crossAxisCount: 2,
                          crossAxisSpacing: 2.5,
                          mainAxisSpacing: 2.5,
                          children: searchNoteList.map(
                            (e) {
                              return NoteCard(
                                note: Notes(
                                    id: e.id,
                                    title: e.title,
                                    description: e.desc,
                                    date: e.date!),
                              );
                            },
                          ).toList(),
                        )
                      : const Text('?'),
                ],
              ),
            ),
    );
  }
}
