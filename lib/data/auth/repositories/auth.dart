import 'package:dartz/dartz.dart';
import 'package:movie/data/auth/models/signin_req_params.dart';
import 'package:movie/data/auth/models/signup_req_params.dart';
import 'package:movie/data/auth/source/auth_api_service.dart';
import 'package:movie/domain/auth/repositories/auth.dart';
import 'package:movie/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signup(SignupReqParams params) async {
    return await sl<AuthApiService>().signup(params);
  }

  @override
  Future<Either> signin(SigninReqParams params) async {
    return await sl<AuthApiService>().signin(params);
  }
}
