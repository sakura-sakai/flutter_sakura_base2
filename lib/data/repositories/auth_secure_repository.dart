import '../../core/exceptions/exceptions.dart';
import '../../core/services/secure_storage/secure_storage.dart';
import '../model/refresh_token.dart';
import '../model/token.dart';

/// `token` of secure storage keyword
const String _authToken = "auth_token";

/// `refresh_token` of secure storage keyword
const String _authRefreshToken = "auth_refresh_token";

class AuthSecureRepository {
  AuthSecureRepository([SecureStorageHelper? storageHelper])
      : _storageHelper = storageHelper ?? SecureStorageHelper();

  final SecureStorageHelper _storageHelper;

  ///
  /// Set all security token
  ///
  Future<void> setSecurityToken({
    required Token token,
    required RefreshToken refreshToken,
  }) async {
    try {
      await Future.wait([
        _storageHelper.write(_authToken, token.value),
        _storageHelper.write(_authRefreshToken, refreshToken.value)
      ]);
    } catch (e) {
      throw GenericException.handler(e);
    }
  }

  ///
  /// Get Token
  ///
  Future<Token> getToken() async {
    try {
      final value = await _storageHelper.read(_authToken);
      return Token(value ?? '');
    } catch (e) {
      throw GenericException.handler(e);
    }
  }

  ///
  /// Get Refresh Token
  ///
  Future<RefreshToken> getRefreshToken() async {
    try {
      final value = await _storageHelper.read(_authRefreshToken);
      return RefreshToken(value ?? '');
    } catch (e) {
      throw GenericException.handler(e);
    }
  }

  ///
  /// Delete all security token
  ///
  Future<void> deleteSecurityToken() async {
    try {
      await Future.wait([
        _storageHelper.delete(_authToken),
        _storageHelper.delete(_authRefreshToken),
      ]);
    } catch (e) {
      throw GenericException.handler(e);
    }
  }

  ///
  /// Contains security token
  ///
  Future<bool> hasToken() async {
    try {
      return await _storageHelper.containsKey(_authToken);
    } catch (e) {
      throw GenericException.handler(e);
    }
  }

  ///
  /// Contains security RefreshToken
  ///
  Future<bool> hasRefreshToken() async {
    try {
      return await _storageHelper.containsKey(_authRefreshToken);
    } catch (e) {
      throw GenericException.handler(e);
    }
  }

  ///
  /// Contains all security token
  ///
  Future<bool> hasAll() async {
    try {
      final promise = await Future.wait<bool>([
        _storageHelper.containsKey(_authToken),
        _storageHelper.containsKey(_authRefreshToken),
      ]);

      final token = promise[0];
      final refreshToken = promise[1];
      return token && refreshToken;
    } catch (e) {
      throw GenericException.handler(e);
    }
  }
}
