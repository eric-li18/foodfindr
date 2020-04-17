import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {

    int _currentIndex = 0;

    final List<Widget> _children = [
      Home(), 
      Favourite(), 
      History(), 
      Profile()
      ];

    return Scaffold(
      appBar: CupertinoNavigationBar(
        trailing: FlatButton.icon(
            onPressed: () {
              AuthService().signOut();
            },
            icon: Icon(Icons.person),
            label: Text("Logout"),
          ),
      ),
      body: _children[_currentIndex],
      floatingActionButton: FloatingActionButton(
            onPressed: null,
            backgroundColor: Colors.green,
            child: Icon(Icons.local_dining),
          ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 4.0,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                iconSize: 30,
                selectedItemColor: Colors.green,
                unselectedItemColor: Colors.grey,
                onTap: (int index) {
                  setState(() {
                  _currentIndex = index;
                  });
                },
                currentIndex: _currentIndex,
                elevation: 0,
                backgroundColor: Colors.white,
                items: [
                  BottomNavigationBarItem(icon: Icon(Icons.home,), title: Text("home")),
                  BottomNavigationBarItem(icon: Icon(Icons.favorite,),  title: Text("favs")),
                  BottomNavigationBarItem(icon: Icon(Icons.history,), title: Text("history")),
                  BottomNavigationBarItem(icon: Icon(Icons.account_circle,), title: Text("profile")),
            ],
            ),
      ),
    );
  }

}
