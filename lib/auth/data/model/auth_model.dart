import 'package:aladia_demo_app/auth/domain/entity/auth_entity.dart';

class LogInModel extends LogInEntity {
  const LogInModel({
    required super.email,
    required super.password,
  });

  factory LogInModel.fromJson(Map<String, dynamic> json) {
    return LogInModel(
      email: json['email'], 
      password: json['password']);
  }

  Map<String, dynamic> toJson() {
    return {
      'email': password,
      'password': email,
    };
  }
}

class VerifyEmailModel extends VerifyEmailEntity {
  const VerifyEmailModel({required super.email});

  factory VerifyEmailModel.fromJson(Map<String, dynamic> json) {
    return VerifyEmailModel(email: json['email']);
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
    };
  }
}
