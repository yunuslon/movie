import 'package:get_it/get_it.dart';
import 'package:movie/core/network/dio_client.dart';
import 'package:movie/data/auth/repositories/auth.dart';
import 'package:movie/data/auth/source/auth_api_service.dart';
import 'package:movie/domain/auth/repositories/auth.dart';
import 'package:movie/domain/auth/usecases/signin.dart';
import 'package:movie/domain/auth/usecases/signup.dart';

final sl = GetIt.instance;

void setupServiceLocator(){
  sl.registerSingleton<DioClient>(DioClient());

  // Services
  sl.registerSingleton<AuthApiService>(AuthApiServiceImpl());

  // RepoSitories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  // UseCase
  sl.registerSingleton<SignupUseCase>(SignupUseCase());
  sl.registerSingleton<SigninUseCase>(SigninUseCase());
}