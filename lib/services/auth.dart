import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodfindr/models/user.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

//Consider making this Auth service a Singleton?
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Format FireBaseUser as type user with only user id (UID)
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  //Listen for Auth changes
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  //Sign in as anon
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Sign in with email and password
  Future signInWithEmail(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return _userFromFirebaseUser(result.user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Register with email & password
  Future registerWithEmail(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return _userFromFirebaseUser(result.user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Sign in and register with Facebook
  Future<FacebookLoginResult> _handleFBSignIn() async {
    try {
      FacebookLogin facebookLogin = FacebookLogin();
      FacebookLoginResult facebookLoginResult =
          await facebookLogin.logIn(['email']);
      switch (facebookLoginResult.status) {
        case FacebookLoginStatus.cancelledByUser:
          print("Cancelled");
          return null;
          break;
        case FacebookLoginStatus.error:
          print("error");
          return null;
          break;
        case FacebookLoginStatus.loggedIn:
          print("Logged In");
          break;
      }
      return facebookLoginResult;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signInWithFacebook() async {
    FacebookLoginResult facebookLoginResult = await _handleFBSignIn();
    if (facebookLoginResult != null) {
      final accessToken = facebookLoginResult.accessToken.token;
      if (facebookLoginResult.status == FacebookLoginStatus.loggedIn) {
        final facebookAuthCred =
            FacebookAuthProvider.getCredential(accessToken: accessToken);
        final result = await _auth.signInWithCredential(facebookAuthCred);
        return _userFromFirebaseUser(result.user);
      }
      return null;
    }
  }

  //Sign in with Google
  Future<GoogleSignInAccount> _handleGoogleSignIn() async {
    GoogleSignIn googleSignIn = GoogleSignIn(
        scopes: ['email', 'https://www.googleapis.com/auth/contacts.readonly']);
    try {
      GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
      return googleSignInAccount;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signInWithGoogle() async {
    try {
      GoogleSignInAccount googleSignInAccount = await _handleGoogleSignIn();
      final googleAuth = await googleSignInAccount.authentication;
      final googleAuthCred = GoogleAuthProvider.getCredential(
          idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
      final result = await _auth.signInWithCredential(googleAuthCred);
      return _userFromFirebaseUser(result.user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}