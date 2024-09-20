import 'package:dartz/dartz.dart';
import 'package:flutter_absensi_app_acm/core/constants/variables.dart';
import 'package:flutter_absensi_app_acm/data/datasources/auth_local_datasource.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class CutiRemoteDatasource {
  Future<Either<String, String>> addCuti(
    String date,
    String reason,
    // XFile? image,
  ) async {
    final authData = await AuthLocalDatasource().getAuthData();
    final url = Uri.parse('${Variables.baseUrl}/api/api-cuti');
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${authData?.token}',
    };

    var request = http.MultipartRequest('POST', url);

    request.headers.addAll(headers);
    request.fields['date'] = date;
    request.fields['reason'] = reason;

    // request.files.add(await http.MultipartFile.fromPath('image', image!.path));

    http.StreamedResponse response = await request.send();

    final String body = await response.stream.bytesToString();

    if (response.statusCode == 201) {
      return const Right('Cuti added successfully');
    } else {
      return const Left('Failed to add permission');
    }
  }
}
