import 'package:flutter/material.dart';

class Forums extends StatelessWidget {
  const Forums({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forums'),
      ),
      body: Center(
        child: const Text('Forums Page Content'),
      ),
    );
  }
}