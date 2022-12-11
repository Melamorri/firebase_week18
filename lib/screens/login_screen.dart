import 'package:flutter/material.dart';

import '../helpers/firebase_helper.dart';

class LoginScreen extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Login'),
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(12)),
                    child: TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(hintText: 'email'),
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(12)),
                    child: TextField(
                      controller: _passwordController,
                      decoration: const InputDecoration(hintText: 'password'),
                      obscureText: true,
                      textInputAction: TextInputAction.done,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/forgot');
                    },
                    child: Text(
                      'Forgot password?',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    )),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () async {
                    final email = _emailController.text;
                    final password = _passwordController.text;
                    final success = await FirebaseHelper.login(email, password);
                    if (success) {
                      Navigator.pushReplacementNamed(context, '/profile');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text('Wrong email or password'),
                        ),
                      );
                    }
                  },
                  child: const Text('Login'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/sign_up');
                  },
                  child: const Text('Firstly here? Sign up!'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
