import 'package:flutter/material.dart';

class HorizontalListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Horizontal List')),
      body: Container(
        height: 200.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
             Container(width: 160, color: Colors.red),
            Container(width: 160, color: Colors.blue),
            Container(width: 160, color: Colors.green),
            Container(width: 160, color: Colors.yellow),
            Container(width: 160, color: Colors.orange),
          ],
        ),
      ),
    );
  }
}
