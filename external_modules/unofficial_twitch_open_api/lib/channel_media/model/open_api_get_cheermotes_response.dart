import 'dart:convert';

import 'package:unofficial_twitch_http/models/http_result.dart';
import 'package:http/http.dart';

class OpenApiGetCheermotesResponse extends BaseHttpResponse {
  List<CheermoteData> cheermoteDataList;
  String? pagination;

  OpenApiGetCheermotesResponse({
    int? status,
    String? message,
    this.pagination,
    this.cheermoteDataList = const [],
  });

  static OpenApiGetCheermotesResponse fromHttpResponse(Response response) {
    final json = jsonDecode(response.body);

    if (json != null) {
      return OpenApiGetCheermotesResponse.fromJson(json);
    } else {
      return OpenApiGetCheermotesResponse(
        status: response.statusCode,
        message: '',
      );
    }
  }

  static OpenApiGetCheermotesResponse fromJson(Map<String, dynamic>? json) {
    List<dynamic>? data = json?['data'];

    final List<CheermoteData> cheermoteDataList = [];

    if (data != null) {
      for (var item in data) {
        final result = CheermoteData.fromJson(item);
        if (result != null) {
          cheermoteDataList.add(result);
        }
      }
    }

    return OpenApiGetCheermotesResponse(
      cheermoteDataList: cheermoteDataList,
      message: json?['message'],
      status: json?['status'],
      pagination: json?['pagination']?['cursor'],
    );
  }
}

class CheermoteData {
  final String? prefix;
  final List<CheermoteTierData> tiers;
  final String? type;
  final String? order;
  final String? lastUpdated;
  final String? isCharitable;

  CheermoteData({
    this.prefix,
    this.tiers = const [],
    this.type,
    this.order,
    this.lastUpdated,
    this.isCharitable,
  });

  static CheermoteData? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;

    return CheermoteData(
      prefix: json['prefix'],
      tiers: CheermoteTierData.fromListJson(json['tiers']),
      type: json['type'],
      order: json['order'],
      lastUpdated: json['last_updated'],
      isCharitable: json['is_charitable'],
    );
  }
}

class CheermoteTierData {
  final String? minBits;
  final String? id;
  final String? color;
  final CheermoteImage? images;
  final String? canCheer;
  final String? showInBitsCard;

  CheermoteTierData({
    this.minBits,
    this.id,
    this.color,
    this.images,
    this.canCheer,
    this.showInBitsCard,
  });

  static List<CheermoteTierData> fromListJson(List<dynamic>? json) {
    if (json == null) return [];

    List<CheermoteTierData> list = [];

    for (var element in json) {
      if (element != null) {
        final data = CheermoteTierData.fromJson(element);

        if (data != null) {
          list.add(data);
        }
      }
    }

    return list;
  }

  static CheermoteTierData? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;

    return CheermoteTierData(
      minBits: json['min_bits'],
      id: json['id'],
      color: json['color'],
      images: CheermoteImage.fromJson(json['images']),
      canCheer: json['can_cheer'],
      showInBitsCard: json['show_in_bits_card'],
    );
  }
}

class CheermoteImage {
  final ThemeImage? light;
  final ThemeImage? dark;

  CheermoteImage({
    this.light,
    this.dark,
  });

  static CheermoteImage? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;

    return CheermoteImage(
      light: ThemeImage.fromJson(json['light']),
      dark: ThemeImage.fromJson(json['dark']),
    );
  }
}

class ThemeImage {
  final ImageUrls? animated;
  final ImageUrls? static;

  ThemeImage({
    this.animated,
    this.static,
  });

  static ThemeImage? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;

    return ThemeImage(
      animated: ImageUrls.fromJson(json['animated']),
      static: ImageUrls.fromJson(json['static']),
    );
  }
}

class ImageUrls {
  final String? x1;
  final String? x1_5;
  final String? x2;
  final String? x3;
  final String? x4;

  ImageUrls({
    this.x1,
    this.x1_5,
    this.x2,
    this.x3,
    this.x4,
  });

  static ImageUrls? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;

    return ImageUrls(
      x1: json['1'],
      x1_5: json['1.5'],
      x2: json['2'],
      x3: json['3'],
      x4: json['4'],
    );
  }
}
