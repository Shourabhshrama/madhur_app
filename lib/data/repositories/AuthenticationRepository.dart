import 'package:madhur_app/data/model/GeneralResponse.dart';
import 'package:madhur_app/data/model/ResetPassResponse.dart';
import 'package:madhur_app/data/model/UserResponse.dart';

abstract class AuthenticationRepository {
  Future<UserResponse> authenticate(String email, String password);
  Future<ResetPassResponse> resetPass(String email);
  Future<GeneralResponse> changePass(String id,String resetToken,String newPass);
}