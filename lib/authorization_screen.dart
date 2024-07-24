import 'package:flutter/material.dart';
import 'account_creation_screen.dart';
import 'authorization_emails.dart'; // Make sure this file exists

class AuthorizationScreen extends StatefulWidget {
  @override
  _AuthorizationScreenState createState() => _AuthorizationScreenState();
}

class _AuthorizationScreenState extends State<AuthorizationScreen> {
  final TextEditingController emailController = TextEditingController();
  bool isLoading = false;
  final Color primaryColor = Color(0xFF003366); // Rollins College Blue
  final Color accentColor = Color(0xFFFFD700); // Rollins College Gold

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Email Verification', style: TextStyle(color: primaryColor)),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: primaryColor),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: TextStyle(color: primaryColor.withOpacity(0.7)),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: primaryColor.withOpacity(0.7)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: primaryColor, width: 2.0),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 20),
                Text(
                  'Please type your email and hit send button to verify if your email is authorized to create an account.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: primaryColor),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: verifyEmail,
                  style: ElevatedButton.styleFrom(
                      primary: primaryColor,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    ),
                    child: Text("Send", style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
              ],
            ),
      ),
    );
  }

  void verifyEmail() async {
    setState(() { isLoading = true; });
    String emailInput = emailController.text.trim();

    if (emailInput.isEmpty) {
      showAuthorizedMessage('Please enter an email address');
      setState(() { isLoading = false; });
      return;
    }

    try {
      await AuthorizedEmails.initializeEmails(); // Load the authorized emails

      // Check if the email is in the list of authorized emails
      if (AuthorizedEmails.authorizedEmailList.contains(emailInput)) {
        // Email is authorized, navigate to the AccountCreationScreen
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => AccountCreationScreen()),
        );
      } else {
        // Email is not authorized
        showAuthorizedMessage('Email is not authorized for account creation.');
      }
    } catch (e) {
      debugPrint('Verification error: ${e.toString()}');
      showAuthorizedMessage('An error occurred while verifying the email. Please try again.');
    } finally {
      setState(() { isLoading = false; });
    }
  }

  void showAuthorizedMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}

