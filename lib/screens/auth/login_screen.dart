

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project/constants.dart';
import 'package:project/screens/auth/home_screen.dart';
import 'package:project/screens/auth/signup_screen.dart';
import 'package:project/widgets/input_field.dart';
import '../../methods/auth_methods.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen ({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    return  Scaffold(
      body: Center(
        child:SizedBox(
           width: isWeb? width/4:width / 1.2,
           child: SingleChildScrollView(
            child:Center(
               child: Column(
                 children: [
                   Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text("Login Screen", style: TextStyle(fontSize: 20),),
                        const SizedBox(height: 35,),
                        InputField(hintText: "Email", controller: _emailController),
                        const SizedBox( height: 25,),
                        InputField(hintText: "Password", controller: _passwordController),
                        const SizedBox(height: 25,),

                        ElevatedButton(
                          onPressed: (){
                            if (_emailController.text.isEmpty || _passwordController.text.isEmpty){
                              showFlushBar(context, "Error", "Email or password can't be empty");
                            }
                            else{
                              _login(_emailController.text,_passwordController.text);
                            }
                          }, 
                          child: const Text("Login"),)
                      ],
                    ),
                     Column(
                    children: [
                      const Text("Don't have an account"),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const SignupScreen(),
                            ),
                          );
                        },
                        child: const Text("Signup"),
                      ),
                    ],
                  )
                 ],
               ),
            ),      
           ),   
          ),
        ), 
      ); 
  }


  void _login(String email, String password)async {
    setState (() {
      showFlushBar(context, "Wait", "Processing");
    });
    String result=await AuthMethods().loginUser(email:email, password:password);
    setState((){
      if(result=="success"){
        showFlushBar(context, result, "Successfully logged in");
        Future.delayed(const Duration(seconds: 2),(){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));
        });
        
      }
      else{
        showFlushBar(context, "Error Occurred", result);
      }
    });
  }

  
}