import 'package:flutter/material.dart';

class RideHistoryScreen extends StatelessWidget {
  const RideHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ride History'),
      ),
      body: const Center(
        child: Text('Ride History Screen'),
      ),
    );
  }
}