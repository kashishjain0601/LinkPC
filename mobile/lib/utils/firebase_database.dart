import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future getUserData() async {
  final user = FirebaseAuth.instance.currentUser!;
  FirebaseDatabase database = FirebaseDatabase.instance;
  DataSnapshot info = await database.ref('users/${user.uid}').get();
  return info.value;
}
