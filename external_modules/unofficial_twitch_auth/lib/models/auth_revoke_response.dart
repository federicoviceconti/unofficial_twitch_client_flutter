import 'dart:convert';
import 'package:unofficial_twitch_http/models/http_result.dart';

class AuthRevokeResponse extends BaseHttpResponse {
  AuthRevokeResponse({
    int? status,
    String? message,
  }) : super(message: message, status: status);

  static AuthRevokeResponse fromHttpResponse(
    int statusCode,
    String responseBody,
  ) {
    if (statusCode == 200) {
      return AuthRevokeResponse();
    } else {
      final body = jsonDecode(responseBody);

      return AuthRevokeResponse(
          message: body['message'], status: body['status']);
    }
  }
}
