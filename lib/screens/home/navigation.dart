import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial_material_design/flutter_speed_dial_material_design.dart';
import 'package:foodfindr/screens/favourites/favourites.dart';
import 'package:foodfindr/screens/history/history.dart';
import 'package:foodfindr/screens/home/home.dart';
import 'package:foodfindr/screens/profile/profile.dart';
import 'package:foodfindr/services/auth.dart';

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _currentIndex = 0;

  List<Widget> _children = <Widget>[
    HomePage(),
    Favourite(),
    History(),
    Profile()
  ];
  void onItemTapped(index) {
    setState(() {
      _currentIndex = index;
    });
  }

  PageController _c;
  @override
  void initState() {
    _c = new PageController(
      initialPage: _currentIndex,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CupertinoNavigationBar(
      //   trailing: FlatButton.icon(
      //     onPressed: () {
      //       AuthService().signOut();
      //     },
      //     icon: Icon(Icons.person),
      //     label: Text("Logout"),
      //   ),
      // ),
      body: new PageView(
        controller: _c,
        onPageChanged: (newPage) {
          setState(() {
            this._currentIndex = newPage;
          });
        },
        children: _children,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        backgroundColor: Colors.amber[300],
        child: Icon(
          Icons.local_dining,
          size: 36,
        ),
        elevation: 0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: _buildFloatingActionButton(),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          iconSize: 30,
          selectedItemColor: Colors.amber[300],
          unselectedItemColor: Colors.grey,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          onTap: (index) {
            _c.animateToPage(index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut);
          },
          currentIndex: _currentIndex,
          elevation: 0,
          backgroundColor: Colors.white,
          items: [
            navIcon("Home", Icons.home),
            navIcon("Fav", Icons.favorite),
            navIcon("History", Icons.history),
            navIcon("Profile", Icons.account_circle)
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem navIcon(String text, IconData icon){
    return BottomNavigationBarItem(
      icon: Icon(icon),
      title: Text(
        text,
        style: TextStyle(
          fontFamily: "Futura Medium"
        ),
      )
    );
  }
}

Widget _buildFloatingActionButton() {
  final TextStyle customStyle = TextStyle(inherit: false, color: Colors.black);
  final icons = [
    SpeedDialAction(
        child: Icon(Icons.mode_edit, color: Colors.grey),
        label: Text(
          'sample text',
          style: customStyle,
        )),
    SpeedDialAction(
        child: Icon(Icons.date_range, color: Colors.grey),
        label: Text(
          'sample text',
          style: customStyle,
        )),
    SpeedDialAction(
        child: Icon(Icons.list, color: Colors.grey),
        label: Text(
          'sample text',
          style: customStyle,
        )),
  ];

  return SpeedDialFloatingActionButton(
    actions: icons,
    // Make sure one of child widget has Key value to have fade transition if widgets are same type.
    childOnFold: Icon(
      Icons.local_dining,
      key: UniqueKey(),
    ),
    childOnUnfold: Icon(
      Icons.add,
    ),
    useRotateAnimation: true,
    onAction: _onSpeedDialAction,
  );
}

_onSpeedDialAction(int selectedActionIndex) {
  print('$selectedActionIndex Selected');
}
