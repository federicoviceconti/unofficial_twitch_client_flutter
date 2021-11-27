import 'dart:convert';

import 'package:unofficial_twitch_http/models/http_result.dart';
import 'package:http/http.dart';

class OpenApiGetClipsResponse extends BaseHttpResponse {
  List<ClipsData> clipsDataList;

  OpenApiGetClipsResponse({
    int? status,
    String? message,
    this.clipsDataList = const [],
  });

  static OpenApiGetClipsResponse fromHttpResponse(Response response) {
    final json = jsonDecode(response.body);

    if (json != null) {
      return OpenApiGetClipsResponse.fromJson(json);
    } else {
      return OpenApiGetClipsResponse(
        status: response.statusCode,
        message: '',
      );
    }
  }

  static OpenApiGetClipsResponse fromJson(Map<String, dynamic>? json) {
    List<dynamic>? data = json?['data'];

    final List<ClipsData> clipsDataList = [];

    if (data != null) {
      for (var item in data) {
        final result = ClipsData.fromJson(item);
        if (result != null) {
          clipsDataList.add(result);
        }
      }
    }

    return OpenApiGetClipsResponse(
      clipsDataList: clipsDataList,
      message: json?['message'],
      status: json?['status'],
    );
  }
}

class ClipsData {
  final String? id;
  final String? url;
  final String? embedUrl;
  final String? broadcasterId;
  final String? broadcasterName;
  final String? creatorId;
  final String? creatorName;
  final String? videoId;
  final String? gameId;
  final String? language;
  final String? title;
  final int? viewCount;
  final String? createdAt;
  final String? thumbnailUrl;
  final int? duration;

  ClipsData({
    this.id,
    this.url,
    this.embedUrl,
    this.broadcasterId,
    this.broadcasterName,
    this.creatorId,
    this.creatorName,
    this.videoId,
    this.gameId,
    this.language,
    this.title,
    this.viewCount,
    this.createdAt,
    this.thumbnailUrl,
    this.duration,
  });

  static ClipsData? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;

    return ClipsData(
      id: json['id'],
      url: json['url'],
      embedUrl: json['embed_url'],
      broadcasterId: json['broadcaster_id'],
      broadcasterName: json['broadcaster_name'],
      creatorId: json['creator_id'],
      creatorName: json['creator_name'],
      videoId: json['video_id'],
      gameId: json['game_id'],
      language: json['language'],
      title: json['title'],
      viewCount: json['view_count'],
      createdAt: json['created_at'],
      thumbnailUrl: json['thumbnail_url'],
      duration: json['duration'],
    );
  }
}
