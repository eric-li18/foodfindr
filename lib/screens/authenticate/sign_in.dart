import 'package:flutter/material.dart';
import 'package:foodfindr/services/auth.dart';

class SignIn extends StatefulWidget {
  final Function toggleSignedIn;
  SignIn({this.toggleSignedIn});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[150],
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          child : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Register a new account",
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Email"
                ),
                onChanged: (value){
                  setState(() => email = value);
                },
              ), 
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Password"
                ),
                onChanged: (value){
                  setState(() => password = value);
                },
                obscureText: true,
              ),
              SizedBox(height: 20.0),
              FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.red)
                ),
                color: Colors.red,
                child: Text(
                  "Sign in",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: (){
                  print(email);
                  print(password);
                },
              ),
              FlatButton(
                 shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.red)
                ),
                color: Colors.red,
                child: Text(
                  "Register now",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: (){
                  widget.toggleSignedIn();
                },
              ),
            ]
          ),
        ),
      ),
    );
  }
}