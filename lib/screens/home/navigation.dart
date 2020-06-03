import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial_material_design/flutter_speed_dial_material_design.dart';
import 'package:foodfindr/screens/favourites/favourites.dart';
import 'package:foodfindr/screens/foodfinding/slide_up_panel_tab.dart';
import 'package:foodfindr/screens/history/history.dart';
import 'package:foodfindr/screens/home/home.dart';
import 'package:foodfindr/screens/profile/profile.dart';
import 'package:foodfindr/services/auth.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _currentIndex = 0;

  List<Widget> _children = <Widget>[
    HomePage(),
    Favourite(),
    null,
    History(),
    Profile()
  ];
  void onItemTapped(index) {
    setState(() {
      index == 2 ? index = _currentIndex : _currentIndex = index;
      //_currentIndex = index;
    });
  }

  PageController _c;
  @override
  void initState() {
    _c = PageController(
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
      body: Stack(
        children: <Widget>[
          Center(
              child: PageView(
            controller: _c,
            onPageChanged: (newPage) {
              //if (newPage != 2) { // controls the icon
              setState(() {
                if (newPage == 2 && _currentIndex == 1) {
                  _currentIndex = newPage + 1;
                  _c.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                } else if (newPage == 2 && _currentIndex == 3) {
                  _currentIndex = newPage - 1;
                  _c.previousPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                  print('hello');
                } else {
                  _currentIndex = newPage;
                }

                //this._currentIndex = newPage;
              });
              //}
            },
            children: _children,
          )),
          SlidingUpPanel(
            panel: ClipRRect(
              child: SlideUpPanelTab(),
              borderRadius: radius,
            ),
            borderRadius: radius,
            panelSnapping: true,
            backdropEnabled: true,
            controller: _pc,
            minHeight: 0,
            maxHeight: 400,
          )
        ],
      ),
      floatingActionButton: _buildFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          iconSize: 30,
          selectedItemColor: Colors.green[400],
          unselectedItemColor: Colors.grey,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          onTap: (index) {
            _c.animateToPage(index != 2 ? index : _currentIndex,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut);
          },
          currentIndex: _currentIndex,
          elevation: 0,
          backgroundColor: Colors.white,
          items: [
            navIcon("Home", Icons.home),
            navIcon("Fav", Icons.favorite),
            navIcon("", Icons.account_circle),
            navIcon("History", Icons.history),
            navIcon("Profile", Icons.account_circle),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem navIcon(String text, IconData icon) {
    return BottomNavigationBarItem(
        icon: Icon(icon),
        title: Text(
          text,
          style: TextStyle(fontFamily: "Futura Medium"),
        ));
  }
}

PanelController _pc = new PanelController();
BorderRadiusGeometry radius = BorderRadius.only(
    topLeft: Radius.circular(15), topRight: Radius.circular(15));

Widget _buildFloatingActionButton() {
  final TextStyle customStyle = TextStyle(inherit: false, color: Colors.black);
  final icons = [
    SpeedDialAction(
        child: Icon(
          Icons.person,
          color: Colors.grey,
          size: 35.0,
        ),
        label: Text(
          'Solo',
          style: customStyle,
        )),
    SpeedDialAction(
        child: Icon(
          Icons.group_add,
          color: Colors.grey,
          size: 35,
        ),
        label: Text(
          'Join',
          style: customStyle,
        )),
    SpeedDialAction(
        child: Icon(
          Icons.add,
          color: Colors.grey,
          size: 35,
        ),
        label: Text(
          'Create',
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
    isDismissible: true,
  );
}

_onSpeedDialAction(int selectedActionIndex) {
  print('$selectedActionIndex Selected');
  if (selectedActionIndex == 0) {
    //TODO
  } else if (selectedActionIndex == 1) {
    //TODO
  } else {
    _pc.open();
  }
}
