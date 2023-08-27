import 'package:dartz/dartz.dart';
import 'package:madhur_app/data/model/GeneralResponse.dart';
import 'package:madhur_app/data/model/ResetPassResponse.dart';
import 'package:madhur_app/data/model/UserResponse.dart';
import 'package:madhur_app/data/remote/api_service.dart';
import 'package:madhur_app/data/repositories/AuthenticationRepository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final ApiService apiService;

  AuthenticationRepositoryImpl({required this.apiService});

  @override
  Future<UserResponse> authenticate(String email, String password) async {
    UserResponse response = await apiService.loginUser(email, password);

    return response;
  }

  @override
  Future<ResetPassResponse> resetPass(String email) async {
    ResetPassResponse response = await apiService.resetPass(email);
    return response;
  }

  @override
  Future<GeneralResponse> changePass(String id, String resetToken, String newPass) async {
   GeneralResponse response= await apiService.changePass(id, resetToken, newPass);
   return response;
  }
}
