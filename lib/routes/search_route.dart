import 'package:flutter/material.dart';

class Search extends StatelessWidget { // <- (※1)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Text('医療機関選択'),
              )
            ],
          )
      ),
      body: Center(child: Text("さがす") // <- (※3)
      ),
    );
  }
}