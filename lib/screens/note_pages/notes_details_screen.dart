import 'package:drift/drift.dart' hide Column;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_calculator_pdf_maker/database/note_model.dart';
import '../../database/notes_database.dart';

class NotesDetailScreen extends StatefulWidget {
  final String barTitle;
  const NotesDetailScreen({
    Key? key,
    required this.barTitle,
  }) : super(key: key);

  @override
  State<NotesDetailScreen> createState() => _NotesDetailScreenState();
}

class _NotesDetailScreenState extends State<NotesDetailScreen> {
  final FocusNode _focusNode = FocusNode();
  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  Notes _note = Notes(
    id: -1,
    title: '',
    description: '',
    date: DateTime.now(),
  );
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    if (widget.barTitle == 'Editing') {
      Notes notes = ModalRoute.of(context)?.settings.arguments as Notes;

      _note = Notes(
        id: notes.id,
        description: notes.description,
        title: notes.title,
        date: notes.date,
      );
    }
    super.didChangeDependencies();
  }

  void _deleteForm() async {
    //TODO: IMPLEMENT DELETE NOTES LOGIC
    try {
      Provider.of<NotesDao>(context, listen: false).deleteNote(
        NotesTableCompanion(
          id: Value(_note.id),
          title: Value(_note.title),
          desc: Value(_note.description),
          date: Value(_note.date),
        ),
      );
    } catch (e) {
      // print(e);
      // Navigator.of(context).pop();
    } finally {
      Navigator.of(context).pop();
    }
  }

  void _saveForm() async {
    var isValid = _form.currentState?.validate();
    if (isValid == null) {
      return;
    }
    _form.currentState!.save();
    if (widget.barTitle == 'Editing') {
      await Provider.of<NotesDao>(context, listen: false).updateNote(
        NotesTableCompanion(
          id: Value(_note.id),
          title: Value(_note.title),
          desc: Value(_note.description),
          date: Value(_note.date),
        ),
      );
    } else {
      await Provider.of<NotesDao>(context, listen: false).insertNote(
        NotesTableCompanion(
          title: Value(_note.title),
          desc: Value(_note.description),
          date: Value(_note.date),
        ),
      );
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.barTitle),
        actions: [
          IconButton(
            onPressed: _saveForm,
            icon: const Icon(
              Icons.check,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: _deleteForm,
            icon: const Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Form(
          key: _form,
          child: Column(
            children: [
              TextFormField(
                autovalidateMode: AutovalidateMode.always,
                initialValue: _note.title,
                decoration: const InputDecoration(
                  label: Text(
                    'Title',
                    style: TextStyle(
                        // fontSize: 20,
                        ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(18),
                    ),
                  ),
                ),
                validator: (val) {
                  if (val == null) {
                    return "Enter title";
                  }
                  return null;
                },
                onSaved: (val) {
                  if (val != null) {
                    _note = Notes(
                      id: _note.id,
                      title: val,
                      description: _note.description,
                      date: _note.date,
                    );
                  }
                },
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_focusNode);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                initialValue: _note.description,
                focusNode: _focusNode,
                maxLines: 5,
                decoration: const InputDecoration(
                  label: Text(
                    'Description',
                    style: TextStyle(),
                    maxLines: 10,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(18),
                    ),
                  ),
                ),
                keyboardType: TextInputType.multiline,
                validator: (val) {
                  if (val == null) {
                    return "Enter title";
                  }
                  return null;
                },
                onSaved: (val) {
                  if (val != null) {
                    _note = Notes(
                      title: _note.title,
                      description: val,
                      date: _note.date,
                      id: _note.id,
                    );
                  }
                },
                onFieldSubmitted: (_) {
                  _saveForm();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
