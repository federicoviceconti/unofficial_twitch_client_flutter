import 'dart:convert';

import 'package:unofficial_twitch_http/models/http_result.dart';
import 'package:http/http.dart';

class OpenApiChannelTeamsResponse extends BaseHttpResponse {
  final List<TeamInfo> teams;

  OpenApiChannelTeamsResponse({
    this.teams = const [],
    int? status,
    String? message,
  }) : super(status: status, message: message);

  static OpenApiChannelTeamsResponse fromHttpResponse(Response response) {
    final json = jsonDecode(response.body);

    if (json != null) {
      return OpenApiChannelTeamsResponse.fromJson(json);
    } else {
      return OpenApiChannelTeamsResponse(
        status: response.statusCode,
        message: '',
      );
    }
  }

  static OpenApiChannelTeamsResponse fromJson(Map<String, dynamic>? json) {
    List<Map<String, dynamic>?>? teams = json?['data'];

    final List<TeamInfo> teamsToAdd = [];

    if (teams != null) {
      for (var team in teams) {
        final result = TeamInfo.fromJson(team);
        if (result != null) {
          teamsToAdd.add(result);
        }
      }
    }

    return OpenApiChannelTeamsResponse(
      teams: teamsToAdd,
      message: json?['message'],
      status: json?['status'],
    );
  }
}

class TeamInfo {
  final String? broadcasterId;
  final String? broadcasterLogin;
  final String? broadcasterName;
  final String? backgroundImageUrl;
  final String? banner;
  final String? createdAt;
  final String? updatedAt;
  final String? info;
  final String? thumbnailUrl;
  final String? teamName;
  final String? teamDisplayName;
  final String? id;

  TeamInfo({
    this.broadcasterId,
    this.broadcasterLogin,
    this.broadcasterName,
    this.backgroundImageUrl,
    this.banner,
    this.createdAt,
    this.updatedAt,
    this.info,
    this.thumbnailUrl,
    this.teamName,
    this.teamDisplayName,
    this.id,
  });

  static TeamInfo? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;

    return TeamInfo(
      broadcasterId: json['broadcaster_id'],
      broadcasterLogin: json['broadcaster_login'],
      broadcasterName: json['broadcaster_name'],
      backgroundImageUrl: json['background_image_url'],
      banner: json['banner'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      info: json['info'],
      thumbnailUrl: json['thumbnail_url'],
      teamName: json['team_name'],
      teamDisplayName: json['team_display_name'],
      id: json['id'],
    );
  }
}
