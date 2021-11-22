import 'package:unofficial_twitch_http/models/http_result.dart';
import 'package:unofficial_twitch_open_api/channel/model/open_api_channel_information_response.dart';
import 'package:unofficial_twitch_open_api/channel/model/open_api_channel_stream_schedule.dart';
import 'package:unofficial_twitch_open_api/channel/model/open_api_channel_user_follow.dart';
import 'package:unofficial_twitch_open_api/core/base_twitch_open_api.dart';

abstract class TwitchChannelInformation extends BaseTwitchOpenApi {
  /// Docs: https://dev.twitch.tv/docs/api/reference#get-channel-information
  Future<HttpResult<OpenApiChannelInformationResponse>> getChannelInformation({
    required String broadcasterId,
  });

  /// Docs: https://dev.twitch.tv/docs/api/reference#get-channel-stream-schedule
  Future<HttpResult<OpenApiChannelStreamSchedule>> getChannelStreamSchedule({
    required String broadcasterId,
  });

  /// Docs: https://dev.twitch.tv/docs/api/reference#get-users-follows
  Future<HttpResult<OpenApiChannelUserFollow>> getUsersFollow({
    String? fromId,
    int? first,
    String? after,
    String? toId,
  });
}
