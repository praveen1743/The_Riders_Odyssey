import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Events extends ConsumerWidget {
  const Events({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Events'),
      ),
      body: const Center(
        child: Text('Events Placeholder'),
      ),
    );
  }
}