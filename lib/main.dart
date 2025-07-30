import 'package:flutter/material.dart';
import 'package:gram_connect/presentation/auth/login_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Scaffold(body: LoginView()));
  }
}
