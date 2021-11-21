abstract class AppConfig {
  String clientId;

  String redirect;

  String? accessToken;

  String? scope;

  String? tokenType;

  String? idToken;

  AppConfig({
    required this.clientId,
    required this.redirect,
  });

  void update({
    String? accessToken,
    String? idToken,
    String? scope,
    String? tokenType,
  });
}
