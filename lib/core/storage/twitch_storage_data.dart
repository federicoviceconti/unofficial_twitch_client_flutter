import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:unofficial_twitch_mobile/core/storage/persistent_storage_data.dart';

class TwitchStorageData extends PersistentStorageData {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  static final TwitchStorageData _instance = TwitchStorageData._internal();

  TwitchStorageData._internal();

  factory TwitchStorageData() {
    return _instance;
  }

  @override
  Future<String?> read(String key) async {
    return await storage.read(key: key);
  }

  @override
  Future<void> write(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  @override
  Future<void> delete(String key) async {
    await storage.delete(key: key);
  }
}
