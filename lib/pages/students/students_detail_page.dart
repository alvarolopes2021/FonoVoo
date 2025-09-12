import 'package:flutter/material.dart';

import 'package:fonovoo/pages/base_page.dart';
import 'package:fonovoo/pages/components/confim_dialog_component.dart';
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
        actions:
            (super.presenter as StudentsDetailPresenter).studentsDto != null
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
                          confirmAction: (presenter as StudentsDetailPresenter)
                              .deleteStudent,
                          cancelAction: null,
                          message: 'Tem certeza que deseja deletar este aluno?',
                        );
                      },
                    );
                  },
                  icon: Icon(Icons.delete),
                ),
              ]
            : [],
        title: Text(
          (presenter as StudentsDetailPresenter).newStudent
              ? "Adicionar aluno"
              : (presenter as StudentsDetailPresenter).studentsDto!.getName(),
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
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: MyTextFormField(
                        updateValueFunction:
                            (super.presenter as StudentsDetailPresenter)
                                .studentsDto!
                                .updateName,
                        hint: "Nome do aluno",
                        initialValue:
                            (presenter as StudentsDetailPresenter).newStudent
                            ? ""
                            : (super.presenter as StudentsDetailPresenter)
                                  .studentsDto!
                                  .getName(),
                      ),
                    ),
                    ListenableBuilder(
                      listenable: (presenter as StudentsDetailPresenter),
                      builder: (pageContext, snapshot) {
                        return DropdownMenu<dynamic>(
                          hintText: "Grupo",
                          initialSelection:
                              (presenter as StudentsDetailPresenter)
                                  .selectedGroup,
                          width: MediaQuery.of(context).size.width,
                          onSelected: (selectedGroup) {
                            (presenter as StudentsDetailPresenter)
                                .selectStudentGroup(selectedGroup);
                          },
                          label: Text(
                            'Grupo do aluno',
                            style: TextStyle(color: Colors.white),
                          ),
                          dropdownMenuEntries: List.generate(
                            (presenter as StudentsDetailPresenter)
                                .groups
                                .length,
                            (index) {
                              return DropdownMenuEntry<dynamic>(
                                value: (presenter as StudentsDetailPresenter)
                                    .groups[index],
                                label: (presenter as StudentsDetailPresenter)
                                    .groups[index]
                                    .getName(),
                              );
                            },
                          ),
                          textStyle: TextStyle(color: Colors.white),
                          selectedTrailingIcon: Icon(
                            Icons.keyboard_arrow_up,
                            color: Colors.white,
                          ),
                          inputDecorationTheme: InputDecorationTheme(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ), // Your desired color
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ), // Your desired color
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.redAccent,
                              ), // Your desired color
                            ),
                            errorStyle: TextStyle(color: Colors.redAccent),

                            iconColor: Colors.white,
                          ),
                          leadingIcon: Icon(Icons.group, color: Colors.white),
                          trailingIcon: Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(15),
              child: (presenter as StudentsDetailPresenter).newStudent
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
          ],
        ),
      ),
    );
  }
}
