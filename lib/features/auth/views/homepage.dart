import 'package:firebase_learning/features/auth/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _formKey,
            child: Column(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Giriş Yap",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: "Email",
                  ),
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: "Şifre",
                  ),
                ),
                Consumer(
                  builder: (context, ref, child) => FilledButton(
                    onPressed: () {
                      ref
                          .read(authContrllerProvider)
                          .signInWithEmailAndPassword(
                            _emailController.text,
                            _passwordController.text,
                          );
                    },
                    child: Text("Giriş Yap"),
                  ),
                ),

                TextButton(onPressed: () {}, child: Text("Şifemi Unuttum")),
                TextButton(
                  onPressed: () {},
                  child: Text(" Hesabın Yok mu? Kayıt Ol"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
