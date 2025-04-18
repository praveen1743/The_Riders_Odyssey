import 'package:flutter/material.dart';

class RidePlanningScreen extends StatefulWidget {
  const RidePlanningScreen({Key? key}) : super(key: key);

  @override
  _RidePlanningScreenState createState() => _RidePlanningScreenState();
}

class _RidePlanningScreenState extends State<RidePlanningScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ride Planning'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Plan Your Ride Here',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement ride planning functionality
              },
              child: const Text('Start Planning'),
            ),
          ],
        ),
      ),
    );
  }
}