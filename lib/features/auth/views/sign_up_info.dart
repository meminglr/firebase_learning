import 'package:firebase_learning/features/auth/controller/auth_controller.dart';
import 'package:firebase_learning/features/home/views/home.dart';
import 'package:firebase_learning/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpInfo extends StatefulWidget {
  SignUpInfo({super.key, required this.mail});
  final String mail;

  @override
  State<SignUpInfo> createState() => _SignUpInfoState();
}

class _SignUpInfoState extends State<SignUpInfo> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _surnameController = TextEditingController();

  final TextEditingController _userNameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _userNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Bilgileri Tamamla",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "İsim boş olamaz";
                    }
                    return null;
                  },
                  controller: _nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: "İsim",
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Soyad boş olamaz";
                    }
                    return null;
                  },
                  controller: _surnameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: "Soyad",
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Kullanıcı boş olamaz";
                    }
                    return null;
                  },
                  controller: _userNameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: "Kullanıcı Adı",
                  ),
                ),
                Consumer(
                  builder: (context, ref, child) => FilledButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        isLoading = true;
                        setState(() {});
                        UserModel userModel = UserModel(
                          name: _nameController.text,
                          surname: _surnameController.text,
                          mail: widget.mail,
                          username: _userNameController.text,
                        );
                        ref
                            .read(authContrllerProvider)
                            .storeUserInfoToFirebase(userModel)
                            .whenComplete(
                              () => Navigator.pushAndRemoveUntil(
                                context,
                                CupertinoPageRoute(
                                  builder: (builder) => Home(),
                                ),
                                (route) => false,
                              ),
                            );
                        isLoading = false;
                        setState(() {});
                      }
                    },
                    child: isLoading
                        ? CircularProgressIndicator()
                        : Text("Devam Et"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
