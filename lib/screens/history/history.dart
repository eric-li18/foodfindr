import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodfindr/screens/home/navigation.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Text('History page')),
      bottomNavigationBar: Navigation(),
    );
  }
}