import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodfindr/services/auth.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // add picture and name from Facebook or Google
            SizedBox(height: 30.0),
            _sectionDivider(),
            _settingButton("Settings", Icons.settings, () {
              print("hello");
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.person, size: 30.0),
        onPressed: () {
          AuthService().signOut();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }

  Divider _sectionDivider() {
    const double indentValue = 15.0;
    return Divider(
      color: Colors.black,
      height: 36,
      indent: indentValue,
      endIndent: indentValue,
    );
  }

  FlatButton _settingButton(String text, IconData icon, Function onPressed) {
    return FlatButton(
        onPressed: onPressed,
        padding: EdgeInsets.symmetric(vertical: 15.0),
        child: Row(
          children: <Widget>[
            SizedBox(width: 10.0),
            Icon(icon),
            SizedBox(width: 5.0),
            Text(text)
          ],
        ));
  }
}
