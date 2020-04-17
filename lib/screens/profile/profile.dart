import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodfindr/screens/home/navigation.dart';
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
        child: Center(child: Text('profile page'))),
        floatingActionButton: FloatingActionButton(onPressed: () {AuthService().signOut();},),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}