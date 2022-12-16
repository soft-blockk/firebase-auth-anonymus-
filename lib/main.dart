import 'package:flutter/material.dart';
import './auth_toggle.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'auth.dart';

import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User?>.value(
      value: Auth().user,
      initialData: FirebaseAuth.instance.currentUser,
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AuthToggle(),
      ),
    );
  }
}
