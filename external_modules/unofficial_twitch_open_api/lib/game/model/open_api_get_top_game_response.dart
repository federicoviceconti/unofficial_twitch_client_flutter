import 'dart:convert';

import 'package:unofficial_twitch_http/models/http_result.dart';
import 'package:http/http.dart';

class OpenApiGetTopGameResponse extends BaseHttpResponse {
  final List<TopGameData> topGameList;
  final String? pagination;

  OpenApiGetTopGameResponse({
    int? status,
    String? message,
    this.topGameList = const [],
    this.pagination,
  }) : super(
    status: status,
    message: message,
  );

  static OpenApiGetTopGameResponse fromJson(Map<String, dynamic>? json) {
    List? data = json?['data'];

    final topGameList = <TopGameData>[];

    if (data != null) {
      for (var item in data) {
        topGameList.add(TopGameData.fromJson(item));
      }
    }

    return OpenApiGetTopGameResponse(
      topGameList: topGameList,
      pagination: json?['pagination']?['cursor'],
      status: json?['status'],
      message: json?['message'],
    );
  }

  static OpenApiGetTopGameResponse fromHttpResponse(Response response) {
    final json = jsonDecode(response.body);

    if(json != null) {
      return OpenApiGetTopGameResponse.fromJson(json);
    } else {
      return OpenApiGetTopGameResponse(
        status: response.statusCode,
        message: '',
      );
    }
  }
}

class TopGameData {
  final String? id;
  final String? name;
  final String? boxArtUrl;

  TopGameData({
    this.id,
    this.name,
    this.boxArtUrl,
  });

  static TopGameData fromJson(Map<String, dynamic> json) {
    return TopGameData(
      name: json['name'],
      boxArtUrl: json['box_art_url'],
      id: json['id'],
    );
  }
}
