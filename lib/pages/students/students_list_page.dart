import 'package:flutter/material.dart';
import 'package:fonovoo/domain/dtos/group_dto.dart';
import 'package:grouped_list/grouped_list.dart';

import 'package:fonovoo/domain/dtos/students_dto.dart';
import 'package:fonovoo/pages/base_page.dart';
import 'package:fonovoo/pages/components/center_message_with_icon_component.dart';
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
        actions: [
          IconButton(
            onPressed: () {
              (presenter as StudentsListPresenter).orderAz();
            },
            icon: Icon(Icons.sort_by_alpha),
          ),
          ListenableBuilder(
            listenable: (presenter as StudentsListPresenter),
            builder: (context, snapshot) {
              return IconButton(
                onPressed: () {
                  (presenter as StudentsListPresenter).changeSelectionMode();
                },
                icon: (presenter as StudentsListPresenter).isSelecting
                    ? Icon(Icons.list)
                    : Icon(Icons.group),
              );
            },
          ),
        ],
        title: Text(
          (presenter as StudentsListPresenter).classroomEntity == null
              ? "Meus alunos"
              : (presenter as StudentsListPresenter).classroomEntity!.getName(),
        ),
        //leading: IconButton(onPressed: () => {}, icon: Icon(Icons.arrow_back)),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment(0.8, 1),
            colors: <Color>[
              Color.fromRGBO(60, 120, 172, 1),
              Color.fromRGBO(70, 130, 182, 1),
              Color.fromRGBO(80, 140, 192, 1),
            ], // Gradient from,
          ),
        ),
        child: ListenableBuilder(
          listenable: (presenter as StudentsListPresenter),
          builder: (context, snapshot) {
            if ((presenter as StudentsListPresenter).load.running) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.white),
              );
            }
            if ((presenter as StudentsListPresenter).studentsDto.isEmpty) {
              return CenterMessageWithIconComponent(
                message: "Adicione alunos e crie grupos",
                icon: Icon(Icons.emoji_emotions, color: Colors.white),
              );
            }
            return GroupedListView<StudentsDto, String>(
              padding: const EdgeInsets.all(8),
              elements: (presenter as StudentsListPresenter).studentsDto,
              groupBy: (student) => student.getGroupId()!,
              groupComparator: (value1, value2) => value2.compareTo(value1),

              order: GroupedListOrder.DESC,
              useStickyGroupSeparators: true,
              stickyHeaderBackgroundColor: Colors.transparent,
              groupSeparatorBuilder: (value) => Container(
                color: Colors.transparent,
                child: Text(
                  (presenter as StudentsListPresenter).groupsDto
                      .firstWhere(
                        (group) => group.getId() == value,
                        orElse: () => GroupDto("", "Sem grupo", ""),
                      )
                      .getName(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              itemBuilder: (c, element) {
                return StudentsComponent(
                  showCheckbox:
                      (presenter as StudentsListPresenter).isSelecting,
                  studentsDto: element,
                  goToStudentStatusPage: () {
                    (presenter as StudentsListPresenter).goToStudentStatusPage(
                      element,
                    );
                  },
                  goToEditPage: () {
                    (presenter as StudentsListPresenter).editStudent(
                      (presenter as StudentsListPresenter).studentsDto.indexOf(
                        element,
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: ListenableBuilder(
        listenable: (presenter as StudentsListPresenter),
        builder: (BuildContext context, Widget? child) {
          if ((presenter as StudentsListPresenter).isSelecting) {
            return FloatingActionButton(
              heroTag: "group",
              onPressed: () async {
                (presenter as StudentsListPresenter).makeGroup();
              },
              tooltip: 'Criar grupo',
              child: const Icon(Icons.group_add),
            );
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                heroTag: "add",
                onPressed: () async {
                  (presenter as StudentsListPresenter).addStudent();
                },
                tooltip: 'Adicionar novo aluno',
                child: const Icon(Icons.add),
              ), // This trailing comma makes auto-formatting nicer for build methods.

              SizedBox(height: 10),
              FloatingActionButton(
                heroTag: "next",
                onPressed: () async {
                  (presenter as StudentsListPresenter).goToGroupsPage();
                },
                tooltip: 'Próxima página',
                child: const Icon(Icons.navigate_next),
              ), // This trailing comma makes auto-formatting nicer for build methods.
            ],
          );
        },
      ),
    );
  }
}
