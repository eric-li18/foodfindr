import 'package:flutter/material.dart';
import 'package:foodfindr/services/auth.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red[600],
        elevation: 0.0,
        centerTitle: true,
        title: Text('Home'),
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () {
              AuthService().signOut();
            },
            icon: Icon(Icons.person),
            label: Text("Logout"),
          )
        ],
      ),
    );
  }
}
