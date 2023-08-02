import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'home_page.dart';

class OTPPage extends StatefulWidget {
  final String verificationId;
  final String phoneNumber;

  OTPPage(this.verificationId, this.phoneNumber);

  @override
  _OTPPageState createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  final _otpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _loading = false;

  void _validateAndSubmit() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _loading = true;
      });

      String smsCode = _otpController.text.trim();
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId,
        smsCode: smsCode,
      );

      try {
        await FirebaseAuth.instance.signInWithCredential(credential);
        Fluttertoast.showToast(msg: 'OTP is correct!');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
      } on FirebaseAuthException catch (e) {
        Fluttertoast.showToast(msg: 'Incorrect OTP. Try again!');
        print('Error: ${e.message}');
      }

      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('OTP Verification')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PinCodeTextField(
                  appContext: context,
                  length: 6,
                  onChanged: (otp) {},
                  controller: _otpController,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    borderWidth: 2,
                    inactiveFillColor: Colors.grey.shade200,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _loading ? null : _validateAndSubmit,
                  child:
                      _loading ? CircularProgressIndicator() : Text('Verify'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
