import 'package:unofficial_twitch_http/models/http_result.dart';
import 'package:unofficial_twitch_open_api/core/open_api_channel_constants.dart';
import 'package:unofficial_twitch_open_api/search/model/open_api_search_categories_response.dart';
import 'package:unofficial_twitch_open_api/search/model/open_api_search_channels_response.dart';
import 'package:unofficial_twitch_open_api/search/model/open_api_search_users_response.dart';
import 'package:unofficial_twitch_open_api/search/twitch_search.dart';

class TwitchSearchImpl extends TwitchSearch {
  TwitchSearchImpl({
    required String? token,
    required String? clientId,
  }) : super(token, clientId);

  @override
  Future<HttpResult<OpenApiSearchCategoriesResponse>> searchCategories({
    required String query,
    int? first,
    String? after,
  }) {
    return client.makeGet(
      OpenApiChannelConstants.searchCategoriesEndpoint,
      convertBodyFunc: (response) =>
          OpenApiSearchCategoriesResponse.fromHttpResponse(response),
      queryParameters: {
        OpenApiChannelConstants.queryParamQuery: query,
        OpenApiChannelConstants.queryParamFirst: first?.toString(),
        OpenApiChannelConstants.queryParamAfter: after,
      },
      bearerToken: token,
      clientId: clientId,
    );
  }

  @override
  Future<HttpResult<OpenApiSearchChannelsResponse>> searchChannels({
    required String query,
    int? first,
    String? after,
    bool? isLive,
  }) {
    return client.makeGet(
      OpenApiChannelConstants.searchChannelsEndpoint,
      convertBodyFunc: (response) =>
          OpenApiSearchChannelsResponse.fromHttpResponse(response),
      queryParameters: {
        OpenApiChannelConstants.queryParamQuery: query,
        OpenApiChannelConstants.queryParamFirst: first?.toString(),
        OpenApiChannelConstants.queryParamAfter: after,
        OpenApiChannelConstants.queryParamIsLive: isLive?.toString(),
      },
      bearerToken: token,
      clientId: clientId,
    );
  }

  @override
  Future<HttpResult<OpenApiSearchUsersResponse>> searchUser({
    int? id,
    String? login,
  }) {
    return client.makeGet(
      OpenApiChannelConstants.searchUsersEndpoint,
      convertBodyFunc: (response) =>
          OpenApiSearchUsersResponse.fromHttpResponse(response),
      queryParameters: {
        OpenApiChannelConstants.queryParamId: id?.toString(),
        OpenApiChannelConstants.queryParamLogin: login,
      },
      bearerToken: token,
      clientId: clientId,
    );
  }
}
