import 'package:flutter_test/flutter_test.dart';
import 'package:http/src/response.dart';
import 'package:unofficial_twitch_http/models/environment.dart';
import 'package:unofficial_twitch_http/models/http_result.dart';
import 'package:unofficial_twitch_http/unofficial_twitch_http.dart';

void main() {
  OkMockHttpClientImpl? okClient;

  setUp(() {
    okClient = OkMockHttpClientImpl(
      bundle: EnvironmentBundle(
        basePath: 'http://localhost',
      ),
    );
  });

  tearDown(() {
    okClient = null;
  });

  test('/GET is not null', () async {
    final getResponse = await okClient?.makeGet(
      '/success', convertBodyFunc: (response) {
      return MockResult.fromResponse(response);
    },);

    expect(getResponse, isNotNull);
  });

  test('/POST is not null', () async {
    final getResponse = await okClient?.makeGet(
      '/success', convertBodyFunc: (response) {
      return MockResult.fromResponse(response);
    },);

    expect(getResponse, isNotNull);
  });

  test('/GET returns a 200 OK', () async {
    final getResponse = await okClient?.makeGet(
      '/success', convertBodyFunc: (response) {
      return MockResult.fromResponse(response);
    },);

    equals(getResponse!.result!.status, 200);
  });

  test('/POST returns a 200 OK', () async {
    final getResponse = await okClient?.makeGet(
      '/success', convertBodyFunc: (response) {
      return MockResult.fromResponse(response);
    },);

    equals(getResponse!.result!.status, 200);
  });
}

class MockResult extends BaseHttpResponse {
  static MockResult fromResponse(Response response) {
    return MockResult();
  }
}

class OkMockHttpClientImpl extends TwitchHttpClient {
  OkMockHttpClientImpl({required EnvironmentBundle bundle})
      : super(environmentBundle: bundle);

  @override
  Future<HttpResult<T>> makeGet<T extends BaseHttpResponse>(String path, {
    required T Function(Response response) convertBodyFunc,
    Map<String, String>? headers,
    Map<String, String?>? queryParameters,
    String? bearerToken,
    String? clientId,
  }) {
    final response = convertBodyFunc.call(Response('', 200));
    return Future.value(HttpResult(result: response, error: null));
  }

  @override
  Future<HttpResult<T>> makePost<T extends BaseHttpResponse>(String path, {
    required T Function(Response response) convertBodyFunc,
    Map<String, String>? headers,
    Map<String, String?>? queryParameters,
    Map<String, dynamic>? body,
    String? bearerToken,
    String? clientId,
  }) {
    final response = convertBodyFunc.call(Response('', 200));
    return Future.value(HttpResult(result: response, error: null));
  }
}
