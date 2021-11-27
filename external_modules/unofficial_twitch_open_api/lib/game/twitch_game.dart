import 'package:unofficial_twitch_http/models/http_result.dart';
import 'package:unofficial_twitch_open_api/core/base_twitch_open_api.dart';
import 'package:unofficial_twitch_open_api/game/model/open_api_get_game_response.dart';
import 'package:unofficial_twitch_open_api/game/model/open_api_get_top_game_response.dart';

abstract class TwitchGame extends BaseTwitchOpenApi {
  TwitchGame(String? token, String? clientId) : super(token, clientId);

  Future<HttpResult<OpenApiGetTopGameResponse>> getTopGame();

  Future<HttpResult<OpenApiGetGameResponse>> getName({required String name});
}