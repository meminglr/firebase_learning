import 'package:firebase_learning/features/auth/controller/auth_controller.dart';
import 'package:firebase_learning/features/auth/views/sign_up_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../home.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isSignIn = true;
  bool isLoading = false;

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
            child: isSignIn ? signIn() : signUp(),
          ),
        ),
      ),
    );
  }

  Column signUp() {
    return Column(
      spacing: 20,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Kayıt Ol",
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Email boş olamaz";
            }
            return null;
          },
          controller: _emailController,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            hintText: "Email",
          ),
        ),
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Şifre boş olamaz";
            }
            return null;
          },
          controller: _passwordController,
          obscureText: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            hintText: "Şifre",
          ),
        ),
        Consumer(
          builder: (context, ref, child) => FilledButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                isLoading = true;
                setState(() {});
                ref
                    .read(authContrllerProvider)
                    .createUserWithEmailAndPassword(
                      _emailController.text,
                      _passwordController.text,
                    )
                    .then(
                      (onValue) => Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (builder) =>
                              SignUpInfo(mail: _emailController.text),
                        ),
                      ),
                    );
                isLoading = false;
              }
            },
            child: isLoading ? CircularProgressIndicator() : Text("Devam Et"),
          ),
        ),
        TextButton(onPressed: () {}, child: Text("Şifemi Unuttum")),
        TextButton(
          onPressed: () {
            isSignIn = !isSignIn;
            setState(() {});
          },
          child: Text(" Zaten Hesabın Var mı? Giriş Yap"),
        ),
      ],
    );
  }

  Column signIn() {
    return Column(
      spacing: 20,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Giriş Yap",
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Email boş olamaz";
            }
            return null;
          },
          controller: _emailController,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            hintText: "Email",
          ),
        ),
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Şifre boş olamaz";
            }
            return null;
          },
          controller: _passwordController,
          obscureText: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            hintText: "Şifre",
          ),
        ),
        Consumer(
          builder: (context, ref, child) => FilledButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                isLoading = true;
                setState(() {});
                ref
                    .read(authContrllerProvider)
                    .signInWithEmailAndPassword(
                      _emailController.text,
                      _passwordController.text,
                    )
                    .then((onValue) {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(builder: (context) => Home()),
                      );
                    });
                isLoading = false;
                setState(() {});
              }
            },
            child: isLoading ? CircularProgressIndicator() : Text("Giriş Yap"),
          ),
        ),

        TextButton(onPressed: () {}, child: Text("Şifemi Unuttum")),
        TextButton(
          onPressed: () {
            isSignIn = !isSignIn;
            setState(() {});
          },
          child: Text(" Hesabın Yok mu? Kayıt Ol"),
        ),
      ],
    );
  }
}
