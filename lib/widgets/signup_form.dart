import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});
  @override
  State<SignupForm> createState() {
    return _SignupFormState();
  }
}

class _SignupFormState extends State<SignupForm> {
  bool _obscureText = true;
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: AlignmentGeometry.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Text(
              "Email Address",
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        SizedBox(
          width: 360,
          child: Form(
            child: TextFormField(
              style: GoogleFonts.inter(color: Colors.white, fontSize: 18),
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFF233648),
                hintText: "name@example.com",
                hintStyle: GoogleFonts.inter(
                  color: Color(0xFF8F9DB2),
                  fontSize: 18,
                ),
                prefixIcon: Icon(
                  Icons.mail_outline_sharp,
                  color: Color(0xFF8F9DB2),
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 18,
                  horizontal: 16,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
          ),
        ),
        SizedBox(height: 15),

        Align(
          alignment: AlignmentGeometry.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Text(
              "Password",
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),

        SizedBox(height: 10),
        SizedBox(
          width: 360,
          child: Form(
            child: TextFormField(
              style: GoogleFonts.inter(color: Colors.white, fontSize: 18),
              obscureText: _obscureText,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFF233648),
                hintText: "Enter your password",
                hintStyle: GoogleFonts.inter(
                  color: Color(0xFF8F9DB2),
                  fontSize: 18,
                ),

                prefixIcon: Icon(Icons.lock, color: Color(0xFF8F9DB2)),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 18,
                  horizontal: 16,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: Color(0xFF8F9DB2),
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
              keyboardType: TextInputType.visiblePassword,
            ),
          ),
        ),
        SizedBox(height: 15),

        Align(
          alignment: AlignmentGeometry.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Text(
              "Confrim Password",
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),

        SizedBox(height: 10),
        SizedBox(
          width: 360,
          child: Form(
            child: TextFormField(
              style: GoogleFonts.inter(color: Colors.white, fontSize: 18),
              obscureText: _obscureText,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFF233648),
                hintText: "Confrim your password",
                hintStyle: GoogleFonts.inter(
                  color: Color(0xFF8F9DB2),
                  fontSize: 18,
                ),

                prefixIcon: Icon(Icons.lock_reset, color: Color(0xFF8F9DB2)),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 18,
                  horizontal: 16,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: Color(0xFF8F9DB2),
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
              keyboardType: TextInputType.visiblePassword,
            ),
          ),
        ),
        SizedBox(height: 25),
        SizedBox(
          width: 360,
          height: 50,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              elevation: 8,
              shadowColor: Colors.blue,

              backgroundColor: Color(0xFF1277DB),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Sign Up",
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(width: 12),
                Icon(Icons.door_back_door, size: 22),
              ],
            ),
          ),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: Divider(
                color: Color(0xFF233648),
                thickness: 1,
                endIndent: 10,
              ),
            ),
            Text(
              "Or continue with",
              style: GoogleFonts.lato(
                color: Color(0xFF8F9DB2),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            Expanded(
              child: Divider(
                color: Color(0xFF233648),
                thickness: 1,
                indent: 10,
              ),
            ),
          ],
        ),
        SizedBox(height: 15),
        SizedBox(
          width: 360,
          height: 50,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              elevation: 8,
              shadowColor: Colors.blue,

              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "SignUp with Google",
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(width: 12),
                FaIcon(FontAwesomeIcons.google),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
