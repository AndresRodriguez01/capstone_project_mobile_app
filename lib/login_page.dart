import 'package:flutter/material.dart';
import 'authorization_screen.dart'; // Make sure this import is correct

class LoginPage extends StatelessWidget {
  // Define the color palette based on Rollins College's branding
  final Color primaryColor = Color(0xFF003366); // Rollins College Blue
  final Color accentColor = Color(0xFFFFD700); // Rollins College Gold

  @override
  Widget build(BuildContext context) {
    // Calculate the screen size
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: screenSize.height * 0.1), // Dynamic spacing
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Login",
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: screenSize.width * 0.1, // Dynamic text size
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenSize.height * 0.01), // Dynamic spacing
                  Text(
                    "Welcome to Hume House",
                    style: TextStyle(
                      color: primaryColor.withOpacity(0.85), // Slightly translucent
                      fontSize: screenSize.width * 0.05, // Dynamic text size
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenSize.height * 0.03), // Dynamic spacing
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: <Widget>[
                  buildInputField(hint: "Email or Phone number", obscureText: false),
                  buildInputField(hint: "Password", obscureText: true),
                  SizedBox(height: screenSize.height * 0.05), // Dynamic spacing
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: primaryColor,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    ),
                    child: Text("Login", style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8), // Add padding
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Not a member yet? ",
                          style: TextStyle(
                            color: primaryColor,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => AuthorizationScreen()),
                            );
                          },
                          child: Text(
                            "Create an account here",
                            style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenSize.height * 0.03), // Dynamic spacing
                  Image.asset(
                    'assets/images/rollins_college_image.png',
                    height: screenSize.height * 0.15, // Dynamic image size
                  ),
                  SizedBox(height: screenSize.height * 0.02), // Dynamic spacing
                  Text(
                    "Powered by Rollins College",
                    style: TextStyle(
                      fontSize: screenSize.width * 0.04, // Dynamic text size
                      fontWeight: FontWeight.bold,
                      color: accentColor,
                    ),
                  ),
                  SizedBox(height: screenSize.height * 0.1), // Dynamic spacing at the bottom
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white, // Set the background color of the scaffold
    );
  }

  Widget buildInputField({required String hint, required bool obscureText}) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: primaryColor.withOpacity(0.1),
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: primaryColor.withOpacity(0.7)),
          border: InputBorder.none,
        ),
      ),
    );
  }
}


