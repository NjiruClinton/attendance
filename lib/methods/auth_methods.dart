import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project/models/user_model.dart';

class AuthMethods{
  Future<String>loginUser (
    {
      required String email,
      required String password,
    }
  )async

  {
    String result = "some error occured";
    try{
      await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      result="Success";
    }
    on FirebaseAuthException catch(e)
    {
      result=e.message.toString();
    }
    return result;
  }
  Future<String> signUpUser(
    {
      required String userName,
      required String email,
      required String password,
    }
  )async
  {
    String result = "Some error occured";
    try{
      UserCredential credential = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      UserModel userModel = UserModel(credential.user!.uid, userName.trim(), email, "", "", "", "", "", "", "");
      await firebaseFirestore.collection("users").doc(credential.user!.uid).set(userModel.toJson());
      result = "Success";
    }
    on FirebaseAuthException catch(e)
    {
      result = e.message.toString();
    }
    return result;
  }
}