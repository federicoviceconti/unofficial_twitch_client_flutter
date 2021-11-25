import 'package:unofficial_twitch_open_api/channel/twitch_channel_information.dart';
import 'package:unofficial_twitch_open_api/channel/twitch_channel_information_impl.dart';
import 'package:unofficial_twitch_open_api/core/base_twitch_open_api.dart';
import 'package:unofficial_twitch_open_api/search/twitch_search.dart';
import 'package:unofficial_twitch_open_api/search/twitch_search_impl.dart';

class TwitchManagerOpenApi {
  static TwitchManagerOpenApi? _instance;

  String? clientId;

  TwitchManagerOpenApi._({
    required this.clientId,
  });

  factory TwitchManagerOpenApi({
    required String? clientId,
  }) {
    _instance ??= TwitchManagerOpenApi._(clientId: clientId);
    return _instance!;
  }

  /// Return an instance of subclass [BaseTwitchOpenApi]
  /// Class type available:
  /// - TwitchChannelInformation
  /// - TwitchSearch
  ///
  /// @return subclass of [BaseTwitchOpenApi]
  T of<T extends BaseTwitchOpenApi>({required String? bearerToken}) {
    if (T == TwitchChannelInformation) {
      return TwitchChannelInformationImpl(
        clientId: clientId,
        token: bearerToken,
      ) as T;
    } else if (T == TwitchSearch) {
      return TwitchSearchImpl(
        clientId: clientId,
        token: bearerToken,
      ) as T;
    }

    throw UnsupportedError(
        'typeof($T) is not implemented in TwitchManagerOpenApi.getInstance');
  }
}
