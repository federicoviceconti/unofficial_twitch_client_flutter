import 'package:unofficial_twitch_http/models/http_result.dart';
import 'package:unofficial_twitch_open_api/channel_information/model/open_api_channel_information_response.dart';
import 'package:unofficial_twitch_open_api/channel_information/model/open_api_channel_stream_schedule_response.dart';
import 'package:unofficial_twitch_open_api/channel_information/model/open_api_channel_teams_response.dart';
import 'package:unofficial_twitch_open_api/channel_information/model/open_api_channel_user_follow_response.dart';
import 'package:unofficial_twitch_open_api/channel_information/twitch_channel_information.dart';
import 'package:unofficial_twitch_open_api/core/open_api_channel_constants.dart';

class TwitchChannelInformationImpl extends TwitchChannelInformation {
  TwitchChannelInformationImpl({
    required String? token,
    required String? clientId,
  }) : super(token, clientId);

  @override
  Future<HttpResult<OpenApiChannelInformationResponse>> getChannelInformation({
    required String broadcasterId,
  }) {
    return client.makeGet(
      OpenApiChannelConstants.channelInformationEndpoint,
      convertBodyFunc: (response) =>
          OpenApiChannelInformationResponse.fromHttpResponse(response),
      queryParameters: {
        OpenApiChannelConstants.queryParamBroadcasterId: broadcasterId,
      },
      bearerToken: token,
      clientId: clientId,
    );
  }

  @override
  Future<HttpResult<OpenApiChannelStreamScheduleResponse>> getChannelStreamSchedule({
    required String broadcasterId,
  }) {
    return client.makeGet(
      OpenApiChannelConstants.channelStreamScheduleEndpoint,
      convertBodyFunc: (response) =>
          OpenApiChannelStreamScheduleResponse.fromHttpResponse(response),
      queryParameters: {
        OpenApiChannelConstants.queryParamBroadcasterId: broadcasterId,
      },
      bearerToken: token,
      clientId: clientId,
    );
  }

  @override
  Future<HttpResult<OpenApiChannelUserFollowResponse>> getUsersFollow({
    String? fromId,
    int? first,
    String? after,
    String? toId,
  }) {
    return client.makeGet(
      OpenApiChannelConstants.channelUsersFollowEndpoint,
      convertBodyFunc: (response) =>
          OpenApiChannelUserFollowResponse.fromHttpResponse(response),
      queryParameters: {
        OpenApiChannelConstants.queryParamFromId: fromId,
        OpenApiChannelConstants.queryParamToId: toId,
        OpenApiChannelConstants.queryParamAfter: after,
        OpenApiChannelConstants.queryParamFirst: first?.toString(),
      },
      bearerToken: token,
      clientId: clientId,
    );
  }

  @override
  Future<HttpResult> getChannelTeams({required String broadcasterId}) {
    return client.makeGet(
      OpenApiChannelConstants.getChannelTeamsEndpoint,
      convertBodyFunc: (response) =>
          OpenApiChannelTeamsResponse.fromHttpResponse(response),
      queryParameters: {
        OpenApiChannelConstants.queryParamBroadcasterId: broadcasterId,
      },
      bearerToken: token,
      clientId: clientId,
    );
  }
}
