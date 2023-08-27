import 'package:dartz/dartz.dart';
import 'package:madhur_app/data/model/ResetPassResponse.dart';
import 'package:madhur_app/data/model/UserResponse.dart';

import '../../../data/model/GeneralResponse.dart';
import '../../../data/repositories/AuthenticationRepository.dart';
import '../AuthenticateUser.dart';

class AuthenticateUserImpl implements AuthenticateUser {
  final AuthenticationRepository authenticationRepository;

  AuthenticateUserImpl({required this.authenticationRepository});

  @override
  Future<Either<Exception, UserResponse>> callLogin(
      String username, String password) async {
    try {
      final user =
          await authenticationRepository.authenticate(username, password);
      return Right(user);
    } catch (e) {
      return Left(e as Exception);
    }
  }

  @override
  Future<Either<Exception, ResetPassResponse>> callResetPass(
      String email) async {
    try {
      final user = await authenticationRepository.resetPass(email);
      return Right(user);
    } catch (e) {
      return Left(e as Exception);
    }
  }

  @override
  Future<Either<Exception, GeneralResponse>> callChangePass(
      String id, String token, String newPass) async {
    try {
      final user =
          await authenticationRepository.changePass(id, token, newPass);
      return Right(user);
    } catch (e) {
      return Left(e as Exception);
    }
  }


}
