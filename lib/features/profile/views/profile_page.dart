import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_learning/common/sizez.dart';
import 'package:firebase_learning/models/user_model.dart';
import 'package:firebase_learning/features/profile/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: scaffoldPadding,
          child: FutureBuilder<UserModel>(
            future: ref.read(profileControllerProvider).getUser(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final userModel = snapshot.data!;
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50,

                        backgroundImage: CachedNetworkImageProvider(
                          userModel.profilePhoto!,
                        ),
                      ),
                    ],
                  ),
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else {
                return Text("Bir hata oluştu");
              }
            },
          ),
        ),
      ),
    );
  }
}
