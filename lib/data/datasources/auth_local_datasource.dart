import 'package:flutter_absensi_app_acm/data/models/response/auth_response_model.dart';
import 'package:flutter_absensi_app_acm/data/models/response/user_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDatasource {
  Future<void> saveAuthData(AuthResponseModel authResponseModel) async {
    // Save auth data to local storage
    final preference = await SharedPreferences.getInstance();
    await preference.setString('auth_data', authResponseModel.toJson());
  }

  Future<void> updateAuthData(UserResponseModel userResponseModel) async {
    // Save auth data to local storage
    final preference = await SharedPreferences.getInstance();
    final authData = await getAuthData();
    if (authData != null) {
      final updatedData = authData.copyWith(user: userResponseModel.user);
      await preference.setString('auth_data', updatedData.toJson());
    }
  }

  // Removenya
  Future<void> removeAuthData() async {
    // Remove auth data from local storage
    final preference = await SharedPreferences.getInstance();
    preference.remove('auth_data');
  }

  // Get
  Future<AuthResponseModel?> getAuthData() async {
    // Get saved auth data from local storage
    final preference = await SharedPreferences.getInstance();
    final authData = preference.getString('auth_data');

    if (authData != null) {
      return AuthResponseModel.fromJson(authData);
    } else {
      return null;
    }
  }

  // Check isAuth / Pengecekan sudah login atau belum
  Future<bool> isAuth() async {
    // Check if user is authenticated
    final preference = await SharedPreferences.getInstance();
    final authData = preference.getString('auth_data');
    if (authData != null) {
      return true;
    } else {
      return false;
    }
  }

  // Get User ID
  Future<String?> getUserId() async {
    final authData = await getAuthData();
    return authData?.user?.id
        .toString(); // Asumsikan userId disimpan di authData
  }
}
