import 'package:firebase_auth_exp/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final Auth _auth = Auth();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        elevation: 0,
        actions: <Widget>[
          TextButton.icon(
            icon: const Icon(
              Icons.person,
              color: Colors.black,
            ),
            label: const Text(
              'logout',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onPressed: (() async {
              await _auth.signOutFunction();
            }),
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'This is HomePage',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
