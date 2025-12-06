import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_learning/common/app_theme.dart';
import 'package:firebase_learning/features/auth/views/sign_up_info.dart';
import 'package:firebase_learning/firebase_options.dart';
import 'package:firebase_learning/features/auth/views/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light,
      themeMode: AppTheme.light.brightness == Brightness.light
          ? ThemeMode.light
          : ThemeMode.dark,

      debugShowCheckedModeBanner: false,
      home: AuthPage(),
    );
  }
}
