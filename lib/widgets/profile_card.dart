import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileCard extends StatelessWidget {
  final IconData icon;
  final int number;
  final String txt;
  const ProfileCard({
    super.key,
    required this.icon,
    required this.number,
    required this.txt,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: 180,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: Color(0xFF1B2735),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: Icon(
              icon,
              color: Color(0xFF1277DB), // fixed icon color
              size: 30,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            number.toString(),
            style: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            txt,
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              color: Colors.white.withOpacity(0.9),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
