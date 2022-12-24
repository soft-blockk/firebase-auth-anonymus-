import 'package:firebase_auth_exp/screens/register.dart';
import 'package:flutter/material.dart';
import '../services/auth.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  final Auth _auth = Auth();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (val) => val!.isEmpty ? 'Enter the email' : null,
                  decoration: const InputDecoration(
                    hintText: 'Email',
                  ),
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (val) =>
                      val!.isEmpty ? 'Enter the password' : null,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                  ),
                  obscureText: true,
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                OutlinedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      dynamic result = await _auth.signIn(email, password);
                      print(result);
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  child: const Text(
                    'Sign In',
                    style: TextStyle(color: Color.fromARGB(255, 30, 30, 30)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                OutlinedButton(
                  onPressed: () async {
                    dynamic auth_result = await _auth.signInAnonymously();
                    if (auth_result == null) {
                      print('error signing in');
                    } else {
                      print(auth_result);
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  child: const Text(
                    'Sign In Anonymously',
                    style: TextStyle(color: Color.fromARGB(255, 30, 30, 30)),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  'New User?',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => const Register()),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  child: const Text(
                    'Register',
                    style: TextStyle(color: Color.fromARGB(255, 30, 30, 30)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
