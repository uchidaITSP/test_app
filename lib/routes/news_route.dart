import 'package:flutter/material.dart';

import 'package:barcode_scan/barcode_scan.dart';



//body: Center(child: Text('通知')),

class News extends StatelessWidget { // <- (※1)
  // <- (※1)
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.grey[50],
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(

                  padding: const EdgeInsets.all(8.0),
                  child: Text('通知メッセージ',style: TextStyle(color: Colors.black.withOpacity(0.8)),),
                )
              ],
            )
        ),


        body: Center(


            child: Text('通知')),






      ),
    );
  }
}



