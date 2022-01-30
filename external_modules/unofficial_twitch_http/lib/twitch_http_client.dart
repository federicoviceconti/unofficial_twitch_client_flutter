import 'package:unofficial_twitch_http/models/environment.dart';
import 'package:http/http.dart' as http;

import 'models/http_result.dart';

/// This abstract class contains the definition of the method used to create
/// requests with the client. It could be overridden as you want for testing
/// purpose or use the implementation "[TwitchHttpClientImpl]" inside this
/// package
abstract class TwitchHttpClient {
  final EnvironmentBundle environmentBundle;

  TwitchHttpClient({
    required this.environmentBundle,
  });

  /// The purpose of this method is to make an HTTP /GET request.
  ///
  /// @param path is needed to get the resources
  ///
  /// @param convertBodyFunc has a Response as parameter to convert the
  /// information into the generic type
  ///
  /// @param headers extra other the authentication or client_id
  ///
  /// @param queryParameters will be added at the end of the URL
  ///
  /// @param bearerToken is used to access to the authenticated resources
  ///
  /// @param clientId is used to identify which application is making the
  /// requests
  ///
  /// @return HttpResult, which contains the error or the result of the
  /// operation
  Future<HttpResult<T>> makeGet<T extends BaseHttpResponse>(
    String path, {
    required T Function(http.Response) convertBodyFunc,
    Map<String, String>? headers,
    Map<String, String?>? queryParameters,
    String? bearerToken,
    String? clientId,
  });

  /// The purpose of this method is to make an HTTP /POST request.
  ///
  /// @param path is needed to get the resources
  ///
  /// @param convertBodyFunc has a Response as parameter to convert the
  /// information into the generic type
  ///
  /// @param headers extra other the authentication or client_id
  ///
  /// @param queryParameters will be added at the end of the URL
  ///
  /// @param body is added inside the request as application/json format
  ///
  /// @param bearerToken is used to access to the authenticated resources
  ///
  /// @param clientId is used to identify which application is making the
  /// requests
  ///
  /// @return HttpResult, which contains the error or the result of the
  /// operation
  Future<HttpResult<T>> makePost<T extends BaseHttpResponse>(
    String path, {
    required T Function(http.Response) convertBodyFunc,
    Map<String, String>? headers,
    Map<String, String?>? queryParameters,
    Map<String, dynamic>? body,
    String? bearerToken,
    String? clientId,
  });
}
