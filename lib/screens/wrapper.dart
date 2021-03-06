import 'package:flutter/material.dart';
import 'package:foodfindr/models/user.dart';
import 'package:foodfindr/screens/authenticate/authenticate.dart';
import 'package:foodfindr/screens/home/navigation.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    // return either Home or Authenticate widget
    return user == null
        ? Authenticate()
        : MaterialApp(
            home: Navigation(),
            theme: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.green,
                elevation: 0,
              ),
              //buttonTheme: ButtonThemeData(buttonColor: Colors.green),
            ),
          );
  }
}
