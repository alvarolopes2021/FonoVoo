import 'package:flutter/material.dart';

import 'package:fonovoo/pages/base_page.dart';
import 'package:fonovoo/pages/classrooms/presenters/classroom_detail_presenter.dart';
import 'package:fonovoo/pages/components/confim_dialog_component.dart';
import 'package:fonovoo/pages/components/my_text_form_field.dart';

class ClassroomDetailPage extends BasePage {
  final formKey = GlobalKey<FormState>();

  ClassroomDetailPage({super.key, required super.presenter, super.title});

  @override
  Widget build(BuildContext context) {
    (super.presenter as ClassroomDetailPresenter).updateDto(
      ModalRoute.of(context)!.settings.arguments,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        actions:
            (super.presenter as ClassroomDetailPresenter).classroomEntity !=
                null
            ? [
                IconButton(
                  onPressed: () {
                    showDialog<void>(
                      context: context,
                      barrierDismissible:
                          false, // User must tap a button to dismiss
                      builder: (BuildContext dialogContext) {
                        return ConfimDialogComponent(
                          pageContext: context,
                          confirmAction: (presenter as ClassroomDetailPresenter)
                              .deleteClassrrom,
                          cancelAction: null,
                          message: 'Tem certeza que deseja deletar esta sala?',
                        );
                      },
                    );
                  },
                  icon: Icon(Icons.delete),
                ),
              ]
            : [],
        title: Text(
          (presenter as ClassroomDetailPresenter).classroomEntity == null
              ? "Adicionar sala de aula"
              : (presenter as ClassroomDetailPresenter).classroomEntity!
                    .getName(),
        ),
        //leading: IconButton(onPressed: () => {}, icon: Icon(Icons.arrow_back)),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment(0.8, 1),
            colors: <Color>[
              Color.fromRGBO(250, 138, 10, 1),
              Color.fromRGBO(250, 158, 30, 1),
              Color.fromRGBO(250, 178, 50, 1),
            ], // Gradie
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Form(
                key: formKey,
                child: MyTextFormField(
                  updateValueFunction:
                      (super.presenter as ClassroomDetailPresenter)
                          .classroomDto
                          .updateName,
                  hint: "Nome da sala",
                  initialValue:
                      (super.presenter as ClassroomDetailPresenter)
                              .classroomEntity ==
                          null
                      ? ""
                      : (super.presenter as ClassroomDetailPresenter)
                            .classroomEntity!
                            .getName(),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(15),
              child:
                  (super.presenter as ClassroomDetailPresenter)
                          .classroomEntity ==
                      null
                  ? ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          (super.presenter as ClassroomDetailPresenter)
                              .addClassroom();
                        }
                      },
                      child: Text("Salvar"),
                    )
                  : ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          (super.presenter as ClassroomDetailPresenter)
                              .editClassrrom();
                        }
                      },
                      child: Text("Editar"),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
