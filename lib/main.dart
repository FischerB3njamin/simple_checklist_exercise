import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_beautiful_checklist_exercise/main_app.dart';
import 'package:simple_beautiful_checklist_exercise/shared/todo_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ChangeNotifierProvider(
      create: (_) => TodoProvider(),
      child: const MainApp(),
    ),
  );
}
