import 'package:flutter/material.dart';
import 'package:foodfindr/services/auth.dart';

class Register extends StatefulWidget {
  final Function toggleSignedIn;
  Register({this.toggleSignedIn});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String tempPassword = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _formKey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Register a new account",),
                  _emailAndPasswordForms(),
                  SizedBox(height: 7.0),
                  Text( error, style: TextStyle( color: Colors.red),),
                  SizedBox(height: 3.0),
                  _barButton("REGISTER", () async {
                    if (_formKey.currentState.validate()) {
                      dynamic result = await _auth.registerWithEmail(email, password);
                      if (result == null) {
                        setState(() {
                          error = "Please supply a valid email";
                        });
                      }
                    };
                  }),
                  _barButton("ALREADY HAVE AN ACCOUNT?", () { widget.toggleSignedIn(); }),
                ]),
          ),
        ));
  }

  Column _emailAndPasswordForms() {
    return Column(children: <Widget>[
      TextFormField(
        validator: (value) => value.isEmpty ? "Enter an email" : null,
        decoration: InputDecoration(hintText: "Email"),
        onChanged: (value) {
          setState(() => email = value.trim());
        },
      ),
      SizedBox(height: 10.0),
      TextFormField(
        validator: (value) =>
            value.length < 6 ? "Enter a password 6+ characters long" : null,
        decoration: InputDecoration(hintText: "Password"),
        onChanged: (value) {
          setState(() => tempPassword = value);
        },
        obscureText: true,
      ),
      SizedBox(height: 10.0),
      TextFormField(
        validator: (value) {
          if (value.isEmpty) {
            return("Enter your password again");
          } else if(value != tempPassword){
            return("Passwords don't match");
          }
          return null;
        },
        decoration: InputDecoration(hintText: "Re-enter Password"),
        onChanged: (value) {
          setState(() => password = value);
        },
        obscureText: true,
      ),
    ]);
  }

  ButtonTheme _barButton(String text, Function onPressed) {
    return ButtonTheme(
        minWidth: 400.0,
        child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(6.0),
          ),
          color: Colors.red,
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'Futura Medium',
              color: Colors.white,
            ),
          ),
          onPressed: onPressed,
        ));
  }
}
