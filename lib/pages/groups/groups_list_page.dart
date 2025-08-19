import 'package:flutter/material.dart';

import 'package:fonovoo/pages/base_page.dart';
import 'package:fonovoo/pages/components/groups_component.dart';
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
        title: Text("Grupos da sala"),
        actions: [
          ListenableBuilder(
            listenable: (presenter as GroupsListPresenter),
            builder: (pageContext, snapshot) {
              return IconButton(
                onPressed: () {
                  (presenter as GroupsListPresenter).changeSelectionMode();
                },
                icon: (presenter as GroupsListPresenter).isSelecting
                    ? Icon(Icons.list)
                    : Icon(Icons.check_box_sharp),
              );
            },
          ),
        ],
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
            listenable: (presenter as GroupsListPresenter),
            builder: (context, snapshot) {
              if ((presenter as GroupsListPresenter).load.running) {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.white),
                );
              }
              return ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: (presenter as GroupsListPresenter).groups.length,
                itemBuilder: (listContext, index) {
                  return GroupsComponent(
                    group: (presenter as GroupsListPresenter).groups[index],
                    isSelecting: (presenter as GroupsListPresenter).isSelecting,
                    goToEditPage: () {
                      (presenter as GroupsListPresenter).editClassroom(index);
                    },
                    goToClassesPage: () {},
                    students: (presenter as GroupsListPresenter).students,
                    removeStudentFromGroup: () {},
                  );
                },
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          (presenter as GroupsListPresenter).startGame();
        },
        tooltip: 'Jogar',
        child: const Icon(Icons.play_arrow),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
