import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: CircleAvatar(
            radius: 50,
            backgroundColor: const Color(0xff8ebbff),
            backgroundImage: NetworkImage(user.photoURL!),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            user.displayName!,
            style: const TextStyle(color: Color(0xfff4f5fc), fontSize: 24),
          ),
        ),
      ],
    );
  }
}
