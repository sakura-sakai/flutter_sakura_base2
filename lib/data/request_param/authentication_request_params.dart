import '../../core/exceptions/exceptions.dart';

class AuthenticationRequestParams {
  final String? email;
  final String? password;

  AuthenticationRequestParams({
    required this.email,
    required this.password,
  }) {
    if (email == null || email!.isEmpty) {
      throw NotFoundException('email');
    }

    if (password == null || password!.isEmpty) {
      throw NotFoundException("password");
    }
  }

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
    };
  }
}
