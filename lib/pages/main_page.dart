import 'package:flutter/material.dart';
import 'package:fonovoo/pages/classes/classes_list_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Color.fromRGBO(0, 90, 152, 1),
          foregroundColor: Colors.white,
          centerTitle: true
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromRGBO(0, 90, 152, 1),
        ),
      ),
      initialRoute: "/",
      routes: {'/': (context) => const ClassesListPage(title: 'Minhas escolas')},
    );
  }
}
