import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_learning/models/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = Provider(
  (ref) => AuthRepository(
    auth: FirebaseAuth.instance,
    firebaseFirestore: FirebaseFirestore.instance,
  ),
);

class AuthRepository {
  final FirebaseFirestore firebaseFirestore;
  final FirebaseAuth auth;

  AuthRepository({required this.firebaseFirestore, required this.auth});

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    await auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> createUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    await auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<void> storeUserInfoToFirebase(UserModel userModel) async {
    userModel.profilePhoto ??=
        "https://www.iprcenter.gov/image-repository/blank-profile-picture.png/@@images/image.png";
    userModel.uid = auth.currentUser!.uid;

    await firebaseFirestore
        .collection("users")
        .doc(auth.currentUser!.uid)
        .set(userModel.toMap());
  }
}
