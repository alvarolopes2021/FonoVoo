import 'package:flutter/material.dart';
import 'package:fonovoo/pages/base_page.dart';
import 'package:fonovoo/pages/students/presenters/students_status_presenter.dart';

class StudentStatusPage extends BasePage {
  StudentStatusPage({super.key, required super.presenter});

  @override
  Widget build(BuildContext context) {
    (super.presenter as StudentsStatusPresenter).updateDto(
      ModalRoute.of(context)!.settings.arguments,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          (presenter as StudentsStatusPresenter).selectedStudent.getName(),
        ),
      ),
    );
  }
}
