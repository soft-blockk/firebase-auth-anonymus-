import 'package:firebase_auth_exp/screens/authenticate_screen.dart';
import 'package:flutter/material.dart';
import '../services/auth.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
                      try {
                        dynamic authResult =
                            await _auth.register(email, password);
                        if (authResult != null) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Authenticate()));
                        }
                      } catch (e) {
                        // ignore: avoid_print
                        print(e.toString());
                      }
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(color: Color.fromARGB(255, 30, 30, 30)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  child: const Text(
                    'Sign In Instead',
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
