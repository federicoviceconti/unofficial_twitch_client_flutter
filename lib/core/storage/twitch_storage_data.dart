abstract class PersistentStorageData {
  Future<String?> read(String key);

  Future<void> write(String key, String value);
}