import 'package:flutter/material.dart';
import 'package:news_app/screens/splash_screen.dart';
import 'package:news_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  print("Firebase initialized successfully!");
  runApp(const MaterialApp(home: SplashScreen()));
}
