import 'package:flutter/material.dart';
import 'package:flutter_learn_provider/data/provider/list_provider.dart';
import 'package:flutter_learn_provider/data/provider/object_provider.dart';
import 'package:flutter_learn_provider/ui/list_screen.dart';
import 'package:flutter_learn_provider/ui/object_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ObjectProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ListProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: const MenuBottomBar(),
      ),
    );
  }
}

class MenuBottomBar extends StatefulWidget {
  const MenuBottomBar({super.key});

  @override
  State<MenuBottomBar> createState() => _MenuBottomBarState();
}

class _MenuBottomBarState extends State<MenuBottomBar> {
  int selectedIndex = 0;

  final List<Widget> _optionWidget = [
    const ObjectScreen(),
    const ListScreen(),
  ];

  void _selectIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Object"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "List"),
        ],
        onTap: _selectIndex,
      ),
      body: _optionWidget.elementAt(selectedIndex),
    );
  }
}
