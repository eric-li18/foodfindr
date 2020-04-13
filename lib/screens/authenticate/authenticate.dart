import 'package:flutter/material.dart';
import 'package:foodfindr/screens/authenticate/sign_in.dart';
import 'package:foodfindr/screens/authenticate/register.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  
  bool showSignedin = true;
  void toggleSignedIn (){
    setState(() => showSignedin = !showSignedin);
  }

  @override
  Widget build(BuildContext context) {
    return showSignedin ? SignIn(toggleSignedIn: toggleSignedIn) : Register(toggleSignedIn: toggleSignedIn);
  }
}
