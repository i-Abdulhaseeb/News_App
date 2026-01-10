import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/constants/auth_screen_consts.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  Future<int> numberOfArticles() async {
    String userid = FirebaseAuth.instance.currentUser!.uid;
    final ref = FirebaseDatabase.instance.ref('news/$userid');

    final Snapshot = await ref.get();
    if (Snapshot.exists) {
      final data = Snapshot.value as Map;
      return data.length;
    } else {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    email = FirebaseAuth.instance.currentUser?.email ?? 'alex@example.com';

    return Scaffold(
      backgroundColor: const Color(0xFF111A22),
      appBar: AppBar(
        backgroundColor: const Color(0xFF111A22),
        title: Center(
          child: Text(
            "Profile",
            style: GoogleFonts.lato(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16),
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
              const SizedBox(height: 15),
              Text(
                "Hello Alex",
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                email,
                style: GoogleFonts.montserrat(
                  color: const Color(0xFF8F9DB2),
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 30),

              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.blueAccent.withOpacity(0.2),
                      Colors.purpleAccent.withOpacity(0.2),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A2430),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Articles Saved",
                            style: GoogleFonts.lato(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(height: 8),
                          FutureBuilder<int>(
                            future: numberOfArticles(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Text(
                                  "Loading...",
                                  style: GoogleFonts.lato(
                                    color: Colors.grey[300],
                                    fontSize: 14,
                                  ),
                                );
                              } else if (snapshot.hasError) {
                                return Text(
                                  "Error",
                                  style: GoogleFonts.lato(
                                    color: Colors.grey[300],
                                    fontSize: 14,
                                  ),
                                );
                              } else {
                                int count = snapshot.data ?? 0;
                                return Text(
                                  "You have $count saved articles",
                                  style: GoogleFonts.lato(
                                    color: Colors.grey[300],
                                    fontSize: 14,
                                  ),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    ElevatedButton(
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        "Sign Out",
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
