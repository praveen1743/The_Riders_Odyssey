import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthPage extends ConsumerStatefulWidget {
  const AuthPage({super.key});

  @override
  ConsumerState<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends ConsumerState<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return authPageContent();
  }

  Widget authPageContent() {
    return const Placeholder();
    //   return Scaffold(
    //     appBar: AppBar(
    //       title: const Text('Auth Page'),
    //     ),
    //     body: const Center(
    //       child: Text('Auth Page'),
    //     ),
    //   );
  }
}