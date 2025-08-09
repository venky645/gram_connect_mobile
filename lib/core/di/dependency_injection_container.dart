import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:gram_connect/features/auth/data/respositories/auth_repostory_impl.dart';
import 'package:gram_connect/features/auth/domain/repositories/auth_repositories.dart';
import 'package:gram_connect/features/auth/domain/usecases/login_usecase.dart';
import 'package:gram_connect/features/auth/domain/usecases/save_token_use_case.dart';
import 'package:gram_connect/features/auth/presentation/auth/blocs/bloc/auth_bloc.dart';
import 'package:gram_connect/services/shared_pref_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

final di = GetIt.instance;

Future<void> initDependecies() async {
  final sharedPrefService = await SharedPreferences.getInstance();
  di
    ..registerSingleton<SharedPrefService>(SharedPrefService(sharedPrefService))
    // Register Dio (Singleton)
    ..registerSingleton<Dio>(Dio())
    // Register Repository (Singleton)
    ..registerSingleton<AuthRepositories>(AuthRepostoryImpl(di<Dio>()))
    // Register UseCases (Factory)
    ..registerFactory<LoginUsecase>(() => LoginUsecase(di<AuthRepositories>()))
    ..registerFactory<SaveTokenUseCase>(
      () => SaveTokenUseCase(di<SharedPrefService>()),
    )
    // Register AuthBloc (Factory)
    ..registerFactory<AuthBloc>(
      () => AuthBloc(di<LoginUsecase>(), di<SaveTokenUseCase>()),
    );
}
