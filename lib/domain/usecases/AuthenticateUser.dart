import 'package:dartz/dartz.dart';
import 'package:madhur_app/data/model/GeneralResponse.dart';
import 'package:madhur_app/data/model/ResetPassResponse.dart';
import 'package:madhur_app/data/model/UserResponse.dart';
import 'package:madhur_app/presentation/bloc/changePassBloc/ChangePassState.dart';

abstract class AuthenticateUser {
  Future<Either<Exception, UserResponse>> callLogin(String username, String password);
  Future<Either<Exception, ResetPassResponse>> callResetPass(String email);
  Future<Either<Exception, GeneralResponse>> callChangePass(String id,String password,String token);
}