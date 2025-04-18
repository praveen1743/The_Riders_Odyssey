import 'package:geolocator/geolocator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'location_provider.g.dart';

@riverpod
Future<Position?> currentLocation(CurrentLocationRef ref) async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();


    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await geolocator.Geolocator.checkPermission();
    if (permission == geolocator.LocationPermission.denied) {
      permission = await geolocator.Geolocator.requestPermission();
      if (permission == geolocator.LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    state = await geolocator.Geolocator.getCurrentPosition();
  }
}

final locationServiceProvider =
    StateNotifierProvider<LocationNotifier, geolocator.Position?>((ref) {
  return LocationNotifier();
});