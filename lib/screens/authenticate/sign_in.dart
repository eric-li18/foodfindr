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
      backgroundColor: Colors.brown[100],
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          child : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
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
              FlatButton(
                child: Text("Sign in"),
                onPressed: (){
                  print(email);
                  print(password);
                },
              ),
              FlatButton(
                child: Text("Register now"),
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