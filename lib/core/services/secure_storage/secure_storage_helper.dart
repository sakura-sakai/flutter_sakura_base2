///
/// Secure storage to retain data.
///

part of secure_storage;

final secureStorageHelperProvider = Provider<SecureStorageHelper>(
  (_) => SecureStorageHelper(),
);

class SecureStorageHelper {
  factory SecureStorageHelper() => _instance ??= SecureStorageHelper._();

  SecureStorageHelper._() {
    _storage = const FlutterSecureStorage();
  }

  static SecureStorageHelper? _instance;

  late FlutterSecureStorage _storage;

  FlutterSecureStorage get storage => _storage;

  ///
  /// Encrypts and saves the [key] with the given [value].
  ///
  Future<void> write(String key, String value) async {
    try {
      await _storage.write(key: key, value: value);
    } catch (e) {
      throw SecureStorageException(e.toString());
    }
  }

  ///
  /// Read the value
  ///
  /// Decrypts and returns the value for the given [key] or throw exception
  /// if [key] is not in the storage.
  ///
  Future<String?> read(String key) async {
    try {
      return await _storage.read(key: key);
    } catch (e) {
      throw SecureStorageException(e.toString());
    }
  }

  ///
  /// Deletes associated value for the given [key].
  ///
  Future<void> delete(String key) async {
    try {
      await _storage.delete(key: key);
    } catch (e) {
      throw SecureStorageException(e.toString());
    }
  }

  ///
  /// Returns true if the storage contains the given [key] or returns false.
  /// if something throw exception
  ///
  Future<bool> containsKey(String key) async {
    bool _containsKey = false;
    try {
      _containsKey = await _storage.containsKey(key: key);
    } catch (e) {
      throw SecureStorageException(e.toString());
    }

    return _containsKey;
  }
}
