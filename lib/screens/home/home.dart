import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 30,
              floating: true,
              snap: true,
              title: Text(
                'FoodFindr',
                style: TextStyle(
                  fontFamily: 'Futura Medium',
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                )
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.map,
                    color: Colors.black,
                    size: 25,
                  ),
                  onPressed: null,
                )
              ],
              elevation: 0,
              backgroundColor: Colors.white,
              // bottom: PreferredSize(
              //   child: Container(
              //     color: Colors.black, 
              //     height: 1.5,
              //   ), 
              //   preferredSize: Size.fromHeight(1.0)
              // ),
            ),

            SliverToBoxAdapter(
              child: Container(
                color: Colors.white,
                child: Text(
                  'Recommended for you',
                  style: TextStyle(
                    fontFamily: 'Futura Medium',
                    color: Colors.black,
                    fontSize: 18,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
                padding: EdgeInsets.only(left: 17, top: 10),
              )
            ),

            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.only(left: 12, top: 5),
                height: 160,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: 150.0,
                      // color: Colors.white,
                      margin: EdgeInsets.only(left: 5, right: 5, bottom: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          new BoxShadow( 
                            color: Colors.grey[300],
                            offset: new Offset(0.0, 5.0), 
                            blurRadius: 5.0,
                            spreadRadius: 1.0
                          )
                        ],
                      ),
                      child: Column(
                        children: <Widget> [
                          Container(
                            height: 110,
                            // margin: EdgeInsets.only(left: 5, right: 5),
                            alignment: Alignment.center,
                            decoration: ShapeDecoration(
                              image: DecorationImage(
                                image: ExactAssetImage(
                                  'assets/Watermelon.jpg'
                                ),
                                fit: BoxFit.cover
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusDirectional.circular(10)
                              )
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 5, left: 10),
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              'Watermelon Sugar',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Futura Medium',
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ]
                      ),
                    );
                  },
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Container(
                color: Colors.white,
                child: Text(
                  'What\'s Nearby',
                  style: TextStyle(
                    fontFamily: 'Futura Medium',
                    color: Colors.black,
                    fontSize: 18,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
                padding: EdgeInsets.only(left: 17, bottom: 5),
              )
            ),

            SliverFixedExtentList(
              itemExtent: 250,
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
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
                          spreadRadius: 1.0
                        )
                      ],
                    ),
                    child: Column(
                      children: <Widget> [
                        Container(
                          height: 200,
                          alignment: Alignment.center,
                          decoration: ShapeDecoration(
                            image: DecorationImage(
                              image: ExactAssetImage(
                                'assets/Ramen.jpg'
                              ),
                              fit: BoxFit.cover
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusDirectional.circular(10)
                            )
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10, top: 5),
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
                      ]
                    ),
                  );
                },
              ),
            ),
          ]
        )
      );

    // return Scaffold(
    //   backgroundColor: Colors.white,
    //   appBar: AppBar(
    //     backgroundColor: Colors.red[600],
    //     elevation: 0.0,
    //     centerTitle: true,
    //     title: Text('Home'),
    //     actions: <Widget>[
    //       FlatButton.icon(
    //         onPressed: () {
    //           AuthService().signOut();
    //         },
    //         icon: Icon(Icons.person),
    //         label: Text("Logout"),
    //       )
    //     ],
    //   ),
    //   bottomNavigationBar: Navigation(),
    // );



  }
}