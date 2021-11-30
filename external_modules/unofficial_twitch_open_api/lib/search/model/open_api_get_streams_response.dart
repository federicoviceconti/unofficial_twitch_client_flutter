import 'dart:convert';

import 'package:http/http.dart';
import 'package:unofficial_twitch_http/models/http_result.dart';

class OpenApiGetStreamsResponse extends BaseHttpResponse {
  final List<StreamData> streamList;
  final String? pagination;

  OpenApiGetStreamsResponse({
    int? status,
    String? message,
    this.streamList = const [],
    this.pagination,
  }) : super(
          status: status,
          message: message,
        );

  static OpenApiGetStreamsResponse fromJson(Map<String, dynamic>? json) {
    List? data = json?['data'];

    final streamList = <StreamData>[];

    if (data != null) {
      for (var item in data) {
        final convertedItem = StreamData.fromJson(item);

        if(convertedItem != null) {
          streamList.add(convertedItem);
        }
      }
    }

    return OpenApiGetStreamsResponse(
      streamList: streamList,
      pagination: json?['pagination']?['cursor'],
      status: json?['status'],
      message: json?['message'],
    );
  }

  static OpenApiGetStreamsResponse fromHttpResponse(Response response) {
    final json = jsonDecode(response.body);

    if (json != null) {
      return OpenApiGetStreamsResponse.fromJson(json);
    } else {
      return OpenApiGetStreamsResponse(
        status: response.statusCode,
        message: '',
      );
    }
  }
}

class StreamData {
  final String? id;
  final String? userId;
  final String? userLogin;
  final String? userName;
  final String? gameId;
  final String? gameName;
  final String? type;
  final String? title;
  final int? viewerCount;
  final String? startedAt;
  final String? language;
  final String? thumbnailUrl;
  final List<String>? tagIds;
  final String? isMature;

  StreamData({
    this.id,
    this.userId,
    this.userLogin,
    this.userName,
    this.gameId,
    this.gameName,
    this.type,
    this.title,
    this.viewerCount,
    this.startedAt,
    this.language,
    this.thumbnailUrl,
    this.tagIds,
    this.isMature,
  });

  static StreamData? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;

    return StreamData(
      id: json['id'],
      userId: json['user_id'],
      userLogin: json['user_login'],
      userName: json['user_name'],
      gameId: json['game_id'],
      gameName: json['game_name'],
      type: json['type'],
      title: json['title'],
      viewerCount: json['viewer_count'],
      startedAt: json['started_at'],
      language: json['language'],
      thumbnailUrl: json['thumbnail_url'],
      tagIds: json['tag_ids'],
      isMature: json['is_mature'],
    );
  }
}
