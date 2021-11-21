import 'package:http/http.dart';
import 'package:unofficial_twitch_http/models/http_result.dart';

class OpenApiChannelStreamSchedule extends BaseHttpResponse {
  static OpenApiChannelStreamSchedule fromHttpResponse(Response response) {
    return OpenApiChannelStreamSchedule();
  }

}