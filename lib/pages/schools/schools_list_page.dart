import 'package:flutter/material.dart';

import 'package:fonovoo/application/usacases/schools/factories/make_schools_usecase_factory.dart';
import 'package:fonovoo/application/usacases/usecase.dart';
import 'package:fonovoo/pages/base_page.dart';
import 'package:fonovoo/pages/components/classrooms_component.dart';

class SchoolsListPage extends BasePage {
  SchoolsListPage({super.key, super.title});

  @override
  State<SchoolsListPage> createState() => _SchoolsListPageState();
}

class _SchoolsListPageState extends State<SchoolsListPage> {
  UseCase? addSchoolsUsecase;

  @override
  void initState() {
    addSchoolsUsecase = makeAddSchoolsUsecaseFactory;

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
        //leading: IconButton(onPressed: () => {}, icon: Icon(Icons.arrow_back)),
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
              ClassroomsComponent(schoolName: "Colégio São José"),
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
