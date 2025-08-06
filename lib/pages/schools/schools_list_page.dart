import 'package:flutter/material.dart';

import 'package:fonovoo/pages/base_page.dart';
import 'package:fonovoo/pages/components/schools_component.dart';
import 'package:fonovoo/pages/schools/presenters/schools_list_presenter.dart';

class SchoolsListPage extends BasePage {
  SchoolsListPage({super.key, required super.presenter, super.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Text(title!),
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
          child: ListenableBuilder(
            listenable: (presenter as SchoolsListPresenter).load,
            builder: (context, snapshot) {
              if ((presenter as SchoolsListPresenter).load.running) {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.white),
                );
              }
              return ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: (presenter as SchoolsListPresenter).schools.length,
                itemBuilder: (listContext, index) {
                  return SchoolsComponent(
                    schoolName: (presenter as SchoolsListPresenter)
                        .schools[index]
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
