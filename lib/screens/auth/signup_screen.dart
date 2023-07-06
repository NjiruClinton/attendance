import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/constants.dart';
import 'package:project/screens/auth/home_screen.dart';
import 'package:project/screens/auth/login_screen.dart';
import 'package:project/widgets/input_field.dart';

import '../../methods/auth_methods.dart';
import 'auth.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String? errorMessage = '';
  bool isLogin = true;

  final TextEditingController _controllerUsername = TextEditingController();
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

  //TODO: add username and email to firestore.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sign Up"),
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
                _entryField("username", _controllerUsername),
                _entryField("email", _controllerEmail),
                _entryField("password", _controllerPassword),
                _errorMessage(),
                // _submitButton(),
                // _loginOrRegisterButton(),
                ElevatedButton(
                  onPressed: () async {
                    try{
                      UserCredential userCredential = await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                          email: _controllerEmail.text, password: _controllerPassword.text
                      );
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen())
                      );
                    } on FirebaseAuthException catch (e) {
                      print(e);
                    }
                  },
                  child: Text("Sign Up"),
                ),
                TextButton(
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignIn())
                    );
                  }, child: Text("Login instead"),
                )


              ],
            )
        )
      // Column(
      //   children: [
      //     TextFormField(
      //       decoration: InputDecoration(
      //         border: OutlineInputBorder(),
      //       hintText: "Enter name"
      //       ),
      //     ),
      //     ElevatedButton(
      //       onPressed: (){},
      //       child: Text("Submit"),
      //     )
      //   ]
      // ),
    );
  }
}

