import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_screen.dart';
import 'login_screen.dart';

signup(email, password, BuildContext context) async {
  try {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    print('------SUCCESS---------');
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'The account already exists for that email. Try logging in!'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  } catch (e) {
    print(e);
  }
}

signin(email, password, context) async {
  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    void saveLoginStatus() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Homescreen()),
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('No user found for that email.'),
          duration: Duration(seconds: 2),
        ),
      );
    } else if (e.code == 'wrong-password') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Wrong password provided for that user.'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}
