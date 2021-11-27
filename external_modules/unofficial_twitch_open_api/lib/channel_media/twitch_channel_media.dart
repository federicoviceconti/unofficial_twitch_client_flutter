import 'package:unofficial_twitch_http/models/http_result.dart';
import 'package:unofficial_twitch_open_api/channel_media/model/open_api_get_badge_response.dart';
import 'package:unofficial_twitch_open_api/channel_media/model/open_api_get_channel_emotes_response.dart';
import 'package:unofficial_twitch_open_api/channel_media/model/open_api_get_cheermotes_response.dart';
import 'package:unofficial_twitch_open_api/channel_media/model/open_api_get_clips_response.dart';
import 'package:unofficial_twitch_open_api/channel_media/model/open_api_get_videos_response.dart';
import 'package:unofficial_twitch_open_api/core/base_twitch_open_api.dart';

abstract class TwitchChannelMedia extends BaseTwitchOpenApi {
  TwitchChannelMedia(String? token, String? clientId) : super(token, clientId);

  /// Docs: https://dev.twitch.tv/docs/api/reference#get-cheermotes
  Future<HttpResult<OpenApiGetCheermotesResponse>> getCheermotes({
    required String broadcasterId,
  });

  /// Docs: https://dev.twitch.tv/docs/api/reference#get-channel-emotes
  Future<HttpResult<OpenApiGetChannelMediaResponse>> getChannelEmotes({
    required String broadcasterId,
  });

  /// Docs: https://dev.twitch.tv/docs/api/reference#get-emote-sets
  Future<HttpResult<OpenApiGetChannelMediaResponse>> getEmoteSets({
    required String emoteSetId,
  });

  /// Docs: https://dev.twitch.tv/docs/api/reference#get-channel-chat-badges
  Future<HttpResult<OpenApiGetBadgeResponse>> getChannelChatBadges({
    required String broadcasterId,
  });

  /// Docs: https://dev.twitch.tv/docs/api/reference#get-clips
  Future<HttpResult<OpenApiGetClipsResponse>> getClips({
    required String broadcasterId,
  });

  /// Docs: https://dev.twitch.tv/docs/api/reference#get-videos
  Future<HttpResult<OpenApiGetVideosResponse>> getVideos({
    required String userId,
    String? after,
    String? before,
    String? first,
    String? language,
    String? period,
    String? sort,
    String? type,
  });

  /// Docs: https://dev.twitch.tv/docs/api/reference#get-global-emotes
  Future<HttpResult<OpenApiGetChannelMediaResponse>> getGlobalEmotes();

  /// Docs: https://dev.twitch.tv/docs/api/reference#get-global-chat-badges
  Future<HttpResult<OpenApiGetBadgeResponse>> getGlobalChatBadges();
}
