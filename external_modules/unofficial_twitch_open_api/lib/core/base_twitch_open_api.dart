import 'package:unofficial_twitch_http/models/environment.dart';
import 'package:unofficial_twitch_http/unofficial_twitch_http.dart';
import 'package:unofficial_twitch_open_api/core/twitch_open_api_constants.dart';

abstract class BaseTwitchOpenApi {
  TwitchHttpClient get client => TwitchHttpClientImpl(
    environmentBundle: EnvironmentBundle(
      basePath: TwitchOpenApiConstants.baseUrl,
    ),
  );
}
