import 'package:unofficial_twitch_mobile/core/mixin/base_twitch_manager_mixin.dart';
import 'package:unofficial_twitch_mobile/utils/notifier/base_notifier.dart';
import 'package:unofficial_twitch_open_api/channel_media/model/open_api_get_badge_response.dart';
import 'package:unofficial_twitch_open_api/channel_media/model/open_api_get_channel_emotes_response.dart';
import 'package:unofficial_twitch_open_api/channel_media/model/open_api_get_cheermotes_response.dart';
import 'package:unofficial_twitch_open_api/channel_media/model/open_api_get_clips_response.dart';
import 'package:unofficial_twitch_open_api/channel_media/model/open_api_get_videos_response.dart';
import 'package:unofficial_twitch_open_api/channel_media/twitch_channel_media.dart';

mixin TwitchManagerChannelMediaMixin on BaseTwitchManagerMixin, BaseNotifier {
  Future<List<BadgeData>> getGlobalChatBadges() async {
    final instance = getApiInstance<TwitchChannelMedia>();
    final response = await instance.getGlobalChatBadges();

    return response.result?.badgeDataList ?? [];
  }

  Future<List<ChannelMediaData>> getGlobalEmotes() async {
    final instance = getApiInstance<TwitchChannelMedia>();
    final response = await instance.getGlobalEmotes();

    return response.result?.channelMediaDataList ?? [];
  }

  Future<List<VideoData>> getVideos({
    required String userId,
    String? after,
    String? before,
    String? first,
    String? language,
    String? period,
    String? sort,
    String? type,
  }) async {
    final instance = getApiInstance<TwitchChannelMedia>();
    final response = await instance.getVideos(
      userId: userId,
      after: after,
      before: before,
      first: first,
      language: language,
      period: period,
      sort: sort,
      type: type,
    );

    return response.result?.videoList ?? [];
  }

  Future<List<ClipsData>> getClips({
    required String broadcasterId,
  }) async {
    final instance = getApiInstance<TwitchChannelMedia>();
    final response = await instance.getClips(
      broadcasterId: broadcasterId,
    );

    return response.result?.clipsDataList ?? [];
  }

  Future<List<BadgeData>> getChannelChatBadges({
    required String broadcasterId,
  }) async {
    final instance = getApiInstance<TwitchChannelMedia>();
    final response = await instance.getChannelChatBadges(
      broadcasterId: broadcasterId,
    );

    return response.result?.badgeDataList ?? [];
  }

  Future<List<ChannelMediaData>> getEmoteSets({
    required String emoteSetId,
  }) async {
    final instance = getApiInstance<TwitchChannelMedia>();
    final response = await instance.getEmoteSets(
      emoteSetId: emoteSetId,
    );

    return response.result?.channelMediaDataList ?? [];
  }

  Future<List<ChannelMediaData>> getChannelEmotes({
    required String broadcasterId,
  }) async {
    final instance = getApiInstance<TwitchChannelMedia>();
    final response = await instance.getChannelEmotes(
      broadcasterId: broadcasterId,
    );

    return response.result?.channelMediaDataList ?? [];
  }

  Future<List<CheermoteData>> getCheermotes({
    required String broadcasterId,
  }) async {
    final instance = getApiInstance<TwitchChannelMedia>();
    final response = await instance.getCheermotes(
      broadcasterId: broadcasterId,
    );

    return response.result?.cheermoteDataList ?? [];
  }
}
