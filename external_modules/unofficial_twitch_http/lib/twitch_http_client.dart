import 'package:flutter/material.dart';
import 'package:unofficial_twitch_http/models/environment.dart';
import 'package:http/http.dart' as http;

import 'models/http_result.dart';

abstract class TwitchHttpClient {
  final EnvironmentBundle environmentBundle;

  TwitchHttpClient({
    required this.environmentBundle,
  });

  Future<HttpResult<T>> makeGet<T extends BaseHttpResponse>(
    String path, {
    required T Function(http.Response) convertBodyFunc,
    Map<String, String>? headers,
    Map<String, String>? queryParameters,
  });
}
