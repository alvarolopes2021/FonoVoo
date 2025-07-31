import 'package:flutter/material.dart';
import 'package:fonovoo/application/usacases/classes/factories/make_classrooms_usecase_factory.dart';
import 'package:fonovoo/application/usacases/usecase.dart';
import 'package:fonovoo/pages/base_page.dart';
import 'package:fonovoo/pages/components/classrooms_component.dart';

class ClassesListPage extends BasePage {
  ClassesListPage({super.key, super.title});

  @override
  State<ClassesListPage> createState() => _ClassesListPageState();
}

class _ClassesListPageState extends State<ClassesListPage> {
  UseCase? listClassroomsUsecase;

  @override
  void initState() {
    listClassroomsUsecase = makeListClassroomsUsecaseFactory;

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Text(widget.title!),
      ),
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment(0.8, 1),
              colors: <Color>[
                Color.fromRGBO(0, 90, 152, 1),
                Color.fromRGBO(0, 100, 162, 1),
                Color.fromRGBO(0, 110, 172, 1),
              ], // Gradient from,
            ),
          ),
          width: MediaQuery.of(context).size.width,
          child: ListView(
            children: [
              ClassroomsComponent(schoolName: "CIEM De Fátima"),
              ClassroomsComponent(schoolName: "CIEM De Fátima"),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        tooltip: 'Adicionar nova escola',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
