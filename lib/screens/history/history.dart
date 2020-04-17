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
    return Container(
      child: Center(
        child: Text('This is the history page'))
        );
        
  }
}