import 'package:flutter/material.dart';
import 'package:fonovoo/domain/dtos/group_dto.dart';

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
              if ((presenter as GroupsListPresenter).isSelecting) {
                return IconButton(
                  onPressed: () {
                    (presenter as GroupsListPresenter).changeSelectionMode();
                  },
                  icon: Icon(Icons.cancel),
                );
              }
              return Text("");
            },
          ),
        ],
      ),
      body: Container(
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
              itemCount:
                  (presenter as GroupsListPresenter).studentsByGroup.length,
              itemBuilder: (listContext, index) {
                GroupDto group =
                    (presenter as GroupsListPresenter).groups[index];
                return GroupsComponent(
                  group: group,
                  isSelecting: (presenter as GroupsListPresenter).isSelecting,
                  students: (presenter as GroupsListPresenter)
                      .studentsByGroup[group.getId()]!,
                  removeStudentFromGroup: () {},
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: ListenableBuilder(
        listenable: (presenter as GroupsListPresenter),
        builder: (pageContext, snapshot) {
          return FloatingActionButton(
            onPressed: () {
              if ((presenter as GroupsListPresenter).isSelecting) {
                (presenter as GroupsListPresenter).goToGamePage();
                return;
              }

              (presenter as GroupsListPresenter).changeSelectionMode();
            },
            tooltip: 'Jogar',
            child: (presenter as GroupsListPresenter).isSelecting
                ? const Icon(Icons.check)
                : const Icon(Icons.play_arrow),
          );
        },
      ),
    );
  }
}
