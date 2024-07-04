import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter_absensi_app_acm/core/constants/variables.dart';
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

      if (response.statusCode == 200) {
        return Right(UserApiResponseModel.fromJson(response.body));
      } else {
        return const Left("Can't access to server / Internal Server Error");
      }
    } catch (e) {
      return const Left('Error di Catch');
    }
  }

  // Update Data User
  // Future<Either<String, UpdateUserResponseModel>> updateUser(
  //   String name,
  //   String email,
  //   String phone,
  //   String address,
  // ) async {
  //   try {
  //     final authData = await AuthLocalDatasource().getAuthData();
  //     final userId = await AuthLocalDatasource().getUserId();
  //     final response = await http.put(
  //       // http://192.168.0.110:8000/api/user/10 (Put)
  //       // Uri.parse('${Variables.baseUrl}${Variables.updateUser(userId)}'),
  //       Uri.parse('${Variables.baseUrl}/api/user/$userId'),
  //       headers: {
  //         'Authorization': 'Bearer ${authData!.accessToken}',
  //         'Accept': 'application/json',
  //         'Content-Type': 'application/json',
  //       },
  //       body: jsonEncode({
  //         'name': name,
  //         'email': email,
  //         'phone': phone,
  //         'address': address,
  //       }),
  //     );
  //     if (response.statusCode == 200) {
  //       log(response.body);
  //       return Right(UpdateUserResponseModel.fromJson(response.body));
  //     } else {
  //       return const Left("Can't access to server / Internal Server Error");
  //     }
  //   } catch (e) {
  //     return const Left('Error di Catch');
  //   }
  // }
}
