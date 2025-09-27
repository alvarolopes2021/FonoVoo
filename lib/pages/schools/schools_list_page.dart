import 'package:flutter/material.dart';
import 'package:fonovoo/core/factories/make_app_version_factory.dart';

import 'package:fonovoo/pages/base_page.dart';
import 'package:fonovoo/pages/components/alert_dialog_component.dart';
import 'package:fonovoo/pages/components/center_message_with_icon_component.dart';
import 'package:fonovoo/pages/components/schools_component.dart';
import 'package:fonovoo/pages/schools/presenters/schools_list_presenter.dart';

class SchoolsListPage extends BasePage {
  SchoolsListPage({super.key, required super.presenter, super.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Text(title!),
        actions: [
          IconButton(
            onPressed: () => {
              showDialog<void>(
                context: context,
                barrierDismissible: false, // User must tap a button to dismiss
                builder: (BuildContext dialogContext) {
                  return AlertDialogComponent(
                    pageContext: context,
                    title: 'Informações',
                    message: 'Versão: ${makeAppVersionFactory.getVersion()}.${makeAppVersionFactory.getBuildNumber()} \nDesenvolvido por: Álvaro Lopes\nContato: (35) 9 9996-4469',
                    okText: 'Ok',
                    icon: Text(""),
                  );
                },
              ),
            },
            icon: Icon(Icons.info),
          ),
        ],
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
          listenable: (presenter as SchoolsListPresenter),
          builder: (context, snapshot) {
            if ((presenter as SchoolsListPresenter).load.running) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.white),
              );
            }
            if ((presenter as SchoolsListPresenter).schools.isEmpty) {
              return CenterMessageWithIconComponent(
                message: "Adicione uma escola para começar",
                icon: Icon(Icons.emoji_emotions, color: Colors.white),
              );
            }
            return ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: (presenter as SchoolsListPresenter).schools.length,
              itemBuilder: (listContext, index) {
                return SchoolsComponent(
                  schoolName: (presenter as SchoolsListPresenter)
                      .schools[index]!
                      .getName(),
                  goToClassesPage: () {
                    (presenter as SchoolsListPresenter).goToClassroomsPage(
                      index,
                    );
                  },
                  goToEditPage: () {
                    (presenter as SchoolsListPresenter).editSchool(index);
                  },
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          (presenter as SchoolsListPresenter).addSchool();
        },
        tooltip: 'Adicionar nova escola',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
