import 'package:http/http.dart';
import 'package:unofficial_twitch_http/models/http_result.dart';

class OpenApiChannelUserFollow extends BaseHttpResponse {
  static fromHttpResponse(Response response) {
    return OpenApiChannelUserFollow();
  }
}
