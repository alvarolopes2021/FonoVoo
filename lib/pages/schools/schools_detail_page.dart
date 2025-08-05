import 'package:flutter/material.dart';
import 'package:fonovoo/domain/entities/school_entity.dart';
import 'package:fonovoo/pages/base_page.dart';
import 'package:fonovoo/pages/components/my_text_form_field.dart';
import 'package:fonovoo/pages/schools/presenters/schools_detail_presenter.dart';

class SchoolsDetailPage extends BasePage {
  final formKey = GlobalKey<FormState>();

  SchoolsDetailPage({super.key, required super.presenter, super.title});

  @override
  Widget build(BuildContext context) {
    (super.presenter as SchoolsDetailPresenter).schoolEntity =
        ModalRoute.of(context)!.settings.arguments as SchoolEntity?;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Text(
          (presenter as SchoolsDetailPresenter).schoolEntity == null
              ? "Adicionar escola"
              : (presenter as SchoolsDetailPresenter).schoolEntity!.getName(),
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
                Color.fromRGBO(0, 90, 152, 1),
                Color.fromRGBO(0, 100, 162, 1),
                Color.fromRGBO(0, 110, 172, 1),
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
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child:
                        (super.presenter as SchoolsDetailPresenter)
                                .schoolEntity ==
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
