import 'package:flutter/material.dart';

import 'package:project/screens/auth/signup_screen.dart';

class WebScreen extends StatefulWidget {
  const WebScreen({super.key});

  @override
  State<WebScreen> createState() => _WebScreenState();
}

class _WebScreenState extends State<WebScreen> {
  @override
  Widget build(BuildContext context) {
    return const SignupScreen();
  }
}
