import 'package:flutter/material.dart';

import 'package:fonovoo/pages/base_page.dart';
import 'package:fonovoo/pages/components/students_component.dart';
import 'package:fonovoo/pages/students/presenters/students_list_presenter.dart';

class StudentsListPage extends BasePage {
  StudentsListPage({super.key, required super.presenter, super.title});

  @override
  Widget build(BuildContext context) {
    (super.presenter as StudentsListPresenter).updateDto(
      ModalRoute.of(context)!.settings.arguments,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Text(
          (presenter as StudentsListPresenter).classroomEntity == null
              ? "Meus alunos"
              : (presenter as StudentsListPresenter).classroomEntity!.getName(),
        ),
        //leading: IconButton(onPressed: () => {}, icon: Icon(Icons.arrow_back)),
      ),
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment(0.8, 1),
              colors: <Color>[
                Color.fromRGBO(78, 157, 30, 1),
                Color.fromRGBO(88, 167, 40, 1),
                Color.fromRGBO(118, 197, 70, 1),
              ], // Gradient from,
            ),
          ),
          width: MediaQuery.of(context).size.width,
          child: ListenableBuilder(
            listenable: (presenter as StudentsListPresenter).load,
            builder: (context, snapshot) {
              if ((presenter as StudentsListPresenter).load.running) {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.white),
                );
              }
              return ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: (presenter as StudentsListPresenter).students.length,
                itemBuilder: (listContext, index) {
                  return StudentsComponent(
                    schoolName: (presenter as StudentsListPresenter)
                        .students[index]
                        .getName(),
                    goToClassesPage: () {
                      (presenter as StudentsListPresenter).goToGroupsPage(
                        index,
                      );
                    },
                    goToEditPage: () {
                      (presenter as StudentsListPresenter).editStudent(index);
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          (presenter as StudentsListPresenter).addStudent();
        },
        tooltip: 'Adicionar nova escola',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
