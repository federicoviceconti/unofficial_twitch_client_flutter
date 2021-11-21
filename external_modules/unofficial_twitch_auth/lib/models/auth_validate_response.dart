import 'dart:convert';

import 'package:unofficial_twitch_http/models/http_result.dart';

class AuthValidateResponse extends BaseHttpResponse {
  final String? clientId;
  final String? login;
  final List<String>? scopes;
  final String? userId;
  final int? expiresIn;

  AuthValidateResponse({
    this.clientId,
    this.login,
    this.scopes,
    this.userId,
    this.expiresIn,
  });

  static AuthValidateResponse fromJson(Map<String, dynamic> json) {
    return AuthValidateResponse(
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
