import 'package:flutter/material.dart';

class SosPage extends StatelessWidget {
  const SosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergency SOS'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // TODO: Implement SOS functionality
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
                textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                shape: const CircleBorder(),
              ),
              child: const Text(
                'SOS',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Tap the button in case of emergency',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
             const Text(
              'Alert display panel:',
              style: TextStyle(fontSize: 16),
            ),
            //TODO: Add Alert Display Panel
          ],
        ),
      ),
    );
  }
}