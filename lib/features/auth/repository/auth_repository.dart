import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = Provider(
  (ref) => AuthRepository(auth: FirebaseAuth.instance),
);

class AuthRepository {
  final FirebaseAuth auth;

  AuthRepository({required this.auth});

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    await auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> createUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    await auth.createUserWithEmailAndPassword(email: email, password: password);
  }
}
