import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../screens/home_screen.dart'; // Ensure this is the correct path
import 'providers.dart'; // Ensure this is the correct path

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() async {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      showSnackBar(context, 'Please fill all the fields');
      return;
    }

    final result = await ref
        .read(authServiceProvider.notifier)
        .signInWithEmailAndPassword(
          _emailController.text,
          _passwordController.text,
        );

    if (mounted) {
      result.fold(
        (failure) => showSnackBar(context, failure.message),
        (_) => Navigator.pushReplacementNamed(context, HomeScreen.routeName),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(controller: _emailController, decoration: const InputDecoration(labelText: 'Email')),
            const SizedBox(height: 16),
            TextFormField(controller: _passwordController, decoration: const InputDecoration(labelText: 'Password'), obscureText: true),
            const SizedBox(height: 24),
            ElevatedButton(onPressed: _login, child: const Text('Login')),
            const SizedBox(height: 16),
            TextButton(onPressed: () => Navigator.pushNamed(context, '/register'), child: const Text('Register')),
          ],
        ),
      ),
    );
  }
}