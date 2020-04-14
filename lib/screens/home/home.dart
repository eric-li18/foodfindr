import 'package:flutter/material.dart';
import 'package:foodfindr/services/auth.dart';
import 'package:foodfindr/screens/home/navigation.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Navigation(),
    );
  }
}
