import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:untitled12/Screens/Home_Screen.dart';
import 'package:untitled12/Screens/Sign_in.dart';

import 'Bottom_Navigation.dart';

class AuthService {
  handleAuthState() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return BottomNavigation();
          } else {
            return const SignIn();
          }
        });
  }

  signInWithGoogle(BuildContext ctx) async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser =
    await GoogleSignIn(scopes: <String>["email"]).signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
    await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential).then((value) =>
        Navigator.of(ctx)
            .push(MaterialPageRoute(builder: (_) => BottomNavigation())));
  }

  //Sign out43
  signOut(BuildContext ctx) {
    FirebaseAuth.instance.signOut();
    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const SignIn()),
            (route) => false);
  }
}