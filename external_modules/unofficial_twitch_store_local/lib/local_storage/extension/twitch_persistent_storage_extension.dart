import '../twitch_persistent_storage_data.dart';

extension TwitchPersistentStorageDataExt on TwitchPersistentStorageData {
  Future<String?> get accessToken async =>
      await read(PersistDataType.accessToken.key);

  void writeAccessToken(String value) {
    write(PersistDataType.accessToken.key, value);
  }

  void deleteAccessToken() {
    delete(PersistDataType.accessToken.key);
  }
}

enum PersistDataType { accessToken }

extension PersistDataTypeExt on PersistDataType {
  static const String accessTokenKey = 'ACCESS_TOKEN';

  String get key {
    switch (this) {
      case PersistDataType.accessToken:
        return accessTokenKey;
      default:
        throw UnsupportedError('Key $this not found on PersistDataType enum!');
    }
  }
}
