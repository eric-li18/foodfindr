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

  String name = '';
  String email = '';
  String password = '';
  String tempPassword = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: Container(
          padding: EdgeInsets.only(top: 100.0, left: 30.0, right: 30.0),
          child: Form(
            key: _formKey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Create Account",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Colors.black,
                      fontFamily: 'Futura Medium',
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 30)),
                  SizedBox(
                    height: 370,
                    child: _emailAndPasswordForms(),
                  ),
                  SizedBox(height: 7.0),
                  Text(error, style: TextStyle(color: Colors.red),),
                  Padding(padding: EdgeInsets.only(top: 15)),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        _barButton("Go back", () { widget.toggleSignedIn(); }),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 15)),
                        _barButton("Register", () async {
                          if (_formKey.currentState.validate()) {
                            dynamic result = await _auth.registerWithEmail(email, password);
                            if (result == null) {
                              setState(() {
                                error = "Please supply a valid email";
                              });
                            }
                          }
                        }),
                      ]
                    )
                  )
                  ]),
          ),
        ));
  }

  Column _emailAndPasswordForms() {
    return Column(children: <Widget>[
      TextFormField(
        validator: (value) => value.isEmpty ? "Enter your name" : null,
        decoration: InputDecoration(
          hintText: "Name",
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                width: 0, 
                style: BorderStyle.none,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                color: Colors.red[300],
                width: 2, 
                style: BorderStyle.solid,
            ),
          ),
        ),
        onChanged: (value) {
          setState(() => name = value.trim());
        },
      ),
      SizedBox(height: 15.0),
      TextFormField(
        validator: (value) => value.isEmpty ? "Enter an email" : null,
        decoration: InputDecoration(
          hintText: "Email",
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                width: 0, 
                style: BorderStyle.none,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                color: Colors.red[300],
                width: 2, 
                style: BorderStyle.solid,
            ),
          ),
        ),
        onChanged: (value) {
          setState(() => email = value.trim());
        },
      ),
      SizedBox(height: 15.0),
      TextFormField(
        validator: (value) =>
            value.length < 6 ? "Enter a password 6+ characters long" : null,
        decoration: InputDecoration(
          hintText: "Password",
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                width: 0, 
                style: BorderStyle.none,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                color: Colors.red[300],
                width: 2, 
                style: BorderStyle.solid,
            ),
          ),
        ),
        onChanged: (value) {
          setState(() => tempPassword = value);
        },
        obscureText: true,
      ),
      SizedBox(height: 15.0),
      TextFormField(
        validator: (value) {
          if (value.isEmpty) {
            return("Enter your password again");
          } else if(value != tempPassword){
            return("Passwords don't match");
          }
          return null;
        },
        decoration: InputDecoration(
          hintText: "Re-enter Password",
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                width: 0, 
                style: BorderStyle.none,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                color: Colors.red[300],
                width: 2, 
                style: BorderStyle.solid,
            ),
          ),
        ),
        onChanged: (value) {
          setState(() => password = value);
        },
        obscureText: true,
      ),
    ]);
  }

  ButtonTheme _barButton(String text, Function onPressed) {
    return ButtonTheme(
      minWidth: 150.0,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow( 
              color: Colors.white,
              offset: new Offset(-8.0, -8.0), 
              blurRadius: 10.0,
              spreadRadius: 1.0
            ),
            BoxShadow( 
              color: Colors.grey[300],
              offset: new Offset(8.0, 8.0), 
              blurRadius: 10.0,
              spreadRadius: 1.0
            ),
          ],
        ),
        child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(6.0),
          ),
          color: Colors.transparent,
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'Futura Medium',
              color: Colors.black,
              fontSize: 15,
            ),
          ),
          onPressed: onPressed,
        )
      )
    );
  }
}
