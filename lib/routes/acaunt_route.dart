import 'package:flutter/material.dart';

class Acount extends StatelessWidget { // <- (※1)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Text('アカウント'),
              )
            ],
          )
      ),
      body: Center(child: Text("アカウント") // <- (※3)
      ),
    );
  }
}