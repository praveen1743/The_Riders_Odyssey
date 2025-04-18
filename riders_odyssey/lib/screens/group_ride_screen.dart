import 'package:flutter/material.dart';

class GroupRideScreen extends StatefulWidget {
  const GroupRideScreen({Key? key}) : super(key: key);

  @override
  _GroupRideScreenState createState() => _GroupRideScreenState();
}

class _GroupRideScreenState extends State<GroupRideScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Group Ride'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Live location sharing with map',
            ),
            const SizedBox(height: 20),
            const Text(
              'Speed, Distance, Duration',
            ),
            const SizedBox(height: 20),
            const Text('Ride history with scheduled info'),
            const SizedBox(height: 20),
            const Text('Tabs: Live Chat, Leaderboard'),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Live Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard),
            label: 'Leaderboard',
          ),
        ],
      ),
    );
  }
}