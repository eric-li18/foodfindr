import 'package:flutter/material.dart';
import 'package:foodfindr/services/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[600],
        elevation: 0.0,
        title: Text('Sign in'),
      ),
      body: Container(
        child: RaisedButton(
          padding: EdgeInsets.all(10.0),
          child: Text("Sign in!"),
          onPressed: () async{
            dynamic result = await _auth.signInAnon();
            if(result == null){
              print('cannot sign in');
            }
            else {
              print("signed in");
              print(result.uid);
            }
          },
        ),
      ),
    );
  }
}