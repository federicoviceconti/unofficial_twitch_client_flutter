This package allows to validate, revoke or authenticate your client using the newest Twitch API.

## Features

It contains the following methods:

- getLoginLink: used to retrieve the login link
- validate: the endpoint /oauth2/validate allows to validate the token retrieved
- revoke: the endpoint /oauth2/revoke allows to revoke the token

For more information see the
class [twitch_authentication.dart](https://github.com/federicoviceconti/unofficial_twitch_client_flutter/blob/master/external_modules/unofficial_twitch_auth/lib/twitch_authentication.dart)

## Getting started

- Go to the dev website: https://dev.twitch.tv
- Open "Your Console"
- Register a new application with: name, OAuth redirect and the category

When you finish to set it up, you will redirect to your app. Here you can your Client ID and secret
token (don't share to anyone!)

## Usage

You can use with Provider to retrieve the implementation instance:

```dart
List<SingleChildWidget> _initProvider() {
  return [
    ...
    Provider<TwitchAuthentication>(
      create: (ctx) => TwitchAuthenticationImpl(),
    ),
  ];
}
```

Or you can use get_it library to register your instance and its implementation:

```dart

GetIt getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<TwitchAuthentication>(
      TwitchAuthenticationImpl()
  );
}
```

## Additional information

If you want a real example, see
the [main app](https://github.com/federicoviceconti/unofficial_twitch_client_flutter)