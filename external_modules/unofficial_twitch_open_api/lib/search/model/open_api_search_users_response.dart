import 'dart:convert';

import 'package:http/http.dart';
import 'package:unofficial_twitch_http/models/http_result.dart';

class OpenApiSearchUsersResponse extends BaseHttpResponse {
  final List<SearchUser> searchUserList;

  OpenApiSearchUsersResponse({
    int? status,
    String? message,
    this.searchUserList = const [],
  }) : super(
          status: status,
          message: message,
        );

  static OpenApiSearchUsersResponse fromJson(Map<String, dynamic> json) {
    List? data = json['data'];

    final searchUserList = <SearchUser>[];

    if (data != null) {
      for (var item in data) {
        searchUserList.add(SearchUser.fromJson(item));
      }
    }

    return OpenApiSearchUsersResponse(
      searchUserList: searchUserList,
      status: json['status'],
      message: json['message'],
    );
  }

  static OpenApiSearchUsersResponse fromHttpResponse(Response response) {
    final json = jsonDecode(response.body);

    if(json != null) {
      return OpenApiSearchUsersResponse.fromJson(json);
    } else {
      return OpenApiSearchUsersResponse(
        status: response.statusCode,
        message: '',
      );
    }
  }
}

class SearchUser {
  final String? id;
  final String? displayName;
  final String? login;
  final String? type;
  final String? broadcasterType;
  final String? description;
  final String? profileImageUrl;
  final String? offlineImageUrl;
  final int? viewCount;
  final String? email;
  final String? createdAt;

  SearchUser({
    this.id,
    this.displayName,
    this.login,
    this.type,
    this.broadcasterType,
    this.description,
    this.profileImageUrl,
    this.offlineImageUrl,
    this.viewCount,
    this.email,
    this.createdAt,
  });

  static SearchUser fromJson(Map<String, dynamic> json) {
    return SearchUser(
      id: json['id'],
      login: json['login'],
      type: json['type'],
      broadcasterType: json['broadcaster_type'],
      displayName: json['display_name'],
      description: json['description'],
      profileImageUrl: json['profile_image_url'],
      offlineImageUrl: json['offline_image_url'],
      viewCount: json['view_count'],
      email: json['email'],
      createdAt: json['created_at'],
    );
  }
}