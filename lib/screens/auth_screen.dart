import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/constants/auth_screen_consts.dart';
import 'package:news_app/widgets/login_form.dart';
import 'package:news_app/widgets/signup_form.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});
  @override
  State<AuthScreen> createState() {
    return _AuthScreenState();
  }
}

class _AuthScreenState extends State<AuthScreen> {
  bool _formSwitcher = true;

  void changeForm() {
    if (_formSwitcher == true) {
      setState(() {
        _formSwitcher = false;
      });
    } else {
      setState(() {
        _formSwitcher = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF111A22),
      appBar: AppBar(
        backgroundColor: Color(0xFF111A22),
        title: Center(
          child: Text(
            _formSwitcher ? title1 : title2,
            style: GoogleFonts.lato(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 30,
            ),
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  height: 230,
                  width: 400,

                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          'assets/headerImg.png',
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Align(
                        alignment: AlignmentGeometry.bottomLeft,

                        child: Container(
                          margin: EdgeInsets.all(20),
                          height: 35,
                          width: 140,
                          decoration: BoxDecoration(
                            color: Color(0xFF1277DB),
                            borderRadius: BorderRadius.circular(8),
                            shape: BoxShape.rectangle,
                          ),
                          child: Center(
                            child: Text(
                              "News Feed",
                              style: GoogleFonts.lato(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 25),
              Text(
                _formSwitcher ? header : header2,
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Text(
                  _formSwitcher ? MiniHeader : MiniHeader2,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    color: const Color(0xFF8F9DB2),
                    fontSize: 18,
                    height: 1.5,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: 50),
              _formSwitcher ? LoginForm() : SignupForm(),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: changeForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1277DB),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 5,
                ),
                child: Text(
                  _formSwitcher
                      ? "Create an Account"
                      : "LogIn Existing Account",
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
