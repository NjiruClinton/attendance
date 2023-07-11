import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project/responsive/mobile_screen.dart';
import 'package:project/responsive/responsive.dart';
import 'package:project/web_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: Responsive(mobilescreen: MobileScreen(), webscreen: WebScreen(),
      )
    ); 
  }
}





