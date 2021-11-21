import '../persistent_storage_data.dart';

extension PersistentStorageDataExt on PersistentStorageData {
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
  String get key {
    switch (this) {
      case PersistDataType.accessToken:
        return 'ACCESS_TOKEN';
      default:
        throw UnsupportedError('Key not found on PersistDataType enum!');
    }
  }
}