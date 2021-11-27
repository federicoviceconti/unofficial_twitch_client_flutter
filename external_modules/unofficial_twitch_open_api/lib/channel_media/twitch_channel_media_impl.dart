import 'package:unofficial_twitch_http/models/http_result.dart';
import 'package:unofficial_twitch_open_api/channel_media/model/open_api_get_badge_response.dart';
import 'package:unofficial_twitch_open_api/channel_media/model/open_api_get_channel_emotes_response.dart';
import 'package:unofficial_twitch_open_api/channel_media/model/open_api_get_cheermotes_response.dart';
import 'package:unofficial_twitch_open_api/channel_media/model/open_api_get_clips_response.dart';
import 'package:unofficial_twitch_open_api/channel_media/model/open_api_get_videos_response.dart';
import 'package:unofficial_twitch_open_api/channel_media/twitch_channel_media.dart';
import 'package:unofficial_twitch_open_api/core/open_api_channel_constants.dart';

class TwitchChannelMediaImpl extends TwitchChannelMedia {
  TwitchChannelMediaImpl({
    String? token,
    String? clientId,
  }) : super(token, clientId);

  @override
  Future<HttpResult<OpenApiGetBadgeResponse>> getChannelChatBadges({
    required String broadcasterId,
  }) {
    return client.makeGet(
      OpenApiChannelConstants.getChannelChatBadgesEndpoint,
      convertBodyFunc: (response) =>
          OpenApiGetBadgeResponse.fromHttpResponse(response),
      queryParameters: {
        OpenApiChannelConstants.queryParamBroadcasterId: broadcasterId,
      },
      bearerToken: token,
      clientId: clientId,
    );
  }

  @override
  Future<HttpResult<OpenApiGetChannelMediaResponse>> getChannelEmotes({
    required String broadcasterId,
  }) {
    return client.makeGet(
        OpenApiChannelConstants.getChannelEmotesEndpoint,
      convertBodyFunc: (response) =>
          OpenApiGetChannelMediaResponse.fromHttpResponse(response),
      queryParameters: {
        OpenApiChannelConstants.queryParamBroadcasterId: broadcasterId,
      },
      bearerToken: token,
      clientId: clientId,
    );
  }

  @override
  Future<HttpResult<OpenApiGetCheermotesResponse>> getCheermotes({
    required String broadcasterId,
  }) {
    return client.makeGet(
      OpenApiChannelConstants.getCheermotesEndpoint,
      convertBodyFunc: (response) =>
          OpenApiGetCheermotesResponse.fromHttpResponse(response),
      queryParameters: {
        OpenApiChannelConstants.queryParamBroadcasterId: broadcasterId,
      },
      bearerToken: token,
      clientId: clientId,
    );
  }

  @override
  Future<HttpResult<OpenApiGetClipsResponse>> getClips({
    required String broadcasterId,
  }) {
    return client.makeGet(
      OpenApiChannelConstants.getClipsEndpoint,
      convertBodyFunc: (response) =>
          OpenApiGetClipsResponse.fromHttpResponse(response),
      queryParameters: {
        OpenApiChannelConstants.queryParamBroadcasterId: broadcasterId,
      },
      bearerToken: token,
      clientId: clientId,
    );
  }

  @override
  Future<HttpResult<OpenApiGetChannelMediaResponse>> getEmoteSets({
    required String emoteSetId,
  }) {
    return client.makeGet(
      OpenApiChannelConstants.getEmoteSetsEndpoint,
      convertBodyFunc: (response) =>
          OpenApiGetChannelMediaResponse.fromHttpResponse(response),
      queryParameters: {
        OpenApiChannelConstants.queryParamEmoteSetId: emoteSetId,
      },
      bearerToken: token,
      clientId: clientId,
    );
  }

  @override
  Future<HttpResult<OpenApiGetBadgeResponse>> getGlobalChatBadges() {
    return client.makeGet(
      OpenApiChannelConstants.getGlobalChatBadgesEndpoint,
      convertBodyFunc: (response) =>
          OpenApiGetBadgeResponse.fromHttpResponse(response),
      bearerToken: token,
      clientId: clientId,
    );
  }

  @override
  Future<HttpResult<OpenApiGetChannelMediaResponse>> getGlobalEmotes() {
    return client.makeGet(
      OpenApiChannelConstants.getGlobalEmotesEndpoint,
      convertBodyFunc: (response) =>
          OpenApiGetChannelMediaResponse.fromHttpResponse(response),
      bearerToken: token,
      clientId: clientId,
    );
  }

  @override
  Future<HttpResult<OpenApiGetVideosResponse>> getVideos({
    required String userId,
    String? after,
    String? before,
    String? first,
    String? language,
    String? period,
    String? sort,
    String? type,
  }) {
    return client.makeGet(
      OpenApiChannelConstants.getVideosEndpoint,
      convertBodyFunc: (response) =>
          OpenApiGetVideosResponse.fromHttpResponse(response),
      queryParameters: {
        OpenApiChannelConstants.queryParamUserId: userId,
        OpenApiChannelConstants.queryParamAfter: after,
        OpenApiChannelConstants.queryParamBefore: before,
        OpenApiChannelConstants.queryParamFirst: first,
        OpenApiChannelConstants.queryParamLanguage: language,
        OpenApiChannelConstants.queryParamPeriod: period,
        OpenApiChannelConstants.queryParamSort: sort,
        OpenApiChannelConstants.queryParamType: type,
      },
      bearerToken: token,
      clientId: clientId,
    );
  }
}
