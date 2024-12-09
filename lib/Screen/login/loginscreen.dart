import 'package:cloud_kitchen/Screen/login/otpverificationscreen.dart';
import 'package:cloud_kitchen/constants/colors.dart';
import 'package:cloud_kitchen/constants/imageclass.dart';
import 'package:cloud_kitchen/constants/textstyle.dart';

import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorClass.white,
      body: Stack(
        children: [
          Positioned(
            top: 550,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                height: 400,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: ColorClass.grey),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Text('welcome',
                          style: TextStyleClass.manrope700TextStyle(
                                24, ColorClass.darkStaleGrey),),
                                SizedBox(height: 10,),
                      Row(
                        children: [
                        

                          Text(
                            'Phone Number',
                            style: TextStyleClass.manrope500TextStyle(
                                13, Colors.black),
                          ),
                          Text(
                            '*',
                            style: TextStyleClass.manrope500TextStyle(
                                13, ColorClass.darkRed),
                          )
                        ],
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 56,
                        child: TextField(
                          controller: _phoneNumberController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            hintText: 'Phone Number',
                            hintStyle: const TextStyle(fontSize: 13),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: ColorClass.grey),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: ColorClass.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: ColorClass.darkRed),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      GestureDetector(
                        onTap: () {
                          final phoneNumber = _phoneNumberController.text;
                          if (phoneNumber.isNotEmpty && phoneNumber.length == 10) {
                            // Navigate to OTP Verification Screen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OtpVerificationScreen(
                                  phoneNumber: phoneNumber,
                                ),
                              ),
                            );
                          } else {
                            // Show error message
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    'Please enter a valid 10-digit phone number'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        },
                        child: Container(
                          height: 45,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: ColorClass.darkStaleGrey.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Text(
                              'SEND OTP',
                              style: TextStyleClass.manrope700TextStyle(
                                  14, ColorClass.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 200,
            left: 0,
            right: 0,
            child: Center(
              child: SizedBox(
                height: 300,
                width: 300,
                child: Image.asset(ImageClass.loginImage),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }
}

