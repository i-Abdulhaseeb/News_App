import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/constants/auth_screen_consts.dart';
import 'package:news_app/widgets/profile_card.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF111A22),
      appBar: AppBar(
        backgroundColor: Color(0xFF111A22),
        title: Center(
          child: Text(
            "Profile",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              "Edit",
              style: GoogleFonts.lato(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Center(
            child: Column(
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white.withOpacity(0.4),
                      width: 3,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 12,
                        offset: const Offset(0, 6),
                      ),
                    ],
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.blueAccent.withOpacity(0.6),
                        Colors.purpleAccent.withOpacity(0.6),
                      ],
                    ),
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/profileuser.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  "Hello User",
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  email,
                  style: GoogleFonts.montserrat(
                    color: Color(0xFF8F9DB2),
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ProfileCard(
                      icon: Icons.book,
                      number: 1,
                      txt: "Articles Read",
                    ),
                    SizedBox(width: 24),
                    ProfileCard(
                      icon: Icons.bookmark,
                      number: 1,
                      txt: 'Saved News',
                    ),
                  ],
                ),
                SizedBox(height: 100),
                ElevatedButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                  },
                  child: Text("Sign out"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
