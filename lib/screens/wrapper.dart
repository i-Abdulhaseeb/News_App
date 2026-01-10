import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_app/constants/auth_screen_consts.dart';
import 'package:news_app/screens/auth_screen.dart';
import 'package:news_app/screens/main_screen.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});
  State<Wrapper> createState() {
    return _WrapperState();
  }
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          User? user = FirebaseAuth.instance.currentUser;

          if (user != null) {
            email = user.email!;
          }
          return MainScreen();
        } else {
          return AuthScreen();
        }
      },
    );
  }
}
