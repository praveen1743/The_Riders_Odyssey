import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location/location.dart';

final locationProvider = StateNotifierProvider<LocationNotifier, LocationState>(
  (ref) => LocationNotifier(),
);

class LocationState {
  final LocationData? locationData;

  LocationState({this.locationData});

  LocationState copyWith({LocationData? locationData}) {
    return LocationState(locationData: locationData ?? this.locationData);
  }
}