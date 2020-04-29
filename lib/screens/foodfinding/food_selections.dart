import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class FoodSelections extends StatelessWidget {
  List<Tab> _tabs = <Tab>[Tab(text: ''), Tab(text: '')];
  TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _tabs.length,
        child: Scaffold(
          appBar: TabBar(
            controller: _tabController,
            tabs: _tabs,
          ),
          body: TabBarView(
            // These are the contents of the tab views, below the tabs.
            children: _tabs.map((Tab tab) {
              return Center(
                child: Text(
                  'Text',
                  style: const TextStyle(fontSize: 36),
                ),
              );
            }).toList(),
          ),
        ));
  }
}
