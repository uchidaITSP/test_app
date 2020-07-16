import 'package:flutter/material.dart';

class Investigate extends StatelessWidget { // <- (※1)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("調べる"), // <- (※2)
      ),
      body: Center(child: Text("調べる") // <- (※3)
      ),
    );
  }
}