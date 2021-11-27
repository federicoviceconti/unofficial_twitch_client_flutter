import 'package:provider/provider.dart';
import 'package:unofficial_twitch_http/models/http_result.dart';
import 'package:unofficial_twitch_mobile/utils/notifier/base_notifier.dart';
import 'package:unofficial_twitch_open_api/channel_information/model/open_api_channel_information_response.dart';
import 'package:unofficial_twitch_open_api/channel_information/model/open_api_channel_user_follow_response.dart';
import 'package:unofficial_twitch_open_api/channel_information/twitch_channel_information.dart';
import 'package:unofficial_twitch_open_api/unofficial_twitch_open_api.dart';

mixin TwitchManagerInformationMixin on BaseNotifier {
  Future<HttpResult<OpenApiChannelUserFollowResponse>> getUsersFollow({
    required String toId,
    required String fromId,
  }) {
    final channelInfo = _getChannelInformation();
    return channelInfo.getUsersFollow(toId: toId, fromId: fromId);
  }

  Future<HttpResult<OpenApiChannelInformationResponse>> getChannelInfo({
    required String broadcasterId,
  }) {
    final channelInfo = _getChannelInformation();
    return channelInfo.getChannelInformation(broadcasterId: broadcasterId);
  }

  TwitchChannelInformation _getChannelInformation() {
    final manager = Provider.of<TwitchManagerOpenApi>(
      navigation.navigationContext,
      listen: false,
    );

    return manager.of<TwitchChannelInformation>(
      bearerToken: appConfig.accessToken,
    );
  }
}
