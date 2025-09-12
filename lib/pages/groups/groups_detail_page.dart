import 'package:flutter/material.dart';

import 'package:fonovoo/pages/base_page.dart';
import 'package:fonovoo/pages/components/my_text_form_field.dart';
import 'package:fonovoo/pages/groups/presenters/groups_detail_presenter.dart';

class GroupsDetailPage extends BasePage {
  final formKey = GlobalKey<FormState>();

  GroupsDetailPage({super.key, required super.presenter, super.title});

  @override
  Widget build(BuildContext context) {
    (super.presenter as GroupsDetailPresenter).updateDto(
      ModalRoute.of(context)!.settings.arguments,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Text(
          (presenter as GroupsDetailPresenter).schoolEntity == null
              ? "Adicionar sala de aula"
              : (presenter as GroupsDetailPresenter).schoolEntity!.getName(),
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
                Color.fromRGBO(60, 120, 172, 1),
                Color.fromRGBO(70, 130, 182, 1),
                Color.fromRGBO(80, 140, 192, 1),
              ], // Gradie
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
                        (super.presenter as GroupsDetailPresenter)
                            .schoolDto
                            .updateName,
                    hint: "Nome da sala",
                    initialValue:
                        (super.presenter as GroupsDetailPresenter)
                                .schoolEntity ==
                            null
                        ? ""
                        : (super.presenter as GroupsDetailPresenter)
                              .schoolEntity!
                              .getName(),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child:
                        (super.presenter as GroupsDetailPresenter)
                                .schoolEntity ==
                            null
                        ? ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                (super.presenter as GroupsDetailPresenter)
                                    .addClassroom();
                              }
                            },
                            child: Text("Salvar"),
                          )
                        : ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                (super.presenter as GroupsDetailPresenter)
                                    .editClassrrom();
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
