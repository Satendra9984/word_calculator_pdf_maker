import 'package:flutter/material.dart';
import 'package:word_calculator_pdf_maker/screens/home_screen.dart';

import 'database/notes_database.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    Provider<MyDatabase>(
      create: (context) => MyDatabase(),
      child: MyApp(),
      dispose: (context, db) => db.close(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
            create: (_) =>
                Provider.of<MyDatabase>(context, listen: false).notesDao),
        Provider(
            create: (_) =>
                Provider.of<MyDatabase>(context, listen: false).todoDao),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
