import 'package:flutter/material.dart';

import 'package:fonovoo/pages/base_page.dart';
import 'package:fonovoo/pages/components/confim_dialog_component.dart';
import 'package:fonovoo/pages/components/my_text_form_field.dart';
import 'package:fonovoo/pages/schools/presenters/schools_detail_presenter.dart';

class SchoolsDetailPage extends BasePage {
  final formKey = GlobalKey<FormState>();

  SchoolsDetailPage({super.key, required super.presenter, super.title});

  @override
  Widget build(BuildContext context) {
    (super.presenter as SchoolsDetailPresenter).updateDto(
      ModalRoute.of(context)!.settings.arguments,
    );

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        actions:
            (super.presenter as SchoolsDetailPresenter).schoolEntity != null
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
                          confirmAction: (presenter as SchoolsDetailPresenter)
                              .deleteSchool,
                          cancelAction: null,
                          message:
                              'Tem certeza que deseja deletar esta escola?',
                        );
                      },
                    );
                  },
                  icon: Icon(Icons.delete),
                ),
              ]
            : [],
        title: Text(
          (presenter as SchoolsDetailPresenter).schoolEntity == null
              ? "Adicionar escola"
              : (presenter as SchoolsDetailPresenter).schoolEntity!.getName(),
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
              Color.fromRGBO(60, 120, 172, 1),
              Color.fromRGBO(70, 130, 182, 1),
              Color.fromRGBO(80, 140, 192, 1),
            ], // Gradient from,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Form(
                key: formKey,
                child: MyTextFormField(
                  updateValueFunction:
                      (super.presenter as SchoolsDetailPresenter)
                          .schoolDto
                          .updateName,
                  hint: "Nome da escola",
                  initialValue:
                      (super.presenter as SchoolsDetailPresenter)
                              .schoolEntity ==
                          null
                      ? ""
                      : (super.presenter as SchoolsDetailPresenter)
                            .schoolEntity!
                            .getName(),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(15),
              child:
                  (super.presenter as SchoolsDetailPresenter).schoolEntity ==
                      null
                  ? ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          (super.presenter as SchoolsDetailPresenter)
                              .addSchool();
                        }
                      },
                      child: Text("Salvar"),
                    )
                  : ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          (super.presenter as SchoolsDetailPresenter)
                              .editSchool();
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
