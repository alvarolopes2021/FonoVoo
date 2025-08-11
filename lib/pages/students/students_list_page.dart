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
    (super.presenter as StudentsListPresenter).load();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        actions: [
          IconButton(
            onPressed: () {
              (presenter as StudentsListPresenter).changeSelectionMode();
            },
            icon: Icon(Icons.group),
          ),
        ],
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
            listenable: (presenter as StudentsListPresenter),
            builder: (context, snapshot) {
              if ((presenter as StudentsListPresenter).isLoading) {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.white),
                );
              }
              return ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: (presenter as StudentsListPresenter).students.length,
                itemBuilder: (listContext, index) {
                  return StudentsComponent(
                    isSelected:
                        (presenter as StudentsListPresenter).isSelecting,
                    schoolName: (presenter as StudentsListPresenter)
                        .students[index]
                        .getName(),
                    goToClassesPage: () {},
                    goToEditPage: () {},
                  );
                },
              );
            },
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "add",
            onPressed: () async {
              (presenter as StudentsListPresenter).addStudent();
            },
            tooltip: 'Adicionar nova escola',
            child: const Icon(Icons.add),
          ), // This trailing comma makes auto-formatting nicer for build methods.

          SizedBox(height: 10),
          FloatingActionButton(
            heroTag: "start",
            onPressed: () async {
              (presenter as StudentsListPresenter).addStudent();
            },
            tooltip: 'Adicionar nova escola',
            child: const Icon(Icons.play_arrow),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ],
      ),
    );
  }
}
