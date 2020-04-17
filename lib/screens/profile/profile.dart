import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodfindr/screens/home/navigation.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(child: Text('favourites page'))),
    );
  }
}