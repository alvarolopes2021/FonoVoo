import 'package:flutter/material.dart';
import 'package:fonovoo/pages/classrooms/classroom_detail_page.dart';
import 'package:fonovoo/pages/classrooms/classrooms_list_page.dart';
import 'package:fonovoo/pages/classrooms/presenters/classroom_detail_presenter.dart';
import 'package:fonovoo/pages/classrooms/presenters/classrooms_list_presenter.dart';
import 'package:fonovoo/pages/game/game_page.dart';
import 'package:fonovoo/pages/game/presenters/game_page_presenter.dart';
import 'package:fonovoo/pages/groups/groups_detail_page.dart';
import 'package:fonovoo/pages/groups/groups_list_page.dart';
import 'package:fonovoo/pages/groups/presenters/groups_detail_presenter.dart';
import 'package:fonovoo/pages/groups/presenters/groups_list_presenter.dart';
import 'package:fonovoo/pages/schools/presenters/schools_detail_presenter.dart';
import 'package:fonovoo/pages/schools/presenters/schools_list_presenter.dart';
import 'package:fonovoo/pages/schools/schools_detail_page.dart';
import 'package:fonovoo/pages/schools/schools_list_page.dart';
import 'package:fonovoo/pages/students/presenters/students_detail_presenter.dart';
import 'package:fonovoo/pages/students/presenters/students_list_presenter.dart';
import 'package:fonovoo/pages/students/students_detail_page.dart';
import 'package:fonovoo/pages/students/students_list_page.dart';

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
          centerTitle: true,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromRGBO(0, 90, 152, 1),
        ),
      ),
      initialRoute: SchoolsListPresenter.pageName,
      routes: {
        SchoolsListPresenter.pageName: (pageContext) => SchoolsListPage(
          title: 'Minhas escolas',
          presenter: SchoolsListPresenter(pageContext: pageContext),
        ),
        SchoolsDetailPresenter.pageName: (pageContext) => SchoolsDetailPage(
          presenter: SchoolsDetailPresenter(pageContext: pageContext),
        ),
        ClassroomsListPresenter.pageName: (pageContext) => ClassroomsListPage(
          presenter: ClassroomsListPresenter(pageContext: pageContext),
        ),
        ClassroomDetailPresenter.pageName: (pageContext) => ClassroomDetailPage(
          presenter: ClassroomDetailPresenter(pageContext: pageContext),
        ),
        StudentsListPresenter.pageName: (pageContext) => StudentsListPage(
          presenter: StudentsListPresenter(pageContext: pageContext),
        ),
        StudentsDetailPresenter.pageName: (pageContext) => StudentsDetailPage(
          presenter: StudentsDetailPresenter(pageContext: pageContext),
        ),
        GroupsListPresenter.pageName: (pageContext) => GroupsListPage(
          presenter: GroupsListPresenter(pageContext: pageContext),
        ),
        GroupsDetailPresenter.pageName: (pageContext) => GroupsDetailPage(
          presenter: GroupsDetailPresenter(pageContext: pageContext),
        ),
        GamePagePresenter.pageName: (pageContext) =>
            GamePage(presenter: GamePagePresenter(pageContext: pageContext)),
      },
    );
  }
}
