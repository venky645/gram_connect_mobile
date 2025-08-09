import 'package:flutter/material.dart';
import 'package:gram_connect/app/presentation/app.dart';
import 'package:gram_connect/app/presentation/app_wrapper.dart';
import 'package:gram_connect/core/di/dependency_injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependecies();
  runApp(const App());
}
