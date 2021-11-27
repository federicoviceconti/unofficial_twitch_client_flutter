class TwitchAuthenticationConstants {
  static const String baseUrl = "https://id.twitch.tv";

  static const String validateEndpoint = "/oauth2/validate";
  static const String revokeEndpoint = "/oauth2/revoke";
  static const String tokenEndpoint = "/oauth2/token";

  static const String authorizationHeader = 'Authorization';

  static const String tokenParam = 'token';
  static const String clientIdParam = 'client_id';
}