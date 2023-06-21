import 'package:flutter/material.dart';
import 'package:project/constants.dart';
import 'package:project/screens/auth/home_screen.dart';
import 'package:project/screens/auth/login_screen.dart';
import 'package:project/widgets/input_field.dart';

import '../../methods/auth_methods.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  
  

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: isWeb ? width / 4 : width / 1.2,
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "SignUp Screen",
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      InputField(
                          hintText: "UserName",
                          controller: _usernameController),
                      const SizedBox(
                        height: 25,
                      ),
                      InputField(
                          hintText: "Email", controller: _emailController),
                      const SizedBox(
                        height: 25,
                      ),
                      InputField(
                          hintText: "Password",
                          controller: _passwordController),
                      const SizedBox(
                        height: 25,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_emailController.text.isEmpty || _passwordController.text.isEmpty || _usernameController.text.isEmpty) {
                            showFlushBar(context, "Error","Email, Username or Password can't be empty");
                          }
                          else{
                            _signUp(_usernameController.text, _emailController.text,_passwordController.text);
                          }
                        },
                        child: const Text("SignUp"),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      const Text("Already have an account"),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
                        },
                        child: const Text("Login"),
                      ),
                    ],
                  ),
                 
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _signUp(String username, email, String password)async {
    setState (() {
      showFlushBar(context, "Wait", "Processing");
    });
    String result=await AuthMethods().signUpUser(userName: username, email:email, password:password);
    setState((){
      if(result=="success"){
        showFlushBar(context, result, "Successfully signed in");
        Future.delayed(const Duration(seconds:2),(){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));
        });
        
      }
      else{
        showFlushBar(context, "Error Occurred", result);
      }
    });
  }
}


