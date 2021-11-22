import 'dart:convert';

import 'package:http/http.dart';
import 'package:unofficial_twitch_http/models/http_result.dart';

class OpenApiChannelUserFollow extends BaseHttpResponse {
  OpenApiChannelUserFollow({
    int? status,
    String? message,
  });

  static fromHttpResponse(Response response) {
    final json = jsonDecode(response.body);

    if (json != null) {
      return OpenApiChannelUserFollow.fromJson(json);
    } else {
      return OpenApiChannelUserFollow(
        status: response.statusCode,
        message: '',
      );
    }
  }

  static fromJson(Map<String, dynamic> json) {}
}
