# unofficial_twitch_mobile

An unofficial Flutter client, which use the newest Twitch API and provider 
for state management.

## Configuration

### Create an app on Twitch Dev console

- Go to the dev website: https://dev.twitch.tv
- Open "Your Console"
- Register a new application with: name, OAuth redirect and the category

When you finish to set it up, you will redirect to your app. Here you can your 
Client ID and secret token (don't share to anyone!)

### Configure environment variables

In order to make it work the newest Twitch API, we need to set: client_id, redirect.
This app use environment variables via "--dart-define" arguments.

Example:
flutter run --dart-define=CLIENT_ID={client_id} --dart-define=REDIRECT={redirect}

This variable, will be set on the lib/main.dart file.