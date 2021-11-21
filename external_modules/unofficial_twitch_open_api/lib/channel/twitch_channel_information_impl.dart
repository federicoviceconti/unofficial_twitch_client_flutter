import 'package:unofficial_twitch_http/models/environment.dart';
import 'package:unofficial_twitch_http/models/http_result.dart';
import 'package:unofficial_twitch_http/twitch_http_client.dart';
import 'package:unofficial_twitch_http/twitch_http_client_impl.dart';
import 'package:unofficial_twitch_open_api/channel/model/open_api_channel_information_response.dart';
import 'package:unofficial_twitch_open_api/channel/model/open_api_channel_stream_schedule.dart';
import 'package:unofficial_twitch_open_api/channel/model/open_api_channel_user_follow.dart';
import 'package:unofficial_twitch_open_api/channel/open_api_channel_constants.dart';
import 'package:unofficial_twitch_open_api/channel/twitch_channel_information.dart';

class TwitchChannelInformationImpl extends TwitchChannelInformation {
  final EnvironmentBundle environmentBundle;

  TwitchChannelInformationImpl({
    required this.environmentBundle,
  });

  @override
  // TODO: implement client
  TwitchHttpClient get client =>
      TwitchHttpClientImpl(environmentBundle: environmentBundle);

  @override
  Future<HttpResult<OpenApiChannelInformationResponse>> getChannelInformation({
    required String broadcasterId,
  }) {
    return client.makeGet(
      OpenApiChannelConstants.channelInformationEndpoint,
      convertBodyFunc: (response) => OpenApiChannelInformationResponse.fromHttpResponse(response),
      queryParameters: {
        OpenApiChannelConstants.queryParamBroadcasterId: broadcasterId,
      },
    );
  }

  @override
  Future<HttpResult<OpenApiChannelStreamSchedule>> getChannelStreamSchedule({
    required String broadcasterId,
  }) {
    return client.makeGet(
      OpenApiChannelConstants.channelStreamScheduleEndpoint,
      convertBodyFunc: (response) => OpenApiChannelStreamSchedule.fromHttpResponse(response),
      queryParameters: {
        OpenApiChannelConstants.queryParamBroadcasterId: broadcasterId,
      },
    );
  }

  @override
  Future<HttpResult<OpenApiChannelUserFollow>> getUsersFollow({
    String? fromId,
    int? first,
    String? after,
    String? toId,
  }) {
    return client.makeGet(
      OpenApiChannelConstants.channelUsersFollowEndpoint,
      convertBodyFunc: (response) => OpenApiChannelUserFollow.fromHttpResponse(response),
      queryParameters: {
        OpenApiChannelConstants.queryParamFromId: fromId,
        OpenApiChannelConstants.queryParamToId: toId,
        OpenApiChannelConstants.queryParamAfter: after,
        OpenApiChannelConstants.queryParamFirst: first?.toString(),
      },
    );
  }
}
