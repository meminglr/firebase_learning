import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/auth_repository.dart';

final authContrllerProvider = Provider(
  (ref) => AuthController(authRepository: ref.watch(authRepositoryProvider)),
);

class AuthController {
  final AuthRepository authRepository;

  AuthController({required this.authRepository});

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    return authRepository.signInWithEmailAndPassword(email, password);
  }

  Future<void> createUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    return authRepository.createUserWithEmailAndPassword(email, password);
  }
}
