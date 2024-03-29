# 🏆 unofficial_twitch_client_flutter

An unofficial Flutter client, which use the newest Twitch API and provider for state management.

Support null safety!

Now available on pub.dev:
- unofficial_twitch_open_api: https://pub.dev/packages/unofficial_twitch_open_api
- unofficial_twitch_auth: https://pub.dev/packages/unofficial_twitch_auth
- unofficial_twitch_http: https://pub.dev/packages/unofficial_twitch_http

## 💻 Configuration

### Create an app on Twitch Dev console

- Go to the dev website: https://dev.twitch.tv
- Open "Your Console"
- Register a new application with: name, OAuth redirect and the category

When you finish to set it up, you will redirect to your app. Here you can your Client ID and secret
token (don't share to anyone!)

### Configure environment variables

In order to make it work the newest Twitch API, we need to set: client_id, redirect. This app use
environment variables via "--dart-define" arguments.

**Example:**
```
flutter run --dart-define=CLIENT_ID={client_id} --dart-define=REDIRECT={redirect}
```

For the redirect you can use for example http://localhost.
The Client ID is the one generated on the Twitch Dev console.

This variable, will be set on
the [lib/main.dart](https://github.com/federicoviceconti/unofficial_twitch_client_flutter/blob/master/lib/main.dart#L43)
file.

### 📦 External packages

This app depends on the following packages (you can find them on the external_modules folder):

- [unofficial_twitch_auth](https://github.com/federicoviceconti/unofficial_twitch_client_flutter/tree/master/external_modules/unofficial_twitch_auth)
- [unofficial_twitch_http](https://github.com/federicoviceconti/unofficial_twitch_client_flutter/tree/master/external_modules/unofficial_twitch_http)
- [unofficial_twitch_navigation](https://github.com/federicoviceconti/unofficial_twitch_client_flutter/tree/master/external_modules/unofficial_twitch_navigation)
- [unofficial_twitch_open_api](https://github.com/federicoviceconti/unofficial_twitch_client_flutter/tree/master/external_modules/unofficial_twitch_open_api)
- [unofficial_twitch_store_local](https://github.com/federicoviceconti/unofficial_twitch_client_flutter/tree/master/external_modules/unofficial_twitch_store_local)
