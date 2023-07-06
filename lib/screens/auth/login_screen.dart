

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/constants.dart';
import 'package:project/screens/auth/home_screen.dart';
import 'package:project/screens/auth/signup_screen.dart';
import 'package:project/widgets/input_field.dart';
import '../../methods/auth_methods.dart';
import 'auth.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String? errorMessage = '';
  bool isLogin = true;

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try{
      await Auth().signInWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
    } on FirebaseAuthException catch (e){
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword()async {
    try{
      await Auth().createUserWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
    } on FirebaseAuthException catch (e){
      setState(() {
        errorMessage = e.message;
      });
    }
  }
  Widget _entryField(
      String title,
      TextEditingController controller
      ){
    return TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: title,
        )
    );
  }
  Widget _errorMessage(){
    return Text(errorMessage == "" ? "" : 'Humm ? $errorMessage');
  }
  Widget _submitButton() {
    return ElevatedButton(
        onPressed: isLogin ? signInWithEmailAndPassword : createUserWithEmailAndPassword,
        child: Text(isLogin ? "Login" : "SignUp")
    );
  }
  Widget _loginOrRegisterButton(){
    return TextButton(
      onPressed: (){
        setState(() {
        }
        );
      }, child: Text(isLogin ? "Sign Up instead" : "Login instead"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sign In"),
          actions: [
            // IconButton(
            //   onPressed: (){},
            //   icon: Icon(Icons.arrow_back),
            // ),
          ],
        ),
        backgroundColor: Colors.white,
        body: Container(
            height: double.infinity,
            width: double.infinity,
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _entryField("email", _controllerEmail),
                _entryField("password", _controllerPassword),
                _errorMessage(),
                // _submitButton(),
                // _loginOrRegisterButton(),
                ElevatedButton(
                  onPressed: () async {
                    try{
                      UserCredential userCredential = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                          email: _controllerEmail.text, password: _controllerPassword.text
                      );
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()) );
                    } on FirebaseAuthException catch (e){
                      print(e);
                    }
                  },
                  child: Text("Log In"),
                ),
                TextButton(
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUp())
                    );
                  }, child: Text("sign up instead?"),
                )


              ],
            )
        )
      // Column(
      //   children: [
      //     Expanded(
      //       flex: 5,
      //       child: Container(
      //           child: Text("SIGN IN")
      //       ),
      //     ),
      //     Expanded(
      //       flex: 1,
      //       child: GestureDetector(
      //         child: Text(
      //           "New User? Register Here",
      //           style: TextStyle(
      //             color: Colors.white,
      //             fontWeight: FontWeight.bold,
      //             fontSize: 20.0
      //           ),
      //         ),
      //         onTap: (){
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(builder: (context) => SignUp()),
      //           );
      //         },
      //       ),
      //     ),
      //   ]
      // ),
    );
  }
}