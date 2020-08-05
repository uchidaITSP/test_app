import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:test_app/models/user.dart';
import 'package:test_app/routes/search_route.dart';
import 'file:///C:/Users/fujihara.ryusuke/AndroidStudioProjects/test_app/lib/routes/medical_root.dart';
import 'package:test_app/routes/Investigate_route.dart';


//class ScanPage extends StatefulWidget {
//  @override
//  _buttonArea createState() => _buttonArea();
//}

class Medical extends StatelessWidget { // <- (※1)
   // <- (※1)
  @override
  Widget build(BuildContext context) {
  return MaterialApp(
  debugShowCheckedModeBanner: false,
  home: Scaffold(
//        appBar: AppBar(
//
//            backgroundColor: Colors.grey[50],
//            title: Row(
//
//              mainAxisAlignment: MainAxisAlignment.center,
//
//              children: [
//                Icon(Icons.inbox,color: Colors.red,),
//                Container(
//
//                  padding: const EdgeInsets.all(8.0),
//                  child: Text('CLINIX',
//                    style: TextStyle(color: Colors.black.withOpacity(0.8)),),
//
//
//                )
//              ],
//            )
//        ),
  body: Container(
//        width: 350,
//        height: 250,
//        color: Colors.black12,
  margin: EdgeInsets.all(10),
//        padding: EdgeInsets.fromLTRB(20,60,20,20),
  child: Column(

//          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//          crossAxisAlignment: CrossAxisAlignment.center,
  children: <Widget>[
  _topArea(),
  _titleArea(),

  _bottomArea()
  ],
  ),
  ),
  ),
  );
  }
  }

  class _topArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  return Container(



  child: Column(
  children: <Widget>[
  Padding(
  padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
  child: TextField(
  decoration: InputDecoration(

//                  labelText: '',
  hintText: '病名・薬名でさがす',
  prefixIcon: Icon(Icons.search),
//              contentPadding: const EdgeInsets.fromLTRB(left, top, right, bottom),
  contentPadding: const EdgeInsets.fromLTRB(20, 10, 10, 10),

  border: OutlineInputBorder(


  borderRadius: BorderRadius.all(Radius.circular(2),),
  )
  ),

  ),
  ),
  ]
  )
  );
  }
  }

  class _titleArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  return Container(

  child: Row(
  children: <Widget>[
  Container(
  width: 350,
  height: 100,
  margin: EdgeInsets.fromLTRB(12, 40, 0, 0),
  child: Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: <Widget>[
  Expanded(
  child: Column(
  children: <Widget>[
  Icon(Icons.note),
  FlatButton(

  child: Text('病気を調べる'),
  onPressed: () {
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (context) => Investigate(),
  )
  );
  },

  )

  ],
  ),
  ),

  Expanded(
  child: Column(
  children: <Widget>[
  Icon(Icons.book),
  FlatButton(

  child: Text('薬を調べる'),
  onPressed: () {
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (context) => Investigate(),
  )
  );
  },

  )

  ],
  ),
  ),



  ],
  ),
  ),
  ],
  ),
  );
  }
  }





  class _bottomArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  return Container(
  width: 470,
  height: 40,
  color: Colors.grey[200],

  margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
  padding: EdgeInsets.fromLTRB(0, 9, 290, 10),

  child: Column(
  children: <Widget>[
  Container(

  margin: EdgeInsets.fromLTRB(5, 0, 0, 0),

  child: Text(
  '検索履歴',
  style: TextStyle(

//                            fontWeight: FontWeight.bold,
  fontSize: 13,
  color: Colors.black,

  ),
  ),

  ),



  ]
  )
  );
  }
  }

