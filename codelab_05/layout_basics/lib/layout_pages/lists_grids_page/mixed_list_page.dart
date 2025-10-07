import 'package:flutter/material.dart';

class MixedListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mixed List')),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          if (index == 0) {
            return ListTile(title: Text('Header'));
          } else {
            return ListTile(title: Text('Item $index'));
          }
        },
      ),
    );
  }
}
