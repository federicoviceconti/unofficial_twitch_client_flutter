import 'dart:convert';

import 'package:http/http.dart';
import 'package:unofficial_twitch_http/models/http_result.dart';

class OpenApiChannelInformationResponse extends BaseHttpResponse {
  final List<ChannelInformationResult> channelList;

  OpenApiChannelInformationResponse({
    int? status,
    String? message,
    this.channelList = const [],
  }) : super(
          status: status,
          message: message,
        );

  @override
  String toString() {
    return 'OpenApiChannelInformationResponse{channelList: $channelList}';
  }

  static OpenApiChannelInformationResponse fromJson(Map<String, dynamic> json) {
    List? data = json['data'];

    final channelInformationResults = <ChannelInformationResult>[];

    if (data != null) {
      for (var item in data) {
        var jsonConverted = ChannelInformationResult.fromJson(item);
        if(jsonConverted != null) {
          channelInformationResults.add(jsonConverted);
        }
      }
    }

    return OpenApiChannelInformationResponse(
      channelList: channelInformationResults,
      status: json['status'],
      message: json['message'],
    );
  }

  static OpenApiChannelInformationResponse fromHttpResponse(Response response) {
    final json = jsonDecode(response.body);

    if(json != null) {
      return OpenApiChannelInformationResponse.fromJson(json);
    } else {
      return OpenApiChannelInformationResponse(
        status: response.statusCode,
        message: '',
      );
    }
  }
}

class ChannelInformationResult {
  final String? id;
  final String? broadcasterId;
  final String? broadcasterLogin;
  final String? broadcasterName;
  final String? broadcasterLanguage;
  final String? gameId;
  final String? gameName;
  final String? title;
  final int? delay;

  ChannelInformationResult({
    this.id,
    this.broadcasterId,
    this.broadcasterLogin,
    this.broadcasterName,
    this.broadcasterLanguage,
    this.gameId,
    this.gameName,
    this.title,
    this.delay,
  });

  static ChannelInformationResult? fromJson(Map<String, dynamic>? json) {
    if(json == null) return null;

    return ChannelInformationResult(
      broadcasterLanguage: json['broadcaster_language'],
      broadcasterLogin: json['broadcaster_login'],
      broadcasterName: json['display_name'],
      gameId: json['game_id'],
      gameName: json['game_name'],
      id: json['id'],
      delay: json['delay'],
      title: json['title'],
      broadcasterId: json['broadcaster_id'],
    );
  }

  @override
  String toString() {
    return 'ChannelInformationResult{id: $id, broadcasterId: $broadcasterId, broadcasterLogin: $broadcasterLogin, broadcasterName: $broadcasterName, broadcasterLanguage: $broadcasterLanguage, gameId: $gameId, gameName: $gameName, title: $title, delay: $delay}';
  }
}
