import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//import 'package:foodfindr/screens/home/navigation.dart';

class Favourite extends StatefulWidget {
  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Scaffold(body: Center(child: Text('Favourites')),));
  }
}