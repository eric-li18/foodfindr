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
      backgroundColor: Colors.grey[100],
      body: Container(
        padding: EdgeInsets.only(top: 80.0, left: 30.0, right: 30.0),
        child: Form(
          key: _formKey,
          child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Hello",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.black,
                    fontFamily: 'Futura Medium',
                  ),
                ),
                Text(
                  "Welcome aboard",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontFamily: 'Futura Medium',
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 40)),
                _emailAndPasswordForms(),
                SizedBox(height: 7.0),
                Text(error),
                SizedBox(height: 3.0),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [
                      _barButton("Sign in", () async {
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
                      Padding(padding: EdgeInsets.symmetric(horizontal: 15)),
                      _barButton("Register", () {
                        widget.toggleSignedIn();
                      }),
                    ]
                  ),
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 8)),
                _signInDivider(),
                Padding(padding: EdgeInsets.symmetric(vertical: 7)),
                // Row(
                // children: <Widget>[
                // Expanded(child: SizedBox(width: 1.0)),
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[
                      SignInButton(Buttons.Facebook, onPressed: () {
                        AuthService().signInWithFacebook();
                      }),
                      SignInButton(Buttons.GoogleDark, onPressed: () {
                        AuthService().signInWithGoogle();
                      }),
                      SignInButtonBuilder(
                        text: 'Sign in Anonymously',
                        icon: Icons.person_outline,
                        onPressed: () {AuthService().signInAnon();},
                        backgroundColor: Colors.blueGrey[700],
                      )
                    ]
                  )
                )
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
      SizedBox(height: 10.0),
      TextFormField(
        validator: (value) => value.isEmpty ? "Enter a password" : null,
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
            borderRadius: new BorderRadius.circular(10),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'Futura Medium',
              color: Colors.black,
              fontSize: 15,
            ),
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }

  // ButtonTheme _facebookButton() {
  //   return ButtonTheme(
  //     minWidth: 100.0,
  //     child: Container(
  //       height: 55,
  //       decoration: BoxDecoration(
  //         color: Colors.grey[100],
  //         borderRadius: BorderRadius.circular(10),
  //         boxShadow: [
  //           BoxShadow( 
  //             color: Colors.white,
  //             offset: new Offset(-8.0, -8.0), 
  //             blurRadius: 10.0,
  //             spreadRadius: 1.0
  //           ),
  //           BoxShadow( 
  //             color: Colors.grey[300],
  //             offset: new Offset(8.0, 8.0), 
  //             blurRadius: 10.0,
  //             spreadRadius: 1.0
  //           ),
  //         ],
  //       ),
  //       child: FlatButton(
  //         shape: RoundedRectangleBorder(
  //           borderRadius: new BorderRadius.circular(10),
  //         ),
  //         child: Row(
  //           children: <Widget>[
  //             Image.asset(
  //               'assets/Facebook.png',
  //               height: 40,
  //             ),
  //             Padding(padding: EdgeInsets.symmetric(horizontal: 7)),
  //             Text(
  //               'Sign in with Facebook',
  //               style: TextStyle(
  //                 // fontSize: 10,
  //                 fontFamily: 'Futura Medium',
  //                 color: Colors.black,
  //               ),
  //             ),
  //           ]
  //         ),
  //         onPressed: null,
  //       ),
  //     ),
  //   );
  // }
}
