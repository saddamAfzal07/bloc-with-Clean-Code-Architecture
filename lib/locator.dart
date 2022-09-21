import 'dart:io';

import 'package:bloc_cca/features/data/data_sources/user_remote_datasource.dart';
import 'package:bloc_cca/features/data/data_sources/user_remote_datasource_imp.dart';
import 'package:bloc_cca/features/data/repository/user_data_repository_impl.dart';
import 'package:bloc_cca/features/domain/use_cases/get_user_data.dart';
import 'package:bloc_cca/features/presentation/cubit/user_profile_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'features/domain/repository/user_data_repository.dart';

final sl = GetIt.instance;
Future<void> init() async {
  sl.registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDataSourceImp(http.Client()));
  sl.registerLazySingleton<UserDataRepository>(
      () => UserDataRepositoryImpl(sl()));
  sl.registerLazySingleton(() => GetUserDataCase(repository: sl()));
  sl.registerLazySingleton(() => UserProfileBloc(getUserDataCase: sl()));
}
