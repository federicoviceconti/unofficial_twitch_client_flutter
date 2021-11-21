import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:unofficial_twitch_http/twitch_http_client.dart';

import 'models/environment.dart';
import 'models/http_result.dart';

class TwitchHttpClientImpl extends TwitchHttpClient {
  TwitchHttpClientImpl({
    required EnvironmentBundle environmentBundle,
  }) : super(
          environmentBundle: environmentBundle,
        );

  @override
  Future<HttpResult<T>> makeGet<T extends BaseHttpResponse>(
    String path, {
    required T Function(http.Response) convertBodyFunc,
    Map<String, String>? headers,
    Map<String, String>? queryParameters,
  }) {
    return _makeRequest(
      method: 'GET',
      path: path,
      convertFunc: convertBodyFunc,
      headers: headers,
      queryParameters: queryParameters,
    );
  }

  Future<HttpResult<T>> _makeRequest<T extends BaseHttpResponse>({
    required String method,
    required String path,
    required T Function(http.Response) convertFunc,
    Map<String, String>? headers,
    Map<String, String>? queryParameters,
  }) async {
    try {
      final response =
          await _makeRequestByMethod(path, method, headers, queryParameters);

      return HttpResult(
        result: convertFunc(response),
      );
    } catch (e) {
      return Future.value(
        HttpResult<T>(
          error: ErrorHttpResponse(),
        ),
      );
    }
  }

  Future<http.Response> _makeRequestByMethod(
    String path,
    String method,
    Map<String, String>? headers,
    Map<String, String>? queryParameters,
  ) async {
    switch (method) {
      case 'GET':
        return await http.get(
          Uri.parse(environmentBundle.basePath + path)
              .replace(queryParameters: queryParameters),
          headers: headers,
        );
    }

    throw UnsupportedError('Method not supported -> $method!');
  }
}
