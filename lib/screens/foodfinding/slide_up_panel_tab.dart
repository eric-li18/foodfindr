import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:foodfindr/screens/foodfinding/food_options_selections.dart';

class SlideUpPanelTab extends StatelessWidget {
  static final List<Tab> _tabs = <Tab>[
    Tab(text: '         '),
    Tab(text: '         '),
  ];
  TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: TabBar(
          controller: _tabController,
          tabs: _tabs,
          // indicatorSize: TabBarIndicatorSize.tab,
          indicatorColor: Colors.green[400],
          indicatorWeight: 2,
          // labelPadding: EdgeInsets.only(left: 120),
          // isScrollable: true,
        ),
        body: TabBarView(
          // These are the contents of the tab views, below the tabs.
          children: _tabs.map((Tab tab) {
            return Center(
              child: FoodOptionsSelections(),
            );
          }).toList(),
        ),
      ),
    );
  }
}
