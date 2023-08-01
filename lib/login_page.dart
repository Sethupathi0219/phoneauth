import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _phoneNumberController = TextEditingController();

  Future<void> _verifyPhoneNumber(BuildContext context) async {
    FirebaseAuth _auth = FirebaseAuth.instance;

    String phoneNumber = "+1" + _phoneNumberController.text.trim();

    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
        // Handle verification completion, if necessary.
      },
      verificationFailed: (FirebaseAuthException e) {
        // Handle verification failure.
        print(e.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        Navigator.pushReplacementNamed(context, '/otp',
            arguments: {'verificationId': verificationId});
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _phoneNumberController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(labelText: 'Phone Number'),
              ),
            ),
            ElevatedButton(
              onPressed: () => _verifyPhoneNumber(context),
              child: Text('Send OTP'),
            ),
          ],
        ),
      ),
    );
  }
}
