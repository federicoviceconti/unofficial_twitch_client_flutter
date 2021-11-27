import 'package:unofficial_twitch_http/models/http_result.dart';
import 'package:unofficial_twitch_open_api/core/open_api_channel_constants.dart';
import 'package:unofficial_twitch_open_api/game/model/open_api_get_game_response.dart';
import 'package:unofficial_twitch_open_api/game/model/open_api_get_top_game_response.dart';
import 'package:unofficial_twitch_open_api/game/twitch_game.dart';

class TwitchGameImpl extends TwitchGame {
  TwitchGameImpl(String? token, String? clientId) : super(token, clientId);

  @override
  Future<HttpResult<OpenApiGetGameResponse>> getName({required String name}) {
    return client.makeGet(
      OpenApiChannelConstants.getGameEndpoint,
      convertBodyFunc: (response) =>
          OpenApiGetGameResponse.fromHttpResponse(response),
      bearerToken: token,
      clientId: clientId,
      queryParameters: {
        OpenApiChannelConstants.queryParamName: name
      },
    );
  }

  @override
  Future<HttpResult<OpenApiGetTopGameResponse>> getTopGame() {
    return client.makeGet(
      OpenApiChannelConstants.getTopGameEndpoint,
      convertBodyFunc: (response) =>
          OpenApiGetTopGameResponse.fromHttpResponse(response),
      bearerToken: token,
      clientId: clientId,
    );
  }
}
