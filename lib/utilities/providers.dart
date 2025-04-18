import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/message.dart';
import '../models/ride.dart';

final authServiceProvider = Provider((ref) => AuthService());

final isLoggedProvider = StateProvider((ref) => false);

class AuthService {}

final currentLocationProvider = StateNotifierProvider<CurrentLocationNotifier, Map<String, double>?>((ref) {
  return CurrentLocationNotifier();
});

final rideServiceProvider = StateNotifierProvider<RideServiceNotifier, List<Ride>>((ref) {
  return RideServiceNotifier();
});

final chatMessagesProvider = StateNotifierProvider<ChatMessagesNotifier, List<Message>>((ref) {
  return ChatMessagesNotifier();
});

final rideRequestsProvider = StateNotifierProvider<RideRequestsNotifier, List<Ride>>((ref) {
  return RideRequestsNotifier();
});

final communityProvider = StateNotifierProvider<CommunityNotifier, List<String>>((ref) {
  return CommunityNotifier();
});

final sosProvider = StateNotifierProvider<SosNotifier, bool>((ref) {
  return SosNotifier();
});

final navigationServiceProvider = StateNotifierProvider<NavigationServiceNotifier, Map<String, double>>((ref) {
  return NavigationServiceNotifier();
});

class MessageStateNotifier extends StateNotifier<List<Message>> {
  MessageStateNotifier() : super([]);
  void addMessage(Message message) {
    state = [...state, message];
  }
}

class RideServiceNotifier extends StateNotifier<List<Ride>> {
  RideServiceNotifier() : super([]);

  void addRide(Ride ride) {
    state = [...state, ride];
  }

  void removeRide(String rideId) {
    state = state.where((ride) => ride.id != rideId).toList();
  }

  void updateRide(Ride updatedRide) {
    state = state.map((ride) => ride.id == updatedRide.id ? updatedRide : ride).toList();
  }
}

class LocationNotifier extends StateNotifier<Map<String, double>?> {
  LocationNotifier() : super(null);

  void updateLocation(double latitude, double longitude) {
    state = {'latitude': latitude, 'longitude': longitude};
  }
}

class CurrentLocationNotifier extends StateNotifier<Map<String, double>?> {
  CurrentLocationNotifier() : super(null);

  void updateLocation(double latitude, double longitude) {
    state = {'latitude': latitude, 'longitude': longitude};
  }
}

class ChatMessagesNotifier extends StateNotifier<List<Message>> {
  ChatMessagesNotifier() : super([]);

  void addMessage(Message message) {
    state = [...state, message];
  }
}

class RideRequestsNotifier extends StateNotifier<List<Ride>> {
  RideRequestsNotifier() : super([]);

  void addRequest(Ride request) {
    state = [...state, request];
  }

  void removeRequest(String rideId) {
    state = state.where((request) => request.id != rideId).toList();
  }

  void updateRequest(Ride updatedRequest) {
    state = state.map((request) => request.id == updatedRequest.id ? updatedRequest : request).toList();
  }
}

class CommunityNotifier extends StateNotifier<List<String>> {
  CommunityNotifier() : super([]);

  void addMember(String memberId) {
    state = [...state, memberId];
  }

  void removeMember(String memberId) {
    state = state.where((id) => id != memberId).toList();
  }
}

class SosNotifier extends StateNotifier<bool> {
  SosNotifier() : super(false);

  void sendSos() {
    state = true;
  }

  void clearSos() {
    state = false;
  }
}

class NavigationServiceNotifier extends StateNotifier<Map<String, double>> {
  NavigationServiceNotifier() : super({});

  void addNavigationPoint(double latitude, double longitude) {
    state = {'latitude': latitude, 'longitude': longitude};
  }
}