import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodfindr/services/auth.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // add picture and name from Facebook or Google
            displayUserData(),
            SizedBox(height: 36.0),
            _sectionDivider(),
            _settingButton("Edit Account", () {}, FontAwesomeIcons.pen),
            _settingButton("Settings", () {
              print("hello");
            }, FontAwesomeIcons.cog),
            _settingButton("Preferences", () {}, FontAwesomeIcons.solidHeart),
            _sectionDivider(),
            _settingButton("About", () {})
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.person, size: 30.0),
        onPressed: () {
          AuthService().signOut();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }

  Divider _sectionDivider() {
    const double indentValue = 15.0;
    return Divider(
      color: Colors.black,
      height: 16,
      indent: indentValue,
      endIndent: indentValue,
    );
  }

  FlatButton _settingButton(String text, Function onPressed, [IconData icon]) {
    List<Widget> children = <Widget>[
      SizedBox(width: 10.0),
      SizedBox(width: 10.0),
      Text(text, style: TextStyle(fontSize: 17.0, fontFamily: "Futura Book"))
    ];
    if (icon != null) {
      children.insert(1, Icon(icon, size: 20.0));
    }
    return FlatButton(
        onPressed: onPressed,
        padding: EdgeInsets.symmetric(vertical: 15.0),
        child: Row(
          children: children,
        ));
  }

  Row displayUserData() {
    print("=====================================================");
    Map<String,dynamic> profile = AuthService.profileData;
    var profileName = "User";
    var profilePicture =
        "https://www.kindpng.com/picc/m/111-1113220_peepo-emote-hd-png-download.png";
    if (profile != null) {
      profilePicture = profile['picture']['data']['url'];
      profileName = profile['name'];
    }
    const double dimension = 70.0;
    return Row(children: <Widget>[
      Container(
        height: dimension,
        width: dimension,
        padding: EdgeInsets.all(21.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.fitHeight,
            image: NetworkImage(profilePicture),
          ),
        ),
      ),
      Column(
        children: <Widget>[
          Text(profileName),
        ],
      ),
    ]);
  }
}
