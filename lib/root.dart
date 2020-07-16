import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'routes/home_route.dart';
import 'routes/search_route.dart';
import 'routes/news_route.dart';
import 'routes/acaunt_route.dart';
import 'routes/Investigate_route.dart';

class RootWidget extends StatefulWidget {
  @override
  _RootWidget createState() => _RootWidget();
}

class _RootWidget extends State<RootWidget>{
  int _selectedIndex = 0;
  final _bottomNavigationBarItems = <BottomNavigationBarItem>[];

  final Map _RootWidgetIcons = {
    'ホーム' : {'icon': Icons.home, 'route':Home()},
    'さがす' : {'icon': Icons.search, 'route':Search()},
    'お知らせ' : {'icon': Icons.notifications, 'route':News()},
    'アカウント' : {'icon': Icons.home, 'route':Acount()},
    '調べる' : {'icon':Icons.home,'route':Investigate()},
  };

  final List _RootWidgetItemOrder = [
    'ホーム',
    'さがす',
    'お知らせ',
    'アカウント',
    '調べる',
  ];

  @override
  void initState(){
    super.initState();
    for( var i = 0; i < _RootWidgetItemOrder.length; i++){
      _bottomNavigationBarItems.add(_CreateIcon(_RootWidgetItemOrder[i]));
    }
  }

  BottomNavigationBarItem _CreateIcon(String key){
    return BottomNavigationBarItem(
      icon: Icon(_RootWidgetIcons[key]['icon']),
      title: Text(key),
    );
  }

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : _RootWidgetIcons[_RootWidgetItemOrder.asMap()[_selectedIndex]]['route'],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: _bottomNavigationBarItems,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.pinkAccent,
        unselectedItemColor: Colors.black45,
      ),
    );
  }
}