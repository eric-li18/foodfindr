import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment(-1, 0.5),
          colors: [Colors.yellow[300], Colors.amber[400]]
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              floating: true,
              snap: true,
              // title: Text(
              //   'FoodFindr',
              //   style: TextStyle(
              //     fontFamily: 'Futura Medium',
              //     color: Colors.black,
              //     fontWeight: FontWeight.bold,
              //     fontSize: 35,
              //   )
              // ),
              actions: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.map,
                      color: Colors.amber[300],
                      size: 25,
                    ),
                    onPressed: null,
                  )
                ),
              ],
            ),

            SliverAppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              expandedHeight: 430,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  // decoration: BoxDecoration(
                  //   gradient: LinearGradient(
                  //     begin: Alignment.topRight,
                  //     end: Alignment.bottomLeft,
                  //     colors: [Colors.cyan[200], Colors.green[400]]
                  //   )
                  // ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 80,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 15),
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'Welcome back',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: 'Futura Medium',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                          )
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 15),
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'There\'re 120 resturants nearby',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: 'Futura Medium',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          )
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 60, left: 15),
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'Recommended',
                          style: TextStyle(
                            fontFamily: 'Futura Medium',
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Container(
                        // color: Colors.white,
                        height: 180,
                        child: ListView.builder(
                          padding: EdgeInsets.only(left: 15, top: 5),
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              width: 250.0,
                              // color: Colors.white,
                              margin: EdgeInsets.only(right: 10, bottom: 20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow( 
                                    color: Colors.amber[500],
                                    offset: new Offset(0, 8.0), 
                                    blurRadius: 10.0,
                                    spreadRadius: 1.0
                                  ),
                                ],
                              ),
                              child: Column(
                                children: <Widget> [
                                  Container(
                                    height: 130,
                                    // margin: EdgeInsets.only(left: 5, right: 5),
                                    alignment: Alignment.center,
                                    decoration: ShapeDecoration(
                                      // shadows: [
                                      //   new BoxShadow(
                                      //     color: Colors.grey[300],
                                      //     offset: new Offset(0.0, 8.0), 
                                      //     blurRadius: 10.0,
                                      //     spreadRadius: 1.0
                                      //   )
                                      // ],
                                      image: DecorationImage(
                                        image: ExactAssetImage(
                                          'assets/images/Watermelon.jpg'
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
                    ],
                  ),
                )
              ),
            ),

            SliverToBoxAdapter(
              child: Container(
                // color: Colors.white,
                padding: EdgeInsets.only(left: 15, bottom: 15, top: 30),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.only(
                      topStart: Radius.circular(30),
                      topEnd: Radius.circular(30)
                    )
                  )
                ),
                child: Text(
                  'What\'s nearby',
                  style: TextStyle(
                    fontFamily: 'Futura Medium',
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ),

            SliverFixedExtentList(
              itemExtent: 250,
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    color: Colors.white,
                    // padding: EdgeInsets.only(left: 15, right: 15),
                    // margin: EdgeInsets.only(left: 15, right: 15, bottom: 19),
                    // decoration: BoxDecoration(
                    //   color: Colors.white,
                    //   borderRadius: BorderRadius.circular(10),
                    //   boxShadow: [
                    //     new BoxShadow( 
                    //       color: Colors.grey[300],
                    //       offset: new Offset(0.0, 10.0), 
                    //       blurRadius: 10.0,
                    //       spreadRadius: 1.0
                    //     )
                    //   ],
                    // ),
                    child: Container(
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
                              shadows: [
                                new BoxShadow(
                                  color: Colors.grey[300],
                                  offset: new Offset(0.0, 10.0), 
                                  blurRadius: 10.0,
                                  spreadRadius: 1.0
                                )
                              ],
                              image: DecorationImage(
                                image: ExactAssetImage(
                                  'assets/images/Ramen.jpg'
                                ),
                                fit: BoxFit.cover
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusDirectional.circular(10)
                              )
                            ),
                          ),
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
                        ]
                      ),
                    ),
                  );
                },
              ),
            ),
          ]
        )
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