import 'package:flutter_riverpod/flutter_riverpod.dart';

final authServiceProvider = StateNotifierProvider<AuthService, bool>((ref) {
  return AuthService();
});

class AuthService extends StateNotifier<bool> {
  AuthService() : super(false);

  void setLoggedIn(bool isLoggedIn) {
    state = isLoggedIn;
  }

  registerWithEmailAndPassword(String email, String password) {}
}