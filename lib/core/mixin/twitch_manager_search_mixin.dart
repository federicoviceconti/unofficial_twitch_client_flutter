import 'package:provider/provider.dart';
import 'package:unofficial_twitch_http/models/http_result.dart';
import 'package:unofficial_twitch_mobile/utils/notifier/base_notifier.dart';
import 'package:unofficial_twitch_open_api/search/model/open_api_search_categories_response.dart';
import 'package:unofficial_twitch_open_api/search/model/open_api_search_channels_response.dart';
import 'package:unofficial_twitch_open_api/search/model/open_api_search_users_response.dart';
import 'package:unofficial_twitch_open_api/search/twitch_search.dart';
import 'package:unofficial_twitch_open_api/unofficial_twitch_open_api.dart';

mixin TwitchManagerSearchMixin on BaseNotifier {
  Future<HttpResult<OpenApiSearchUsersResponse>> searchByName(
      {required String name}) async {
    final instance = _getSearch();
    return instance.searchUser(login: name);
  }

  Future<HttpResult<OpenApiSearchChannelsResponse>> searchChannels({
    required String? query,
  }) {
    final instance = _getSearch();
    return instance.searchChannels(query: query);
  }

  Future<HttpResult<OpenApiSearchCategoriesResponse>> searchCategories({
    required String? query,
  }) {
    final instance = _getSearch();
    return instance.searchCategories(query: query);
  }

  TwitchSearch _getSearch() {
    final manager = Provider.of<TwitchManagerOpenApi>(
      navigation.navigationContext,
      listen: false,
    );

    return manager.of<TwitchSearch>(bearerToken: appConfig.accessToken);
  }
}
