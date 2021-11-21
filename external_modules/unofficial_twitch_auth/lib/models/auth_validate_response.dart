import 'dart:convert';

import 'package:unofficial_twitch_http/models/http_result.dart';

class AuthValidateResponse extends BaseHttpResponse {
  final String? clientId;
  final String? login;
  final List<String>? scopes;
  final String? userId;
  final int? expiresIn;

  AuthValidateResponse({
    int? status,
    String? message,
    this.clientId,
    this.login,
    this.scopes,
    this.userId,
    this.expiresIn,
  }): super(
    message: message,
    status: status
  );

  static AuthValidateResponse fromJson(Map<String, dynamic> json) {
    return AuthValidateResponse(
      status: json['status'],
      message: json['message'],
      clientId: json['client_id'],
      login: json['login'],
      scopes: json['scopes'],
      userId: json['user_id'],
      expiresIn: json['expires_in'],
    );
  }

  static AuthValidateResponse fromHttpResponse(String body) {
    return AuthValidateResponse.fromJson(jsonDecode(body));
  }
}
