import 'dart:convert';
import 'package:http/http.dart';
import 'package:unofficial_twitch_http/models/http_result.dart';

class AuthRevokeResponse extends BaseHttpResponse {
  final RevokeReason reason;

  AuthRevokeResponse({
    required this.reason,
  });

  static AuthRevokeResponse fromHttpResponse(Response response) {
    if(response.statusCode == 200) {
      return AuthRevokeResponse(
        reason: RevokeReason.success
      );
    } else {
      final body = jsonDecode(response.body);
      final message = body['message'] as String;

      return AuthRevokeResponse(
          reason: message.reason
      );
    }
  }
}

enum RevokeReason {
  success, missingClient, invalidToken, unknown
}

extension InvalidRevokeReasonStringExt on String {
  RevokeReason get reason => {
    'Invalid token': RevokeReason.invalidToken,
    'missing client id': RevokeReason.missingClient,
  }[this] ?? RevokeReason.unknown;
}