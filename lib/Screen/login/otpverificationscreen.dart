import 'package:cloud_kitchen/constants/colors.dart';
import 'package:cloud_kitchen/constants/imageclass.dart';
import 'package:cloud_kitchen/constants/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String phoneNumber;

  const OtpVerificationScreen({required this.phoneNumber, Key? key})
      : super(key: key);

  @override
  _OtpVerificationScreenState createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpController = TextEditingController();
  int _timer = 65; 
  late String _otp;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  // Timer for OTP expiration countdown
  void _startTimer() {
    Future.delayed(Duration(seconds: 1), () {
      if (_timer > 0) {
        setState(() {
          _timer--;
        });
        _startTimer();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:ColorClass.bluegrey,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon at the top
            Container(
              margin: const EdgeInsets.only(bottom: 30),
              child: Image.asset(ImageClass.otpfield
                
              ),
            ),

            
            Text(
              'Enter Code',
               style: TextStyleClass.manrope700TextStyle(
                                  24,
                                  ColorClass.black,
                                ),
            ),
            SizedBox(height: 10),
            Text(
              'We have sent a verification code to your mobile number ${widget.phoneNumber}',
              textAlign: TextAlign.center,
              style: TextStyleClass.manrope600TextStyle(
                12,
                ColorClass.grey,
              ),
            ),
            SizedBox(height: 30),

            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(6, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  width: 40,
                  height: 50,
                  child: TextField(
                    controller: _otpController,
                    maxLength: 1,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      counterText: '',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                );
              }),
            ),

           
            SizedBox(height: 20),
            Text(
              'Your OTP will expire in 0:${_timer < 10 ? '0' : ''}$_timer minutes',
              style: TextStyleClass.manrope600TextStyle(
                12,
                ColorClass.grey,
              ),
            ),
            SizedBox(height: 20),

           
            InkWell(
              onTap: () {
                
              },
              child: Text(
                "Didn't receive OTP? Resend",
                style: TextStyleClass.manrope600TextStyle(
                  12,
                  ColorClass.grey,
                ),
              ),
            ),
            SizedBox(height: 40),

            GestureDetector(
              onTap: () {
                
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Center(
                  child: Text(
                    'VERIFY',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
