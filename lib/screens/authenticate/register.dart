import 'package:flutter/material.dart';
import 'package:foodfindr/services/auth.dart';


class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[600],
        elevation: 0.0,
        title: Text('Sign in'),
      ),
      body: Container(
        child: Form(
          child : Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                onChanged: (value){
                  setState(() => email = value);
                },
              ), 
              SizedBox(height: 20.0),
              TextFormField(
                onChanged: (value){
                  setState(() => password = value);
                },
              ),
              RaisedButton(
                child: Text("Sign in"),
                onPressed: (){
                  print(email);
                  print(password);
                },
              ),
            ]
          ),
        ),
      ),
    );
  }
}