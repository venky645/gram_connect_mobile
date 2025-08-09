import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gram_connect/core/di/dependency_injection_container.dart';
import 'package:gram_connect/features/auth/presentation/auth/blocs/bloc/auth_bloc.dart';
import 'package:gram_connect/features/auth/presentation/auth/login_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependecies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => di<AuthBloc>())],
      child: const MaterialApp(home: Scaffold(body: LoginView())),
    );
  }
}
