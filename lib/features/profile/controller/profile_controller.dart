// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_learning/models/user_model.dart';
import 'package:firebase_learning/features/profile/repository/profile_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileControllerProvider = Provider(
  (ref) => ProfileController(
    profileRepository: ref.watch(profileRepositoryProvider),
  ),
);

class ProfileController {
  ProfileRepository profileRepository;
  ProfileController({required this.profileRepository});
  
  Future<UserModel> getUser() async {
    return await profileRepository.getUser();
  }
}
