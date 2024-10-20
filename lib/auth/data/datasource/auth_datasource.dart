import 'dart:convert';
import 'package:aladia_demo_app/auth/data/model/auth_model.dart';
import 'package:aladia_demo_app/core/error/exception.dart';
import 'package:http/http.dart' as http;

abstract class AuthRemoteDataSource {
  Future<String> logIn(LogInModel oldUser);
  Future<bool> verifyEmail(VerifyEmailModel email);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  late final http.Client client;

  AuthRemoteDataSourceImpl({required this.client});
  final baseUrl = 'https://dev-api.aladia.io/v2/auth';

  @override
  Future<String> logIn(LogInModel oldUser) async {
    var url = Uri.parse('$baseUrl/login');
  
    print(jsonEncode(oldUser.toJson()));

    final res = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(oldUser.toJson()));

    if (res.statusCode == 200) {
      return jsonDecode(res.body)['accessToken'];
    } else {
      throw ServerException(message: 'server failure');
    }
  }

  @override
  Future<bool> verifyEmail(VerifyEmailModel email) async {
    var url = Uri.parse('$baseUrl/user-existence');

    final res = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(email.toJson()));

    if (res.statusCode == 200) {
      return jsonDecode(res.body)['exists'] == true;
    } else {
      throw ServerException(message: 'Server failure');
    }
  }
}
