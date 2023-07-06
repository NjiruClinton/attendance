import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:project/screens/auth/login_screen.dart';

import 'auth.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
Future<void> signOut() async {
  await Auth().signOut();
}

final User? user = Auth().auth.currentUser;

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Home Screen", style: TextStyle(fontSize: 20),),
              Text("Welcome", style: TextStyle(fontSize: 20),),
              // the logged in email
              Text(user?.email ?? "No email"),
              Text("logout"),
              ElevatedButton(
                child: Text("Logout"),
                onPressed: () async {
                await Auth().signOut();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => SignIn(),
                  ),
                );
              },

              )
            ],
          ),
        ),
    );
  }
}