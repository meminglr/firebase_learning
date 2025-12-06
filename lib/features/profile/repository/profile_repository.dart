// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_learning/models/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileRepositoryProvider = Provider(
  (ref) => ProfileRepository(
    auth: FirebaseAuth.instance,
    firebaseFirestore: FirebaseFirestore.instance,
  ),
);

class ProfileRepository {
  FirebaseAuth auth;
  FirebaseFirestore firebaseFirestore;
  ProfileRepository({required this.auth, required this.firebaseFirestore});

  Future<UserModel> getUser() async {
    return await firebaseFirestore
        .collection("users")
        .doc(auth.currentUser!.uid)
        .get()
        .then((onValue) => UserModel.fromMap(onValue.data()!));
  }
}
