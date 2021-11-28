abstract class TwitchPersistentStorageData {
  Future<String?> read(String key);

  Future<void> write(String key, String value);

  Future<void> delete(String key);
}