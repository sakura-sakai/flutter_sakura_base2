import '../../core/exceptions/exceptions.dart';
import '../../core/services/api/api.dart';
import '../model/authentication_user_model.dart';
import '../model/refresh_token.dart';
import '../model/token.dart';
import '../request_param/authentication_request_params.dart';

class AuthRepository  {
  AuthRepository([ApiClient? client]) : _client = client ?? ApiClient();

  final ApiClient _client;

  Future<AuthenticationUserModel> login(
    AuthenticationRequestParams authRequest,
  ) async {
    try {
      final response = await _client.invokeAPI(
        '/api/v1/auth',
        apiMethod: ApiMethod.post,
        bodyData: authRequest.toJson(),
      );

      return AuthenticationUserModel.fromJson(response.data!);
    } catch (e) {
      throw GenericException.handler(e);
    }
  }

  Future<void> logout(Token token) {
    // TODO: implement logout
    throw UnimplementedError();
  }

  Future<AuthenticationUserModel> refreshToken(RefreshToken refreshToken) {
    // TODO: implement refreshToken
    throw UnimplementedError();
  }

  Future<AuthenticationUserModel> signUp() {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
