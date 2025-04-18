import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LiveTrackingScreen extends StatefulWidget {
  const LiveTrackingScreen({super.key});

  _LiveTrackingScreenState createState() => _LiveTrackingScreenState();
}

class _LiveTrackingScreenState extends State<LiveTrackingScreen> {
  late GoogleMapController mapController;
  Position? _currentPosition;
  Set<Marker> _markers = {};

  @override
  void initState(){
    super.initState();
    _getCurrentLocation();
  }

  _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    Geolocator.getPositionStream().listen((Position? position) {
      if(position != null){
        setState(() {
          _currentPosition = position;
          _markers.clear();
          _markers.add(
            Marker(
              markerId: const MarkerId("currentLocation"),
              position: LatLng(position.latitude!, position.longitude!),
              infoWindow: const InfoWindow(title: "You are here"),
            ),
          );
          mapController.animateCamera(
            CameraUpdate.newLatLng(
              LatLng(position.latitude!, position.longitude!),
            ),
          );
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Tracking'),
      ),
      body: _currentPosition == null
          ? const Center(child: CircularProgressIndicator())
          : GoogleMap(
        onMapCreated: (GoogleMapController controller){
          mapController = controller;
        },
        initialCameraPosition: CameraPosition(
          target: LatLng(_currentPosition!.latitude!, _currentPosition!.longitude!),
          zoom: 15.0,
        ),
        markers: _markers,
        myLocationEnabled: true,
      ),
    );
  }
}