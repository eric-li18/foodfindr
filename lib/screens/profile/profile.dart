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
            _sectionDivider(),
            _settingButton("Edit Account", () {}, FontAwesomeIcons.pen),
            _settingButton("Settings", () {
              print("hello");
            }, FontAwesomeIcons.cog),
            _settingButton("Preferences", () {}, FontAwesomeIcons.solidHeart),
            _sectionDivider(),
            _settingButton("Logout", () {
              AuthService().signOut();
            }),
            _settingButton("About", () {})
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.person, size: 30.0),
      //   onPressed: () {
      //     AuthService().signOut();
      //   },
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
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
      SizedBox(width: 20.0),
      SizedBox(width: 10.0),
      Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w400
        ),
      )
    ];
    if (icon != null) {
      children.insert(1, Icon(icon, size: 17.0));
    }
    return FlatButton(
        onPressed: onPressed,
        padding: EdgeInsets.symmetric(vertical: 15.0),
        child: Row(
          children: children,
        ));
  }

  Row displayUserData() {
    Map<String, dynamic> profile = AuthService().profileData;
    const double dimension = 55.0;
    var profileName = "Anonymous User";
    String profileEmail = "";
    ImageProvider image =
        ExactAssetImage("assets/images/defaultpicture.png"); // LOAD ICON HERE

    if (profile != null) {
      var profilePicture = profile['picture']['data']['url'];
      profileName = profile['name'];
      profileEmail = profile['email'];
      image = NetworkImage(profilePicture);
    }
    print(profile);

    return Row(children: <Widget>[
      Container(
        padding: EdgeInsets.only(left: 10.0, right: 7.0, bottom: 5.0),
        child: Container(
          height: dimension,
          width: dimension,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.fitHeight,
              image: image,
            ),
          ),
        ),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            profileName,
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            profileEmail,
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.black45,
            ),
          )
        ],
      ),
    ]);
  }
}
