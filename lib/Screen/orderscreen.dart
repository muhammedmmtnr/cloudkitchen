
import 'package:cloud_kitchen/constants/colors.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders', style: TextStyle(color: Colors.white)),
        backgroundColor: ColorClass.amberlight,
      ),
      body: Center(
        child: Text('No Orders Yet'),
      ),
    );
  }
}
