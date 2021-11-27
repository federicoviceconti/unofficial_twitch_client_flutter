import 'package:unofficial_twitch_http/models/http_result.dart';
import 'package:unofficial_twitch_open_api/channel_information/model/open_api_channel_information_response.dart';
import 'package:unofficial_twitch_open_api/channel_information/model/open_api_channel_stream_schedule_response.dart';
import 'package:unofficial_twitch_open_api/channel_information/model/open_api_channel_user_follow_response.dart';
import 'package:unofficial_twitch_open_api/core/base_twitch_open_api.dart';

abstract class TwitchChannelInformation extends BaseTwitchOpenApi {
  TwitchChannelInformation(String? token, String? clientId) : super(token, clientId);

  /// Docs: https://dev.twitch.tv/docs/api/reference#get-channel-information
  Future<HttpResult<OpenApiChannelInformationResponse>> getChannelInformation({
    required String broadcasterId,
  });

  /// Docs: https://dev.twitch.tv/docs/api/reference#get-channel-stream-schedule
  Future<HttpResult<OpenApiChannelStreamScheduleResponse>> getChannelStreamSchedule({
    required String broadcasterId,
  });

  /// Docs: https://dev.twitch.tv/docs/api/reference#get-users-follows
  Future<HttpResult<OpenApiChannelUserFollowResponse>> getUsersFollow({
    String? fromId,
    int? first,
    String? after,
    String? toId,
  });

  /// Docs: https://dev.twitch.tv/docs/api/reference#get-channel-teams
  Future<HttpResult<dynamic>> getChannelTeams({
    required String broadcasterId,
  });
}
