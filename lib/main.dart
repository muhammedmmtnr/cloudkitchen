import 'package:cloud_kitchen/Screen/bottomnavigation.dart';
import 'package:cloud_kitchen/Screen/login/loginscreen.dart';
import 'package:cloud_kitchen/provider/cartprovider.dart';


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/orderprovider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => OrderProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: BottomNavBar(),
      ),
    );
  }
}
