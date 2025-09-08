import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gram_connect/app/presentation/app_wrapper.dart';
import 'package:gram_connect/app/routes/app_routes.dart';
import 'package:gram_connect/core/di/dependency_injection_container.dart';
import 'package:gram_connect/features/auth/presentation/auth/blocs/bloc/auth_bloc.dart';
import 'package:gram_connect/ui_handler/bloc/ui_handler_bloc.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di<UiHandlerBloc>()),
        BlocProvider(create: (context) => di<AuthBloc>()),
      ],
      child: MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'GramConnect',
        initialRoute: AppRoutes.home,
        onGenerateRoute: AppRoutes.generateRoute,
        builder: (context, child) => AppWrapper(child: child!),
      ),
    );
  }
}
