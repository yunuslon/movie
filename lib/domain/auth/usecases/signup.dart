import 'package:dartz/dartz.dart';
import 'package:movie/core/usecase/usecase.dart';
import 'package:movie/data/auth/models/signup_req_params.dart';
import 'package:movie/domain/auth/repositories/auth.dart';

class SignupUseCase extends Usecase<Either, SignupReqParams> {
  final AuthRepository authRepository;
  SignupUseCase({required this.authRepository});

  @override
  Future<Either<dynamic, dynamic>> call({SignupReqParams? params}) async {
    return await authRepository.signup(params!);
  }
}
