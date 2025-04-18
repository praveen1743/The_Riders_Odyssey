import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers.dart';

class LoginPage extends ConsumerStatefulWidget {
 const LoginPage({super.key});

 @override
 ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
 final TextEditingController emailController = TextEditingController();
 final TextEditingController passwordController = TextEditingController();

 @override
 Widget build(BuildContext context) {
  return Scaffold(
   appBar: AppBar(
    title: const Text('Login'),
   ),
   body: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
     mainAxisAlignment: MainAxisAlignment.center,
     children: <Widget>[
      TextFormField(
       controller: emailController,
       decoration: const InputDecoration(labelText: 'Email'),
      ),
      const SizedBox(height: 20),
      TextFormField(
       controller: passwordController,
       decoration: const InputDecoration(labelText: 'Password'),
       obscureText: true,
      ),
      const SizedBox(height: 30),
      ElevatedButton(
       onPressed: (dynamic authServiceProviderProvider) async {
        final navigator = Navigator.of(context);
        ScaffoldMessenger.of(context);
        await ref.read(authServiceProviderProvider.notifier).signInWithEmailAndPassword(emailController.text, passwordController.text);
        navigator.pushReplacementNamed('/home');
       },
       child: const Text('Login'),
      ),
      const SizedBox(height: 10),
      TextButton(onPressed: () => Navigator.pushNamed(context, '/register'), child: const Text('Register'))
     ],
    ),
   ),
  );
 }
}


  @override
  Widget build(BuildContext context) {
  var emailController;
  var passwordController;
  return Scaffold(
   body: Center(
    child: Padding(
     padding: const EdgeInsets.all(16.0),
     child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
       TextFormField(
        controller: emailController,
        decoration: const InputDecoration(labelText: 'Email'),
       ),
       const SizedBox(height: 16),
       TextFormField(
        controller: passwordController,
        decoration: const InputDecoration(labelText: 'Password'),
        obscureText: true,
       ),
       const SizedBox(height: 24),
       ElevatedButton(
        onPressed: (authServiceProviderProvider) async {
         if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) { 
          // ignore: prefer_typing_uninitialized_variables
          var ref;
          await ref.read(authServiceProviderProvider.notifier).signInWithEmailAndPassword(emailController.text, passwordController.text);
         } else {
          showSnackBar(context, 'Please fill all fields');
         }
        },
        child: const Text('Login'),
       ),
       const SizedBox(height: 16),
       TextButton(onPressed: () => Navigator.pushNamed(context, '/register'), child: const Text('Register')),
      ],
     ),
    ),
   )
  );
 }
 
 void showSnackBar(BuildContext context, String s) {
 }
}
    );
  }
}