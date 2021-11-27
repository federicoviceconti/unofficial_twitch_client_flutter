import 'dart:convert';

import 'package:unofficial_twitch_http/models/http_result.dart';
import 'package:http/http.dart';

class OpenApiGetBadgeResponse extends BaseHttpResponse {
  List<BadgeData> badgeDataList;

  OpenApiGetBadgeResponse({
    int? status,
    String? message,
    this.badgeDataList = const [],
  });

  static OpenApiGetBadgeResponse fromHttpResponse(Response response) {
    final json = jsonDecode(response.body);

    if (json != null) {
      return OpenApiGetBadgeResponse.fromJson(json);
    } else {
      return OpenApiGetBadgeResponse(
        status: response.statusCode,
        message: '',
      );
    }
  }

  static OpenApiGetBadgeResponse fromJson(Map<String, dynamic>? json) {
    List<dynamic>? data = json?['data'];

    final List<BadgeData> badgeDataList = [];

    if (data != null) {
      for (var item in data) {
        final result = BadgeData.fromJson(item);
        if (result != null) {
          badgeDataList.add(result);
        }
      }
    }

    return OpenApiGetBadgeResponse(
      badgeDataList: badgeDataList,
      message: json?['message'],
      status: json?['status'],
    );
  }
}

class BadgeData {
  final String? setId;
  final List<VersionData> versions;

  BadgeData({
    this.setId,
    this.versions = const [],
  });

  static BadgeData? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;

    return BadgeData(
      setId: json['set_id'],
      versions: VersionData.fromJsonList(json['versions']),
    );
  }
}

class VersionData {
  final String? id;
  final String? imageUrl1x;
  final String? imageUrl2x;
  final String? imageUrl4x;

  VersionData({
    this.id,
    this.imageUrl1x,
    this.imageUrl2x,
    this.imageUrl4x,
  });

  static List<VersionData> fromJsonList(List<dynamic>? field) {
    if(field == null) return <VersionData>[];

    final List<VersionData> versions = [];

    for (var item in field) {
      final result = VersionData.fromJson(item);

      if(result != null) {
        versions.add(result);
      }
    }

    return versions;
  }

  static VersionData? fromJson(Map<String, dynamic>? json) {
    if(json == null) return null;

    return VersionData(
      id: json['id'],
      imageUrl1x: json['image_url_1x'],
      imageUrl2x: json['image_url_2x'],
      imageUrl4x: json['image_url_4x'],
    );
  }
}
