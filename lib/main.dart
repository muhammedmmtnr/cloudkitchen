import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_kitchen/Screen/bottomnavigation.dart';
import 'package:cloud_kitchen/Screen/login/loginscreen.dart';
import 'package:cloud_kitchen/firebase_options.dart';
import 'package:cloud_kitchen/provider/cartprovider.dart';
import 'package:cloud_kitchen/provider/menuprovider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:firebase_core/firebase_core.dart';
import 'provider/orderprovider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => OrderProvider()),
        ChangeNotifierProvider(create: (_) => MenuProvider()),
      ],
      child: MaterialApp(
        title: 'Cloud kitchen',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const GoogleSignInScreen(),
      ),
    );
  }
}
