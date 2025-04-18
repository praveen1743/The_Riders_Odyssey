import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

import '../core/utils.dart';
import 'failure.dart';

class AuthService {
  AuthService(this._auth);
  final FirebaseAuth _auth;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  FutureEither<UserCredential> signInWithEmailAndPassword(String email, String password) async {
    return tryCatch(() => _auth.signInWithEmailAndPassword(email: email, password: password));
  }

  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateUserProfile(String? displayName) async {
    try {
      await _auth.currentUser?.updateDisplayName(displayName);
    } catch (e) {
      rethrow;
    }
  }

  FutureVoid signOut() async {
    await _auth.signOut();
  }
}

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService(FirebaseAuth.instance);
});

final authStateProvider = StreamProvider<User?>((ref) {
  final authService = ref.watch(authServiceProvider);
  return authService.authStateChanges;
});