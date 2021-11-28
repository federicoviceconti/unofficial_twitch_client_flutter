import 'package:unofficial_twitch_http/models/http_result.dart';
import 'package:unofficial_twitch_mobile/utils/notifier/base_notifier.dart';
import 'package:unofficial_twitch_open_api/search/model/open_api_search_categories_response.dart';
import 'package:unofficial_twitch_open_api/search/model/open_api_search_channels_response.dart';
import 'package:unofficial_twitch_open_api/search/model/open_api_search_users_response.dart';
import 'package:unofficial_twitch_open_api/search/twitch_search.dart';

import 'base_twitch_manager_mixin.dart';

mixin TwitchManagerSearchMixin on BaseTwitchManagerMixin, BaseNotifier {
  Future<HttpResult<OpenApiSearchUsersResponse>> searchByName({
    required String name,
  }) async {
    final instance = getApiInstance<TwitchSearch>();
    return instance.searchUser(login: name);
  }

  Future<HttpResult<OpenApiSearchChannelsResponse>> searchChannels({
    required String query,
  }) {
    final instance = getApiInstance<TwitchSearch>();
    return instance.searchChannels(query: query);
  }

  Future<HttpResult<OpenApiSearchCategoriesResponse>> searchCategories({
    required String query,
  }) {
    final instance = getApiInstance<TwitchSearch>();
    return instance.searchCategories(query: query);
  }
}
