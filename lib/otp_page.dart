import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OTPPage extends StatelessWidget {
  final TextEditingController _otpController = TextEditingController();

  Future<void> _verifyOTP(BuildContext context, String verificationId) async {
    FirebaseAuth _auth = FirebaseAuth.instance;

    String smsCode = _otpController.text.trim();

    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );

    try {
      await _auth.signInWithCredential(credential);
      // OTP verification successful, navigate to the home page.
      Navigator.pushReplacementNamed(context, '/home');
    } on FirebaseAuthException catch (e) {
      // Handle verification failure.
      print(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final String verificationId = args['verificationId'];

    return Scaffold(
      appBar: AppBar(
        title: Text('OTP Verification'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _otpController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'OTP'),
              ),
            ),
            ElevatedButton(
              onPressed: () => _verifyOTP(context, verificationId),
              child: Text('Verify OTP'),
            ),
          ],
        ),
      ),
    );
  }
}
