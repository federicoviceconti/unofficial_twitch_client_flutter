import 'dart:convert';

import 'package:unofficial_twitch_http/models/http_result.dart';
import 'package:http/http.dart';

class OpenApiGetGameResponse extends BaseHttpResponse {
  final List<GameData> gameList;
  final String? pagination;

  OpenApiGetGameResponse({
    int? status,
    String? message,
    this.gameList = const [],
    this.pagination,
  }) : super(
    status: status,
    message: message,
  );

  static OpenApiGetGameResponse fromJson(Map<String, dynamic>? json) {
    List? data = json?['data'];

    final topGameList = <GameData>[];

    if (data != null) {
      for (var item in data) {
        topGameList.add(GameData.fromJson(item));
      }
    }

    return OpenApiGetGameResponse(
      gameList: topGameList,
      pagination: json?['pagination']?['cursor'],
      status: json?['status'],
      message: json?['message'],
    );
  }

  static OpenApiGetGameResponse fromHttpResponse(Response response) {
    final json = jsonDecode(response.body);

    if(json != null) {
      return OpenApiGetGameResponse.fromJson(json);
    } else {
      return OpenApiGetGameResponse(
        status: response.statusCode,
        message: '',
      );
    }
  }
}

class GameData {
  final String? id;
  final String? name;
  final String? boxArtUrl;

  GameData({
    this.id,
    this.name,
    this.boxArtUrl,
  });

  static GameData fromJson(Map<String, dynamic> json) {
    return GameData(
      name: json['name'],
      boxArtUrl: json['box_art_url'],
      id: json['id'],
    );
  }
}
