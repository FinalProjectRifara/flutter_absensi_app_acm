import 'dart:convert';

import 'package:camera/camera.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_absensi_app_acm/core/constants/variables.dart';
import 'package:flutter_absensi_app_acm/data/datasources/auth_local_datasource.dart';
import 'package:flutter_absensi_app_acm/data/models/response/auth_response_model.dart';
import 'package:flutter_absensi_app_acm/data/models/response/user_response_model.dart';
import 'package:http/http.dart' as http;

class AuthRemoteDatasource {
  Future<Either<String, AuthResponseModel>> login(
      String email, String password) async {
    final url = Uri.parse('${Variables.baseUrl}/api/login');
    final response = await http.post(
      url,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(
        {
          'email': email,
          'password': password,
        },
      ),
    );

    if (response.statusCode == 200) {
      return Right(AuthResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to login');
    }
  }

  // Logout
  Future<Either<String, String>> logOut() async {
    final url = Uri.parse('${Variables.baseUrl}/api/logout');
    final authData = await AuthLocalDatasource().getAuthData();
    final response = await http.post(
      url,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        "Authorization": 'Bearer ${authData?.token}',
      },
    );

    if (response.statusCode == 200) {
      AuthLocalDatasource()
          .removeAuthData(); // Di local juga dihapus sessionnya
      return Right(response.body); // Success LogOut
    } else {
      return Left(response.body); // Failed to LogOut
    }
  }

  // Update Profile Register Face
  Future<Either<String, UserResponseModel>> updateProfileRegisterFace(
    String embedding,
    // XFile image,
  ) async {
    final authData = await AuthLocalDatasource().getAuthData();
    final url = Uri.parse('${Variables.baseUrl}/api/update-profile');
    final request = http.MultipartRequest('POST', url)
      ..headers['Authorization'] = 'Bearer ${authData?.token}'
      ..fields['face_embedding'] = embedding;
    // ..files.add(await http.MultipartFile.fromPath('image', image.path));

    final response = await request.send();
    final responseString = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      return Right(UserResponseModel.fromJson(responseString));
    } else {
      return const Left('Failed to update profile');
    }
  }

  Future<void> updateFcmToken(String fcmToken) async {
    final authData = await AuthLocalDatasource().getAuthData();
    final url = Uri.parse('${Variables.baseUrl}/api/update-fcm-token');
    await http.post(
      url,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authData?.token}',
      },
      body: jsonEncode({
        'fcm_token': fcmToken,
      }),
    );
  }
}
