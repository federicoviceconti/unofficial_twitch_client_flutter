import 'dart:convert';

import 'package:unofficial_twitch_http/models/http_result.dart';
import 'package:http/http.dart';

class OpenApiGetChannelMediaResponse extends BaseHttpResponse {
  List<ChannelMediaData> channelMediaDataList;
  final String? template;

  OpenApiGetChannelMediaResponse({
    int? status,
    String? message,
    this.channelMediaDataList = const [],
    this.template,
  });

  static OpenApiGetChannelMediaResponse fromHttpResponse(Response response) {
    final json = jsonDecode(response.body);

    if (json != null) {
      return OpenApiGetChannelMediaResponse.fromJson(json);
    } else {
      return OpenApiGetChannelMediaResponse(
        status: response.statusCode,
        message: '',
      );
    }
  }

  static OpenApiGetChannelMediaResponse fromJson(Map<String, dynamic>? json) {
    List<dynamic>? data = json?['data'];

    final List<ChannelMediaData> channelMediaDataList = [];

    if (data != null) {
      for (var item in data) {
        final result = ChannelMediaData.fromJson(item);
        if (result != null) {
          channelMediaDataList.add(result);
        }
      }
    }

    return OpenApiGetChannelMediaResponse(
      channelMediaDataList: channelMediaDataList,
      message: json?['message'],
      status: json?['status'],
      template: json?['template'],
    );
  }
}

class ChannelMediaData {
  final String? id;
  final String? name;
  final ChannelEmoteImages? images;
  final String? tier;
  final EmoteType? emoteType;
  final String? emoteSetId;
  final List<String> format;
  final List<String> scale;
  final List<String> themeMode;

  ChannelMediaData({
    this.id,
    this.name,
    this.images,
    this.tier,
    this.emoteType,
    this.emoteSetId,
    this.format = const [],
    this.scale = const [],
    this.themeMode = const [],
  });

  static ChannelMediaData? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;

    return ChannelMediaData(
      id: json['id'],
      name: json['name'],
      images: ChannelEmoteImages.fromJson(json['images']),
      tier: json['tier'],
      emoteType: (json['emote_type'] as String?)?.type,
      emoteSetId: json['emote_set_id'],
      format: _getStringListFromField(json['format']),
      scale: _getStringListFromField(json['scale']),
      themeMode: _getStringListFromField(json['theme_mode']),
    );
  }

  static List<String> _getStringListFromField(List<dynamic>? field) {
    if (field == null) return [];

    return field.map((e) => e.toString()).toList();
  }
}

class ChannelEmoteImages {
  final String? url1x;
  final String? url2x;
  final String? url4x;

  ChannelEmoteImages({
    this.url1x,
    this.url2x,
    this.url4x,
  });

  static ChannelEmoteImages? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;

    return ChannelEmoteImages(
      url1x: json['url_1x'],
      url2x: json['url_2x'],
      url4x: json['url_4x'],
    );
  }
}

enum EmoteType {
  bitstier,
  follower,
  subscriptions,
  none,
}

extension EmoteTypeStringExt on String {
  EmoteType get type =>
      {
        'bitstier': EmoteType.bitstier,
        'follower': EmoteType.follower,
        'subscriptions': EmoteType.subscriptions,
      }[this] ??
      EmoteType.none;
}
