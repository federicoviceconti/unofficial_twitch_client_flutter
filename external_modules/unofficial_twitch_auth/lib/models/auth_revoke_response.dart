import 'dart:convert';
import 'package:http/http.dart';
import 'package:unofficial_twitch_http/models/http_result.dart';

class AuthRevokeResponse extends BaseHttpResponse {
  AuthRevokeResponse({
    int? status,
    String? message,
  }): super(
      message: message,
      status: status
  );

  static AuthRevokeResponse fromHttpResponse(Response response) {
    if(response.statusCode == 200) {
      return AuthRevokeResponse();
    } else {
      final body = jsonDecode(response.body);

      return AuthRevokeResponse(
        message: body['message'],
        status: body['status']
      );
    }
  }
}