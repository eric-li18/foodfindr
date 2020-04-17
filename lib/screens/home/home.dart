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
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                )
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.map,
                    color: Colors.black,
                    size: 30,
                  ),
                  onPressed: null,
                )
              ],
              elevation: 0,
              backgroundColor: Colors.white,
              bottom: PreferredSize(
                child: Container(
                  color: Colors.black, 
                  height: 1.5,
                ), 
                preferredSize: Size.fromHeight(1.0)
              ),
            ),

            SliverToBoxAdapter(
              child: Container(
                child: Text(
                  'Recommended for you',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                padding: EdgeInsets.only(left: 20, top: 10),
              )
            ),

            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.only(left: 15),
                height: 100.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: 150.0,
                      color: Colors.white,
                      child: Stack(
                        children: <Widget> [
                          Container(
                            padding: EdgeInsets.only(top: 10, left: 5, right: 5),
                            color: Colors.white,
                            alignment: Alignment.center,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: FittedBox(
                                child: Image.asset('assets/Sky.jpg'),
                                fit: BoxFit.fill,
                              )
                            )
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              'Pizza Hut',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
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
                child: Text(
                  'What\'s Nearby',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                padding: EdgeInsets.only(left: 20, top: 10),
              )
            ),

            SliverFixedExtentList(
              itemExtent: 230.0,
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    color: Colors.white,
                    child: Stack(
                      children: <Widget> [
                        Container(
                          padding: EdgeInsets.only(top:10, left: 20, right: 20),
                          color: Colors.white,
                          alignment: Alignment.center,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(18),
                            child: FittedBox(
                              child: Image.asset('assets/Something.png'),
                              fit: BoxFit.fill,
                            )
                          )
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            'Sushi Tien',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
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