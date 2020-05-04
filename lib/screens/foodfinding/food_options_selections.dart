import 'package:flutter/material.dart';

class FoodOptionsSelections extends StatefulWidget {
  @override
  _FoodOptionsSelectionsState createState() => _FoodOptionsSelectionsState();
}

class _FoodOptionsSelectionsState extends State<FoodOptionsSelections> {
  bool oneDollar = false;
  bool twoDollar = false;
  bool threeDollar = false;
  bool breakfast = false;
  bool lunch = false;
  bool dinner = false;
  bool brunch = false;
  bool dessert = false;
  bool lateNight = false;

  double _value = 5;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            FlatButton(
              color: oneDollar ? Colors.green[100] : Colors.white,
              onPressed: () {
                setState(() {
                  oneDollar = !oneDollar;
                });
              },
              child: Text("\$"),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                  side: BorderSide(color: Colors.black, width: 0.25)),
            ),
            FlatButton(
              color: twoDollar ? Colors.green[100] : Colors.white,
              onPressed: () {
                setState(() {
                  twoDollar = !twoDollar;
                });
              },
              child: Text("\$\$"),
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black, width: 0.25)),
            ),
            FlatButton(
                color: threeDollar ? Colors.green[100] : Colors.white,
                onPressed: () {
                  setState(() {
                    threeDollar = !threeDollar;
                  });
                },
                child: Text("\$\$\$"),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    side: BorderSide(color: Colors.black, width: 0.25))),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FlatButton(
              color: breakfast ? Colors.green[100] : Colors.white,
              onPressed: () {
                setState(() {
                  breakfast = !breakfast;
                });
              },
              child: Text("Breakfast"),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(color: Colors.black, width: 0.25)),
            ),
            FlatButton(
              color: lunch ? Colors.green[100] : Colors.white,
              onPressed: () {
                setState(() {
                  lunch = !lunch;
                });
              },
              child: Text("Lunch"),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(color: Colors.black, width: 0.25)),
            ),
            FlatButton(
                color: dinner ? Colors.green[100] : Colors.white,
                onPressed: () {
                  setState(() {
                    dinner = !dinner;
                  });
                },
                child: Text("   Dinner   "),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color: Colors.black, width: 0.25))),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FlatButton(
              color: brunch ? Colors.green[100] : Colors.white,
              onPressed: () {
                setState(() {
                  brunch = !brunch;
                });
              },
              child: Text("  Brunch  "),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(color: Colors.black, width: 0.25)),
            ),
            FlatButton(
              color: dessert ? Colors.green[100] : Colors.white,
              onPressed: () {
                setState(() {
                  dessert = !dessert;
                });
              },
              child: Text("Dessert"),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(color: Colors.black, width: 0.25)),
            ),
            FlatButton(
                color: lateNight ? Colors.green[100] : Colors.white,
                onPressed: () {
                  setState(() {
                    lateNight = !lateNight;
                  });
                },
                child: Text("Late Night"),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color: Colors.black, width: 0.25))),
          ],
        ),
        SizedBox(
          height: 35,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("5km"),
            SliderTheme(
                child: Slider(
                  min: 5,
                  max: 50,
                  divisions: 10,
                  label: '$_value',
                  value: _value,
                  onChanged: (value) {
                    setState(() {
                      _value = value;
                    });
                  },
                ),
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: Colors.green[400],
                  inactiveTrackColor: Colors.green[100],
                  trackShape: RoundedRectSliderTrackShape(),
                  trackHeight: 4,
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12),
                  overlayColor: Colors.green.withAlpha(32),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 28),
                  thumbColor: Colors.green[600],
                  tickMarkShape: RoundSliderTickMarkShape(),
                  activeTickMarkColor: Colors.green[400],
                  inactiveTickMarkColor: Colors.green[100],
                  valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                  valueIndicatorColor: Colors.green[400],
                  valueIndicatorTextStyle: TextStyle(color: Colors.white),
                )),
            Text("50km"),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              color: Colors.black,
              child: Text(
                "Start",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {},
            )
          ],
        )
      ],
    ));
  }
}
