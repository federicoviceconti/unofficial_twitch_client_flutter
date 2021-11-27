import 'dart:convert';

import 'package:http/http.dart';
import 'package:unofficial_twitch_http/models/http_result.dart';

class OpenApiGetVideosResponse extends BaseHttpResponse {
  List<VideoData> videoList;
  String? pagination;

  OpenApiGetVideosResponse({
    int? status,
    String? message,
    this.pagination,
    this.videoList = const [],
  });

  static OpenApiGetVideosResponse fromHttpResponse(Response response) {
    final json = jsonDecode(response.body);

    if (json != null) {
      return OpenApiGetVideosResponse.fromJson(json);
    } else {
      return OpenApiGetVideosResponse(
        status: response.statusCode,
        message: '',
      );
    }
  }

  static OpenApiGetVideosResponse fromJson(Map<String, dynamic>? json) {
    List<dynamic>? data = json?['data'];

    final List<VideoData> videoList = [];

    if (data != null) {
      for (var item in data) {
        final result = VideoData.fromJson(item);
        if (result != null) {
          videoList.add(result);
        }
      }
    }

    return OpenApiGetVideosResponse(
      videoList: videoList,
      message: json?['message'],
      status: json?['status'],
      pagination: json?['pagination']?['cursor'],
    );
  }
}

class VideoData {
  final String? id;
  final String? streamId;
  final String? userId;
  final String? userLogin;
  final String? userName;
  final String? title;
  final String? description;
  final String? createdAt;
  final String? publishedAt;
  final String? url;
  final String? thumbnailUrl;
  final String? viewable;
  final int? viewCount;
  final String? language;
  final String? type;
  final String? duration;
  final MutedSegment? mutedSegments;

  VideoData({
    this.id,
    this.streamId,
    this.userId,
    this.userLogin,
    this.userName,
    this.title,
    this.description,
    this.createdAt,
    this.publishedAt,
    this.url,
    this.thumbnailUrl,
    this.viewable,
    this.viewCount,
    this.language,
    this.type,
    this.duration,
    this.mutedSegments,
  });

  static VideoData? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;

    return VideoData(
      id: json['id'],
      streamId: json['stream_id'],
      userId: json['user_id'],
      userLogin: json['user_login'],
      userName: json['user_name'],
      title: json['title'],
      description: json['description'],
      createdAt: json['created_at'],
      publishedAt: json['published_at'],
      url: json['url'],
      thumbnailUrl: json['thumbnail_url'],
      viewable: json['viewable'],
      viewCount: json['view_count'],
      language: json['language'],
      type: json['type'],
      duration: json['duration'],
      mutedSegments: json['muted_segments'],
    );
  }
}

class MutedSegment {
  final int? duration;
  final int? offset;

  MutedSegment({
    this.duration,
    this.offset,
  });

  static MutedSegment? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;

    return MutedSegment(
      duration: json['duration'],
      offset: json['offset'],
    );
  }
}
