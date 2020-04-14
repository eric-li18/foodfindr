import 'package:flutter/material.dart';

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.local_dining, size: 36.0),
        backgroundColor: Colors.green[400],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 6.0,
          child: new Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.home,
                  size: 36.0,
                ),
              ),
              IconButton(
                  icon: Icon(
                    Icons.favorite,
                    size: 36.0,
                  ),
                  padding: EdgeInsetsDirectional.only(end: 80.0)),
              IconButton(
                  icon: Icon(
                Icons.history,
                size: 38.0,
              )),
              IconButton(
                  icon: Icon(
                Icons.account_circle,
                size: 38.0,
              ))
            ],
          )),
    );
  }
}
