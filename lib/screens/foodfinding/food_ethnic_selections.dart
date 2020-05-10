import 'package:flutter/material.dart';

class FoodEthnicSelections extends StatefulWidget {
  @override
  _FoodEthnicSelectionsState createState() => _FoodEthnicSelectionsState();
}

class _FoodEthnicSelectionsState extends State<FoodEthnicSelections> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: <Widget>[
        Container(
          child: _buildFoodBubble('assets/images/american.jpg', 'American'),
        ),
        Container(
          child: _buildFoodBubble('assets/images/chinese.jpg', 'Chinese'),
        ),
        Container(
          child: _buildFoodBubble('assets/images/italian.jpg', 'Italian'),
        ),
        Container(
          child: _buildFoodBubble('assets/images/korean.jpg', 'Korean'),
        ),
        Container(
          child: _buildFoodBubble('assets/images/japanese.jpg', 'Japanese'),
        ),
        Container(
          child: _buildFoodBubble('assets/images/mexican.jpg', 'Mexican'),
        )
      ],
    );
  }

  Container _buildFoodBubble(String image, String food) {
    return Container(
      height: 200,
      alignment: Alignment.center,
      decoration: ShapeDecoration(
          image: DecorationImage(
              image: ExactAssetImage(image),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.3), BlendMode.darken)),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.circular(10))),
      child: Text(
        food,
        style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: 'Futura Medium',
            fontWeight: FontWeight.w300),
      ),
    );
  }
}
