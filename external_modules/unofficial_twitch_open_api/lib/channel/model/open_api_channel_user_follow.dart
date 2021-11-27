import 'dart:convert';

import 'package:http/http.dart';
import 'package:unofficial_twitch_http/models/http_result.dart';

class OpenApiChannelUserFollow extends BaseHttpResponse {
  int? total;
  List<UserFollow> userFollowList;
  String? pagination;

  OpenApiChannelUserFollow({
    int? status,
    String? message,
    this.pagination,
    this.userFollowList = const [],
    this.total,
  });

  static OpenApiChannelUserFollow fromHttpResponse(Response response) {
    final json = jsonDecode(response.body);

    if (json != null) {
      return OpenApiChannelUserFollow.fromJson(json);
    } else {
      return OpenApiChannelUserFollow(
        status: response.statusCode,
        message: '',
      );
    }
  }

  static OpenApiChannelUserFollow fromJson(Map<String, dynamic>? json) {
    List<dynamic>? data = json?['data'];

    final List<UserFollow> userFollowList = [];

    if (data != null) {
      for (var item in data) {
        final result = UserFollow.fromJson(item);
        if(result != null) {
          userFollowList.add(result);
        }
      }
    }

    return OpenApiChannelUserFollow(
      userFollowList: userFollowList,
      message: json?['message'],
      status: json?['status'],
      pagination: json?['pagination']?['cursor'],
      total: json?['total']
    );
  }
}

class UserFollow {
  final String? fromId;
  final String? fromLogin;
  final String? fromName;
  final String? toId;
  final String? toName;
  final String? followedAt;

  UserFollow({
    this.fromId,
    this.fromLogin,
    this.fromName,
    this.toId,
    this.toName,
    this.followedAt,
  });

  static UserFollow? fromJson(Map<String, dynamic>? json) {
    if(json == null) return null;

    return UserFollow(
      fromId: json['from_id'],
      fromLogin: json['from_login'],
      fromName: json['from_name'],
      toId: json['to_id'],
      toName: json['to_name'],
      followedAt: json['followed_at'],
    );
  }
}
