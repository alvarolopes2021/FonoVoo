import 'package:flutter/material.dart';

import 'package:fonovoo/pages/base_page.dart';
import 'package:fonovoo/pages/components/my_text_form_field.dart';
import 'package:fonovoo/pages/students/presenters/students_detail_presenter.dart';

class StudentsDetailPage extends BasePage {
  final formKey = GlobalKey<FormState>();

  StudentsDetailPage({super.key, required super.presenter, super.title});

  @override
  Widget build(BuildContext context) {
    (super.presenter as StudentsDetailPresenter).updateDto(
      ModalRoute.of(context)!.settings.arguments,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Text(
          (presenter as StudentsDetailPresenter).studentEntity == null
              ? "Adicionar aluno"
              : (presenter as StudentsDetailPresenter).studentEntity!.getName(),
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
          child: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                Form(
                  key: formKey,
                  child: MyTextFormField(
                    updateValueFunction:
                        (super.presenter as StudentsDetailPresenter)
                            .studentsDto
                            .updateName,
                    hint: "Nome do aluno",
                    initialValue:
                        (super.presenter as StudentsDetailPresenter)
                                .studentEntity ==
                            null
                        ? ""
                        : (super.presenter as StudentsDetailPresenter)
                              .studentEntity!
                              .getName(),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child:
                        (super.presenter as StudentsDetailPresenter)
                                .studentEntity ==
                            null
                        ? ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                (super.presenter as StudentsDetailPresenter)
                                    .addStudent();
                              }
                            },
                            child: Text("Salvar"),
                          )
                        : ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                (super.presenter as StudentsDetailPresenter)
                                    .editStudent();
                              }
                            },
                            child: Text("Editar"),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
