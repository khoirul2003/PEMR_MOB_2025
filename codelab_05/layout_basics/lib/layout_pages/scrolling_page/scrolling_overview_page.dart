import 'package:flutter/material.dart';

class ScrollingOverviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scrolling Overview')),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(
            20,
            (index) => ListTile(title: Text('Item $index')),
          ),
        ),
      ),
    );
  }
}
