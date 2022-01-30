import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:unofficial_twitch_http/models/http_method.dart';
import 'package:unofficial_twitch_http/twitch_http_client.dart';

import 'models/environment.dart';
import 'models/http_result.dart';

class TwitchHttpClientImpl extends TwitchHttpClient {
  static const String headerAuthorization = 'Authorization';
  static const String clientIdAuthorization = 'Client-Id';

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
    Map<String, String?>? queryParameters,
    String? bearerToken,
    String? clientId,
  }) {
    return _makeRequest(
      method: HttpMethod.get,
      path: path,
      convertFunc: convertBodyFunc,
      headers: headers,
      queryParameters: queryParameters,
      bearerToken: bearerToken,
      clientId: clientId,
    );
  }

  @override
  Future<HttpResult<T>> makePost<T extends BaseHttpResponse>(
    String path, {
    required T Function(http.Response p1) convertBodyFunc,
    Map<String, String>? headers,
    Map<String, String?>? queryParameters,
    Map<String, dynamic>? body,
    String? bearerToken,
    String? clientId,
  }) {
    return _makeRequest(
      method: HttpMethod.post,
      path: path,
      convertFunc: convertBodyFunc,
      headers: headers,
      queryParameters: queryParameters,
      bearerToken: bearerToken,
      clientId: clientId,
      body: body,
    );
  }

  Future<HttpResult<T>> _makeRequest<T extends BaseHttpResponse>({
    required HttpMethod method,
    required String path,
    required T Function(http.Response) convertFunc,
    Map<String, String>? headers,
    Map<String, String?>? queryParameters,
    String? bearerToken,
    String? clientId,
    Map<String, dynamic>? body,
  }) async {
    try {
      final response = await _makeRequestByMethod(
        path,
        method,
        headers,
        queryParameters,
        bearerToken,
        clientId,
        body,
      );

      return HttpResult(
        result: convertFunc(response),
      );
    } on Exception catch (e) {
      _logException(e, method: method, path: path);
      return Future.value(
        HttpResult<T>(
          error: ErrorHttpResponse(),
        ),
      );
    }
  }

  Future<http.Response> _makeRequestByMethod(
    String path,
    HttpMethod method,
    Map<String, String>? headers,
    Map<String, String?>? queryParameters,
    String? bearerToken,
    String? clientId,
    Map<String, dynamic>? body,
  ) async {
    queryParameters
        ?.removeWhere((key, value) => value == null || value.isEmpty);

    final uri = Uri.parse(environmentBundle.basePath + path)
        .replace(queryParameters: queryParameters);

    if (bearerToken != null) {
      headers ??= {};
      headers[headerAuthorization] = 'Bearer $bearerToken';
    }

    if (clientId != null) {
      headers ??= {};
      headers[clientIdAuthorization] = clientId;
    }

    Response? response;

    switch (method) {
      case HttpMethod.get:
        response = await http.get(
          uri,
          headers: headers,
        );
        break;
      case HttpMethod.post:
        response = await http.post(
          uri,
          headers: headers,
          body: body,
        );
        break;
      default:
        throw UnsupportedError('Method not supported -> $method!');
    }

    _logResponse(method, uri, headers, body, response);

    return response;
  }

  void _logResponse(
    HttpMethod method,
    Uri uri,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    http.Response response,
  ) {
    debugPrint("\n|==REQUEST");
    debugPrint("|__$method $uri");
    debugPrint("|__headers: $headers");

    if (body != null) {
      debugPrint("|__Body: $body");
    }

    debugPrint("|==RESPONSE");
    debugPrint("|__Code: ${response.statusCode}");
    debugPrint("|__Body: ${response.body}\n");
  }

  void _logException(Exception e, {HttpMethod? method, String? path}) {
    debugPrint("\n|==EXCEPTION\n|__$method: $path\n|__Exception:$e\n");
  }
}
