import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter/foundation.dart';

part 'providers.g.dart';

  final FirebaseAuth _firebaseAuth;

  AuthService(this._firebaseAuth);

  Future<UserCredential?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      return await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      debugPrint('Error signing in: ${e.message}');
      return null;
    }
  }

  Future<UserCredential?> registerWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      return await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      debugPrint('Error registering: ${e.message}');
      return null;
    }
  }
@riverpod
AuthService authService(AuthServiceRef ref) {
  return AuthService(
    FirebaseAuth.instance,
  );
}

@riverpod
Stream<User?> authStateChanges(AuthStateChangesRef ref) {
  final authService = ref.watch(authServiceProviderProvider);
  return authService._firebaseAuth.authStateChanges();
}

@riverpod
User? user(UserRef ref) {
  return ref.watch(authStateChangesProvider).whenOrNull(data: (user) => user);
}