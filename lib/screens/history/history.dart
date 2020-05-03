import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'history_card.dart';
//import 'package:foodfindr/screens/home/navigation.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  double _rating;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15, bottom: 19),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          new BoxShadow(
              color: Colors.grey[300],
              offset: new Offset(0.0, 10.0),
              blurRadius: 10.0,
              spreadRadius: 1.0)
        ],
      ),
      child: Column(children: <Widget>[
        InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => HistoryCard()));
          },
          child: Container(
            height: 200,
            alignment: Alignment.center,
            decoration: ShapeDecoration(
                image: DecorationImage(
                    image: ExactAssetImage('assets/images/Ramen.jpg'),
                    fit: BoxFit.cover),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.circular(10))),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 10, top: 6),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Sushi Tien',
                style: TextStyle(
                  fontFamily: 'Futura Medium',
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, top: 6),
              alignment: Alignment.bottomLeft,
              child: Text(
                '2020.02.14',
                style: TextStyle(
                  fontFamily: 'Futura Medium',
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, top: 6),
              alignment: Alignment.bottomLeft,
              child: RatingBar(
                initialRating: 0,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                unratedColor: Colors.grey.withAlpha(50),
                itemCount: 3,
                itemSize: 14.0,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.thumb_up,
                  color: Colors.green[300],
                ),
                onRatingUpdate: (rating) {
                  setState(() {
                    _rating = rating;
                  });
                },
              ),
            )
          ],
        ),
      ]),
    );
  }
}
