import 'package:flutter/material.dart';
import 'package:fonovoo/application/usacases/usecase.dart';
import 'package:fonovoo/pages/base_page.dart';
import 'package:fonovoo/pages/components/schools_component.dart';

class ClassesListPage extends BasePage {
  UseCase? listClassroomsUsecase;

  ClassesListPage({required super.presenter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Text(title!),
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
              SchoolsComponent(schoolName: "CIEM De Fátima"),
              SchoolsComponent(schoolName: "CIEM De Fátima"),
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
