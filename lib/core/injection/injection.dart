import 'package:aladia_demo_app/auth/data/datasource/auth_datasource.dart';
import 'package:aladia_demo_app/auth/data/repository/auth_repo_impl.dart';
import 'package:aladia_demo_app/auth/domain/repositoty/auth_repo.dart';
import 'package:aladia_demo_app/auth/domain/usecase/auth_usecase.dart';
import 'package:aladia_demo_app/auth/presentation/bloc/auth_bloc.dart';
import 'package:aladia_demo_app/auth/presentation/bloc/bloc/verify_bloc.dart';
import 'package:aladia_demo_app/core/network/network.dart';
import 'package:aladia_demo_app/core/usecase/usecase.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;
Future<void> init() async {
  // Bloc
  sl.registerFactory<AuthBloc>(() => AuthBloc(sl()));
  sl.registerFactory<VerifyBloc>(()=>VerifyBloc(sl()));

  // UseCase
  sl.registerLazySingleton<VerifyUsecase>(() => VerifyUsecase(sl()));
  sl.registerLazySingleton(() => LogInUseCase(sl()));

  // Repository
  sl.registerLazySingleton<AuthRepository>(() => AuthRepoImpl(sl(), sl()));

  // Data Source
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(client: sl()));

  // core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton(() => InternetConnection());
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => NoParams());


}
