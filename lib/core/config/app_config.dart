abstract class AppConfig {
  String clientId;

  String redirect;

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
