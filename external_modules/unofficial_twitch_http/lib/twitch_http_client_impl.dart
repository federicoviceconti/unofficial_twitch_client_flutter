import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:unofficial_twitch_http/twitch_http_client.dart';

import 'models/environment.dart';
import 'models/http_result.dart';

class TwitchHttpClientImpl extends TwitchHttpClient {
  static const String headerAuthorization = 'Authorization';

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
  }) {
    return _makeRequest(
      method: 'GET',
      path: path,
      convertFunc: convertBodyFunc,
      headers: headers,
      queryParameters: queryParameters,
      bearerToken: bearerToken,
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
  }) {
    return _makeRequest(
      method: 'POST',
      path: path,
      convertFunc: convertBodyFunc,
      headers: headers,
      queryParameters: queryParameters,
      bearerToken: bearerToken,
      body: body,
    );
  }

  Future<HttpResult<T>> _makeRequest<T extends BaseHttpResponse>({
    required String method,
    required String path,
    required T Function(http.Response) convertFunc,
    Map<String, String>? headers,
    Map<String, String?>? queryParameters,
    String? bearerToken,
    Map<String, dynamic>? body,
  }) async {
    try {
      final response = await _makeRequestByMethod(
        path,
        method,
        headers,
        queryParameters,
        bearerToken,
        body
      );

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
    Map<String, String?>? queryParameters,
    String? bearerToken,
    Map<String, dynamic>? body,
  ) async {
    final uri = Uri.parse(environmentBundle.basePath + path)
        .replace(queryParameters: queryParameters);

    if (bearerToken != null) {
      headers ??= {};
      headers[headerAuthorization] = 'Bearer $bearerToken';
    }

    Response? response;

    switch (method) {
      case 'GET':
        response = await http.get(
          uri,
          headers: headers,
        );
        break;
      case 'POST':
        response = await http.post(
          uri,
          headers: headers,
          body: body,
        );
        break;
    }

    debugPrint("|==REQUEST\n|__$method $uri\n|__headers: $headers");

    if(body != null) {
      debugPrint("|__Body: $body");
    }

    debugPrint("|==RESPONSE");
    debugPrint("|__Code: ${response?.statusCode}");
    debugPrint("|__Body: ${response?.body}");

    throw UnsupportedError('Method not supported -> $method!');
  }
}
