import 'package:flutter/material.dart';
import 'package:foodfindr/screens/favourites/favourites.dart';
import 'package:foodfindr/screens/history/history.dart';
import 'package:foodfindr/screens/home/home.dart';
import 'package:foodfindr/screens/profile/profile.dart';
import 'package:foodfindr/screens/wrapper.dart';
import 'package:foodfindr/services/auth.dart';
import 'package:foodfindr/models/user.dart';
import 'package:provider/provider.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  Map routes = {
    '/' : (context) => Home(),
    '/profile' : (context) => Profile(),
    '/history' : (context) => History(),
    '/favourites' : (context) => Favourite()
  };

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
