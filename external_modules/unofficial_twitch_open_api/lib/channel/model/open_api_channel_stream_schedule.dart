import 'dart:convert';

import 'package:http/http.dart';
import 'package:unofficial_twitch_http/models/http_result.dart';

class OpenApiChannelStreamSchedule extends BaseHttpResponse {
  final List<SegmentResult> segmentResultList;
  final String? broadcasterId;
  final String? broadcasterName;
  final String? broadcasterLogin;
  final VacationResult? vacation;

  OpenApiChannelStreamSchedule({
    this.segmentResultList = const [],
    this.broadcasterId,
    this.broadcasterName,
    this.broadcasterLogin,
    this.vacation,
    int? status,
    String? message,
  }): super(status: status, message: message);

  static OpenApiChannelStreamSchedule fromHttpResponse(Response response) {
    final json = jsonDecode(response.body);

    if(json != null) {
      return OpenApiChannelStreamSchedule.fromJson(json);
    } else {
      return OpenApiChannelStreamSchedule(
        status: response.statusCode,
        message: '',
      );
    }
  }

  static OpenApiChannelStreamSchedule fromJson(Map<String, dynamic>? json) {
    final segments = json?['data']?['segments'];

    final List<SegmentResult> segmentResultList = [];

    if (segments != null) {
      segmentResultList.addAll(
          segments.map((segment) => SegmentResult.fromJson(segment)).toList());
    }

    return OpenApiChannelStreamSchedule(
      segmentResultList: segmentResultList,
      broadcasterId: json?['broadcaster_id'],
      broadcasterName: json?['broadcaster_name'],
      broadcasterLogin: json?['broadcaster_login'],
      vacation: VacationResult.fromJson(json?['vacation']),
    );
  }
}

class SegmentResult {
  final String? id;

  final String? startTime;

  final String? endTime;

  final String? title;

  final String? canceledUntil;

  final String? category;

  SegmentResult({
    this.id,
    this.startTime,
    this.endTime,
    this.title,
    this.canceledUntil,
    this.category,
  });

  static SegmentResult? fromJson(Map<String, dynamic>? json) {
    if(json == null) return null;

    return SegmentResult(
      id: json['id'],
      startTime: json['start_time'],
      endTime: json['end_time'],
      title: json['title'],
      canceledUntil: json['canceled_until'],
      category: json['category'],
    );
  }
}

class VacationResult {
  final String? startTime;
  final String? endTime;

  VacationResult({
    this.startTime,
    this.endTime,
  });

  static VacationResult? fromJson(Map<String, dynamic>? json) {
    if(json == null) return null;

    return VacationResult(
      startTime: json['start_time'],
      endTime: json['end_time'],
    );
  }
}
