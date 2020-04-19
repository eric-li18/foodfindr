import 'package:flutter/material.dart';
import 'package:foodfindr/services/auth.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Sign in to your account",
                ),
                _emailAndPasswordForms(),
                SizedBox(height: 7.0),
                Text(error),
                SizedBox(height: 3.0),
                _barButton("SIGN IN", () async {
                  if (_formKey.currentState.validate()) {
                    dynamic result =
                        await _auth.signInWithEmail(email, password);
                    if (result == null) {
                      setState(() {
                        error = "Please supply a valid email";
                      });
                    }
                  }
                }),
                _barButton("REGISTER NOW", () {
                  widget.toggleSignedIn();
                }),
                _signInDivider(),
                SizedBox(height: 7.0),
                // Row(
                // children: <Widget>[
                // Expanded(child: SizedBox(width: 1.0)),
                SignInButton(Buttons.Facebook, onPressed: () {
                  AuthService().signInWithFacebook();
                }),
                // RaisedButton.icon(icon: FaIcon(FontAwesomeIcons.google), onPressed: () {print("hello");},)
                // Expanded(child: SizedBox(width: 1.0)),
                // SizedBox.fromSize(
                //   size: Size(40, 40),
                //   child: ClipOval(
                //     child: Material(
                //       color: Colors.grey[850],
                //       child: InkWell(
                //         onTap: () {
                //           AuthService().signInWithGoogle();
                //         },
                //         child: Column(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: <Widget>[
                //             FaIcon(FontAwesomeIcons.google,
                //                 color: Colors.white),
                //           ],
                //         ),
                //       ),
                //     ),
                //   ),
                // ),

                // Expanded(child: SizedBox(width: 1.0)),
                SignInButton(Buttons.GoogleDark, onPressed: () {
                  AuthService().signInWithGoogle();
                }),
                SignInButtonBuilder(
                  text: 'Sign in Anonymously',
                  icon: Icons.person_outline,
                  onPressed: () {AuthService().signInAnon();},
                  backgroundColor: Colors.blueGrey[700],
                )
                // Expanded(child: SizedBox(width: 1.0)),
                // ],
                // ),
              ]),
        ),
      ),
    );
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
        validator: (value) => value.isEmpty ? "Enter a password" : null,
        decoration: InputDecoration(hintText: "Password"),
        onChanged: (value) {
          setState(() => password = value);
        },
        obscureText: true,
      )
    ]);
  }

  Row _signInDivider() {
    return Row(
      children: <Widget>[
        Expanded(
          child: new Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              child: Divider(
                color: Colors.black,
                height: 36,
              )),
        ),
        Text("OR"),
        Expanded(
          child: new Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              child: Divider(
                color: Colors.black,
                height: 36,
              )),
        ),
      ],
    );
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
