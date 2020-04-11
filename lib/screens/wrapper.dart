import 'package:flutter/material.dart';
import 'package:foodfindr/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return either Home or Authenticate widget
    return Home();
  }
}
