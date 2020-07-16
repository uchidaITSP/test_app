import 'package:flutter/material.dart';

class News extends StatelessWidget { // <- (※1)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Text('通知メッセージ'),
              )
            ],
          )
      ),
      body: Center(child: Text("お知らせ") // <- (※3)
      ),
    );
  }
}