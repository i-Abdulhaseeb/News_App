import 'package:firebase_auth/firebase_auth.dart';
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
  final _passwordController = TextEditingController();
  final _formkey1 = GlobalKey<FormState>();

  String _SignUpEmail = "";
  String _SignUpPassword = "";
  String _ConfrimPassword = "";
  bool _obscureText = true;

  void onSaveSignUp() async {
    if (_formkey1.currentState!.validate()) {
      _formkey1.currentState!.save();
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _SignUpEmail,
          password: _SignUpPassword,
        );
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Sign up Successfull")));
      } on FirebaseAuthException catch (e) {
        String message = "Confirm Credentials Again";
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(message)));
      }
    }
  }

  Widget build(BuildContext context) {
    return Form(
      key: _formkey1,
      child: Column(
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
            child: TextFormField(
              onSaved: (value) {
                _SignUpEmail = value!;
              },
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Empty Email not accepted";
                }
                final email = value.trim();
                if (!email.contains("@") ||
                    !email.contains(".") ||
                    email.contains(" ")) {
                  return "Enter Valid Email";
                }
                return null;
              },
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
            child: TextFormField(
              controller: _passwordController,
              onSaved: (value) {
                _SignUpPassword = value!;
              },
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Empty Password";
                }
                if (value.length < 6) {
                  return 'Password must be at least 6 characters';
                }
                if (value.contains(' ')) {
                  return 'Password cannot contain spaces';
                }
                return null;
              },
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
            child: TextFormField(
              onSaved: (value) {
                _ConfrimPassword = value!;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password cannot be empty';
                }
                if (value.length < 6) {
                  return 'Password must be at least 6 characters';
                }
                if (value.contains(' ')) {
                  return 'Password cannot contain spaces';
                }
                if (value != _passwordController.text) {
                  return 'Password doesnt Match';
                }
                return null;
              },
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
          SizedBox(height: 25),
          SizedBox(
            width: 360,
            height: 50,
            child: ElevatedButton(
              onPressed: onSaveSignUp,
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
                "Already Have An Account?",
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
        ],
      ),
    );
  }
}
