import 'dart:convert';

import 'package:http/http.dart';
import 'package:unofficial_twitch_http/models/http_result.dart';

class OpenApiSearchChannelsResponse extends BaseHttpResponse {
  final List<SearchChannel> searchChannelList;
  final String? pagination;

  OpenApiSearchChannelsResponse({
    int? status,
    String? message,
    this.searchChannelList = const [],
    this.pagination,
  }) : super(
          status: status,
          message: message,
        );

  @override
  String toString() {
    return 'OpenApiSearchChannelsResponse{searchChannelList: $searchChannelList, pagination: $pagination}';
  }

  static OpenApiSearchChannelsResponse fromJson(Map<String, dynamic> json) {
    List? data = json['data'];

    final searchChannelList = <SearchChannel>[];

    if (data != null) {
      for (var item in data) {
        searchChannelList.add(SearchChannel.fromJson(item));
      }
    }

    return OpenApiSearchChannelsResponse(
      searchChannelList: searchChannelList,
      pagination: json['pagination']?['cursor'],
      status: json['status'],
      message: json['message'],
    );
  }

  static OpenApiSearchChannelsResponse fromHttpResponse(Response response) {
    final json = jsonDecode(response.body);

    if(json != null) {
      return OpenApiSearchChannelsResponse.fromJson(json);
    } else {
      return OpenApiSearchChannelsResponse(
        status: response.statusCode,
        message: '',
      );
    }
  }
}

class SearchChannel {
  final String? id;
  final String? broadcasterLanguage;
  final String? broadcasterLogin;
  final String? displayName;
  final String? gameId;
  final String? gameName;
  final bool? isLive;
  final List<String>? tagsIds;
  final String? thumbnailUrl;
  final String? title;
  final String? startedAt;

  SearchChannel({
    this.id,
    this.broadcasterLanguage,
    this.broadcasterLogin,
    this.displayName,
    this.gameId,
    this.gameName,
    this.isLive,
    this.tagsIds,
    this.thumbnailUrl,
    this.title,
    this.startedAt,
  });

  static SearchChannel fromJson(Map<String, dynamic> json) {
    final tagIds = json['tags_ids']?.map((it) => it).toList();

    return SearchChannel(
      broadcasterLanguage: json['broadcaster_language'],
      broadcasterLogin: json['broadcaster_login'],
      displayName: json['display_name'],
      gameId: json['game_id'],
      gameName: json['game_name'],
      id: json['id'],
      isLive: json['is_live'],
      tagsIds: tagIds,
      thumbnailUrl: json['thumbnail_url'],
      title: json['title'],
      startedAt: json['started_at'],
    );
  }

  @override
  String toString() {
    return 'SearchChannel{id: $id, broadcasterLanguage: $broadcasterLanguage, broadcasterLogin: $broadcasterLogin, displayName: $displayName, gameId: $gameId, gameName: $gameName, isLive: $isLive, tagsIds: $tagsIds, thumbnailUrl: $thumbnailUrl, title: $title, startedAt: $startedAt}';
  }
}
