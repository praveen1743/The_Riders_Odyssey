import 'package:flutter_riverpod/flutter_riverpod.dart';

// Define a StateNotifierProvider for the user
final userProvider = StateNotifierProvider<UserNotifier, dynamic>((ref) {
  return UserNotifier();
});

class UserNotifier extends StateNotifier<dynamic> {
  UserNotifier() : super(null); // Initialize with null (no user logged in)

  // Methods to update the user state (e.g., login, logout) can be added here
}

// Define a StateProvider for the selected tab
final selectedTabProvider = StateProvider<int>((ref) {
  return 0; // Initialize with the first tab selected (index 0)
});