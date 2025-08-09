import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gram_connect/app/routes/app_routes.dart' show AppRoutes;
import 'package:gram_connect/ui_handler/bloc/ui_handler_bloc.dart';
import 'package:gram_connect/ui_handler/bloc/ui_handler_state.dart';

class AppWrapper extends StatelessWidget {
  const AppWrapper({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<UiHandlerBloc, UiHandlerState>(
      listener: (context, state) {
        if (state is GoToHomePageState) {
          print('suceessss.q');
          Navigator.pushNamed(context, AppRoutes.home);
        }
      },
      child: child,
    );
  }
}
