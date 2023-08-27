import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:madhur_app/data/model/CityResponse.dart';
import 'package:madhur_app/data/model/CountryResponse.dart';
import 'package:madhur_app/data/model/ResetPassResponse.dart';
import 'package:madhur_app/data/model/StateResponse.dart';
import 'package:madhur_app/data/model/UserResponse.dart';
import 'package:madhur_app/data/model/VillageResponse.dart';


import '../model/GeneralResponse.dart';

class ApiService {
  final String baseUrl;


  ApiService({required this.baseUrl});

  Future<UserResponse> loginUser(String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/v1/users/login'),
      // Replace with your API endpoint
      body: {
        'email': username,
        'password': password,
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      return UserResponse.fromJson(responseData);
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<ResetPassResponse> resetPass(String email) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/v1/users/forgetpassword'),
      // Replace with your API endpoint
      body: {'email': email},
    );
    print(response.body);
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      return ResetPassResponse.fromJson(responseData);
    } else {
      throw Exception('something went wrong');
    }
  }

  Future<GeneralResponse> changePass(
      String id, String resetToken, String newPassword) async {
    Map<String, dynamic> param = {
      'id': id,
      'resetToken': resetToken,
      'newpassword': newPassword,
    };
    print(param);
    final response = await http.post(
      Uri.parse('$baseUrl/api/v1/users/updatepassword'),
      body: param,
    );

    print(response.body);

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      return GeneralResponse.fromJson(responseData);
    } else {
      throw Exception('something went wrong');
    }
  }

  Future<CountryResponse> getAllCountries() async {


    final response = await http.get(
      Uri.parse('$baseUrl/api/v1/admin/getAllCountry'),
    );

    print("Country");
    print(response.body);

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      return CountryResponse.fromJson(responseData);
    } else {
      throw Exception('something went wrong');
    }
  }

  Future<StateResponse> getAllStates() async {

    print("$baseUrl/api/v1/admin/getAllState");

    final response = await http.get(
      Uri.parse('$baseUrl/api/v1/admin/getAllState'),
    );

    print(response.body);

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      return StateResponse.fromJson(responseData);
    } else {
      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('something went wrong');
    }
  }

  Future<CityResponse> getAllCity() async {
    final response = await http.get(
      Uri.parse('$baseUrl/api/v1/admin/getAllCity'),
    );

    print(response.body);

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      return CityResponse.fromJson(responseData);
    } else {
      throw Exception('something went wrong');
    }
  }

  Future<VillageResponse> getAllVillage() async {
    final response = await http.get(
      Uri.parse('$baseUrl/api/v1/admin/getAllCity'),
    );

    print(response.body);

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      return VillageResponse.fromJson(responseData);
    } else {
      throw Exception('something went wrong');
    }
  }
}
