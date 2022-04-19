import 'package:flutter/material.dart';
import 'package:word_calculator_pdf_maker/screens/note_pages/notes_screen.dart';
import 'package:word_calculator_pdf_maker/screens/todo_pages/task_screen.dart';
import 'package:provider/provider.dart';
import '../database/notes_database.dart';
import 'calculator_pages/calculator_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  late List<Widget> _screen;
  int currentScreen = 0;

  @override
  void didChangeDependencies() {
    _screen = [
      NotesScreen(),
      CalculatorScreen(),
      TaskScreen(),
    ];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          children: _screen,
          onPageChanged: (currentPage) {
            setState(
              () {
                currentScreen = currentPage;
              },
            );
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 11,
          currentIndex: currentScreen,
          // backgroundColor: Colors.black,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.notes,
                color: Colors.black,
              ),
              label: 'Notes',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.calculate,
                color: Colors.black,
              ),
              label: 'calculator',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.task,
                color: Colors.black,
              ),
              label: 'todo',
            ),
          ],
          onTap: (itemNo) {
            setState(() {
              _pageController.jumpToPage(itemNo);
            });
          },
        ),
      ),
    );
  }
}
