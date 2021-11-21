import 'package:http/http.dart';
import 'package:unofficial_twitch_http/models/http_result.dart';

class OpenApiChannelInformationResponse extends BaseHttpResponse {
  static OpenApiChannelInformationResponse fromHttpResponse(Response response) {
    return OpenApiChannelInformationResponse();
  }
}
