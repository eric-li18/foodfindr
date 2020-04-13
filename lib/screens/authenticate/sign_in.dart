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
  final _formKey = GlobalKey<FormState>();
  
  String email = '';
  String password = '';
  String error = '';
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[150],
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Sign in to your account",
              ),
              TextFormField(
                validator: (value) => value.isEmpty ? "Enter an email" : null,
                decoration: InputDecoration(
                  hintText: "Email"
                ),
                onChanged: (value){
                  setState(() => email = value);
                },
              ), 
              SizedBox(height: 20.0),
              TextFormField(
                validator: (value) => value.length < 6 ? "Enter a password 6+ characters long" : null,
                decoration: InputDecoration(
                  hintText: "Password"
                ),
                onChanged: (value){
                  setState(() => password = value);
                },
                obscureText: true,
              ),
              SizedBox(height: 10.0),
              Text(error),
              SizedBox(height: 10.0),
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
                onPressed: () async {
                  if(_formKey.currentState.validate()){
                    dynamic result = await _auth.signInWithEmail(email, password);
                    if (result == null){
                      setState(() { error = "Please supply a valid email"; });
                    }
                  }
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