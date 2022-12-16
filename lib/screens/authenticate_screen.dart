import 'package:flutter/material.dart';
import '../auth.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  final Auth _auth = Auth();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                dynamic auth_result = await _auth.signInAnonymously();
                if (auth_result == null) {
                  print('error signing in');
                } else {
                  print(auth_result);
                }
              },
              child: const Text('Sign In Anonymously'),
            ),
          ],
        ),
      ),
    );
  }
}
