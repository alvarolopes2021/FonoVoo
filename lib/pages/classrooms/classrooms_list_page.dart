import 'package:flutter/material.dart';

import 'package:fonovoo/pages/base_page.dart';
import 'package:fonovoo/pages/classrooms/presenters/classrooms_list_presenter.dart';
import 'package:fonovoo/pages/components/center_message_with_smile_component.dart';
import 'package:fonovoo/pages/components/classrooms_component.dart';

class ClassroomsListPage extends BasePage {
  ClassroomsListPage({super.key, required super.presenter});

  @override
  Widget build(BuildContext context) {
    (super.presenter as ClassroomsListPresenter).updateDto(
      ModalRoute.of(context)!.settings.arguments,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Text(
          (presenter as ClassroomsListPresenter).schoolEntity == null
              ? "Minhas salas"
              : (presenter as ClassroomsListPresenter).schoolEntity!.getName(),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment(0.8, 1),
            colors: <Color>[
              Color.fromRGBO(250, 138, 10, 1),
              Color.fromRGBO(250, 158, 30, 1),
              Color.fromRGBO(250, 178, 50, 1),
            ], // Gradient from,
          ),
        ),
        child: ListenableBuilder(
          listenable: (presenter as ClassroomsListPresenter).load,
          builder: (context, snapshot) {
            if ((presenter as ClassroomsListPresenter).load.running) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.white),
              );
            }
            if ((presenter as ClassroomsListPresenter).classrooms.isEmpty) {
              return CenterMessageWithSmileComponent(
                message: "Adicione uma sala de aula para começar",
              );
            }
            return ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount:
                  (presenter as ClassroomsListPresenter).classrooms.length,
              itemBuilder: (listContext, index) {
                return ClassroomsComponent(
                  classroomEntity:
                      (presenter as ClassroomsListPresenter).classrooms[index],
                  goToStudentsPage: () {
                    (presenter as ClassroomsListPresenter).goToStudentssPage(
                      index,
                    );
                  },
                  goToEditPage: () {
                    (presenter as ClassroomsListPresenter).editClassroom(index);
                  },
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          (presenter as ClassroomsListPresenter).addClassroom();
        },
        tooltip: 'Adicionar nova sala de aula',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
