import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthMethods{
  final FirebaseAuth _auth=FirebaseAuth.instance;
  final FirebaseFirestore _firestore=FirebaseFirestore.instance;

  //sign up 
 Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file,
   })async{
    String res="some error occurred";
    try {
      if(email.isNotEmpty || password.isNotEmpty || username.isNotEmpty || bio.isNotEmpty|| file!=null){
        //reg user

      UserCredential cred= await _auth.createUserWithEmailAndPassword(email: email, password: password);

    print(cred.user!.uid);

      // add user to db
     await _firestore.collection("users").doc(cred.user!.uid).set({
        "username" :username,
        "password" :password,
        "email" :email,
        "bio":bio,
        "uid":cred.user!.uid,
       " followers":[],
       "following":[]

      });
    print("success");

      } 

    } catch (e) {
      res=e.toString();
      
    }
return res;
   }
}