import 'package:flutter/material.dart';
import 'package:mobile/utils/google_auth.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff24293e),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            'assets/images/logo.png',
            width: 140,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'LinkPC',
            style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Color(0xfff4f5fc)),
          ),
          const SizedBox(
            height: 80,
          ),
          TextButton.icon(
              onPressed: () async {
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                await provider.googleLogin();
                if (provider.verify == true) {
                  Navigator.pushReplacementNamed(context, '/home');
                }
              },
              icon: const Icon(Icons.login_rounded),
              label: const Text(
                'Login with Google',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: const ButtonStyle(
                foregroundColor: MaterialStatePropertyAll(Color(0xfff4f5fc)),
                backgroundColor: MaterialStatePropertyAll(Color(0xff8ebbff)),
              )),
        ]),
      ),
    );
  }
}
