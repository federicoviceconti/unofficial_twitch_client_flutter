import 'dart:convert';

import 'package:http/http.dart';
import 'package:unofficial_twitch_http/models/http_result.dart';

class OpenApiSearchCategoriesResponse extends BaseHttpResponse {
  final List<SearchCategory> searchCategoryList;
  final String? pagination;

  OpenApiSearchCategoriesResponse({
    int? status,
    String? message,
    this.searchCategoryList = const [],
    this.pagination,
  }) : super(
    status: status,
    message: message,
  );

  static OpenApiSearchCategoriesResponse fromJson(Map<String, dynamic> json) {
    List? data = json['data'];

    final searchCategoryList = <SearchCategory>[];

    if (data != null) {
      for (var item in data) {
        searchCategoryList.add(SearchCategory.fromJson(item));
      }
    }

    return OpenApiSearchCategoriesResponse(
      searchCategoryList: searchCategoryList,
      pagination: json['pagination']?['cursor'],
      status: json['status'],
      message: json['message'],
    );
  }

  static OpenApiSearchCategoriesResponse fromHttpResponse(Response response) {
    final json = jsonDecode(response.body);

    if(json != null) {
      return OpenApiSearchCategoriesResponse.fromJson(json);
    } else {
      return OpenApiSearchCategoriesResponse(
        status: response.statusCode,
        message: '',
      );
    }
  }
}

class SearchCategory {
  final String? id;
  final String? name;
  final String? boxArtUrl;

  SearchCategory({
    this.id,
    this.name,
    this.boxArtUrl,
  });

  static SearchCategory fromJson(Map<String, dynamic> json) {
    return SearchCategory(
      name: json['name'],
      boxArtUrl: json['box_art_url'],
      id: json['id'],
    );
  }
}
