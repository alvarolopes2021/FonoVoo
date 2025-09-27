import 'package:flutter/material.dart';
import 'package:fonovoo/core/system_initialize_service.dart';
import 'package:fonovoo/pages/main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemInitializeService.initilizeSqlDb();

  SystemInitializeService.initializePackageVersion();

  runApp(const MainPage());
}
