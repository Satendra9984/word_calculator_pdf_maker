import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import '../../database/note_model.dart';
import '../../database/notes_database.dart';
import '../../custom_widgets/note_card_list.dart';

class NotesListView extends StatelessWidget {
  NotesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Provider.of<NotesDao>(context).watchAllNotes(),
      builder: (context, AsyncSnapshot<List<NotesTableData>> snapshot) {
        List<NotesTableData>? notes = snapshot.data;

        if (notes != null) {
          return Column(
            children: notes.map(
              (e) {
                return NoteCardList(
                  note: Notes(
                      id: e.id,
                      title: e.title,
                      description: e.desc,
                      date: e.date!),
                );
              },
            ).toList(),
          );
        }

        return const Center(
          child: Text('NO NOTES'),
        );
      },
    );
  }
}
