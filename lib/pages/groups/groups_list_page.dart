import 'package:flutter/material.dart';

import 'package:fonovoo/pages/base_page.dart';
import 'package:fonovoo/pages/components/classrooms_component.dart';
import 'package:fonovoo/pages/groups/presenters/groups_list_presenter.dart';

class GroupsListPage extends BasePage {
  GroupsListPage({super.key, required super.presenter});

  @override
  Widget build(BuildContext context) {
    (super.presenter as GroupsListPresenter).updateDto(
      ModalRoute.of(context)!.settings.arguments,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Text(
          (presenter as GroupsListPresenter).schoolEntity == null
              ? "Grupos da sala"
              : (presenter as GroupsListPresenter).schoolEntity!.getName(),
        ),
      ),
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment(0.8, 1),
              colors: <Color>[
                Color.fromRGBO(249, 190, 8, 1),
                Color.fromRGBO(249, 200, 18, 1),
                Color.fromRGBO(249, 210, 28, 1),
              ], // Gradient from,
            ),
          ),
          width: MediaQuery.of(context).size.width,
          child: ListenableBuilder(
            listenable: (presenter as GroupsListPresenter).load,
            builder: (context, snapshot) {
              if ((presenter as GroupsListPresenter).load.running) {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.white),
                );
              }
              return ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: (presenter as GroupsListPresenter).classrooms.length,
                itemBuilder: (listContext, index) {
                  return ClassroomsComponent(
                    classroomName: (presenter as GroupsListPresenter)
                        .classrooms[index]
                        .getName(),
                    goToStudentsPage: () {
                      (presenter as GroupsListPresenter).goToStudentssPage(
                        index,
                      );
                    },
                    goToEditPage: () {
                      (presenter as GroupsListPresenter).editClassroom(index);
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          (presenter as GroupsListPresenter).addClassroom();
        },
        tooltip: 'Adicionar nova sala de aula',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
