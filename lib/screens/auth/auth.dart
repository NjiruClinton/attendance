import 'package:firebase_auth/firebase_auth.dart';
class Auth{
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<User?> createUserWithEmailAndPassword({required String email, required String password}) async {
    final UserCredential userCredential = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    final User? user = userCredential.user;
    return user;
  }
  Future<User?> signInWithEmailAndPassword({required String email, required String password}) async {
    final UserCredential userCredential = await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    final User? user = userCredential.user;
    return user;
  }

  Future<void> signOut() async {
    await auth.signOut();
  }

}