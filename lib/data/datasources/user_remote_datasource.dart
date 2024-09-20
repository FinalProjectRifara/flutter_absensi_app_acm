import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter_absensi_app_acm/core/constants/variables.dart';
import 'package:flutter_absensi_app_acm/data/models/response/update_user_response_model.dart';
import 'package:flutter_absensi_app_acm/data/models/response/user_api_response_model.dart';
import 'package:http/http.dart' as http;

import 'auth_local_datasource.dart';

class UserRemoteDatasource {
  // Get Data User
  Future<Either<String, UserApiResponseModel>> getUser() async {
    try {
      final authData = await AuthLocalDatasource().getAuthData();
      final response = await http.get(
        Uri.parse('${Variables.baseUrl}/api/user'),
        headers: {
          'Authorization': 'Bearer ${authData!.token}',
          'Accept': 'application/json',
        },
      );
      log("Response Status Code (getUser): ${response.statusCode}");
      log("Response Body (getUser): ${response.body}");

      if (response.statusCode == 200) {
        return Right(UserApiResponseModel.fromJson(response.body));
      } else {
        return const Left("Can't access to server / Internal Server Error");
      }
    } catch (e) {
      log("Error di Catch (getUser): $e");
      return const Left('Error di Catch');
    }
  }

  // Update Data User
  Future<Either<String, UpdateUserResponseModel>> updateUser(
    String name,
    String email,
    String phone,
    // String address,
  ) async {
    try {
      final authData = await AuthLocalDatasource().getAuthData();
      final userId = await AuthLocalDatasource().getUserId();
      log("Authorization Token: ${authData?.token}");
      log("Update User ID: $userId");
      log("Request Body (updateUser): {name: $name, email: $email, phone: $phone}");
      final response = await http.put(
        // http://192.168.0.110:8000/api/user/10 (Put)
        // Uri.parse('${Variables.baseUrl}${Variables.updateUser(userId)}'),
        Uri.parse('${Variables.baseUrl}/api/user/$userId'),
        headers: {
          'Authorization': 'Bearer ${authData!.token}',
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'name': name,
          'email': email,
          'phone': phone,
          // 'address': address,
        }),
      );
      log("Response Status Code (updateUser): ${response.statusCode}");
      log("Response Body (updateUser): ${response.body}");

      if (response.statusCode == 200) {
        log(response.body);
        return Right(UpdateUserResponseModel.fromJson(response.body));
      } else {
        return const Left("Can't access to server / Internal Server Error");
      }
    } catch (e) {
      log("Error di Catch (updateUser): $e");
      return const Left('Error di Catch');
    }
  }
}
