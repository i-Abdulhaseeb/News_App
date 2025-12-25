import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/screens/auth_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  State<SplashScreen> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 8), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AuthScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF101922),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                color: Color(0xFF1A2632),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF0F2A47).withOpacity(0.6),
                    blurRadius: 30,
                    spreadRadius: 15,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: Icon(Icons.newspaper, color: Color(0xFF137FEC), size: 80),
            ),
            SizedBox(height: 30),
            Text(
              "NewsFlash",
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 38,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Briefing the World",
              style: GoogleFonts.lato(
                color: const Color.fromARGB(182, 255, 255, 255),
                fontSize: 22,
              ),
            ),
            SizedBox(height: 60),
            Lottie.network(
              'https://lottie.host/e385dbbc-1103-480a-8cbf-b9c3e8be50f3/NaplZ7J7mV.json',
              height: 230,
              width: 250,
            ),
            SizedBox(height: 15),
            Text(
              "Loading Your Feed...",
              style: GoogleFonts.lato(
                color: const Color.fromARGB(182, 255, 255, 255),
                fontSize: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
