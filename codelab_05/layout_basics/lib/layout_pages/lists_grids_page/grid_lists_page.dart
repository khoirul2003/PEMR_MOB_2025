import 'package:flutter/material.dart';

class GridListsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Grid Lists')),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(4, (index) {
          return Center(
            child: Text(
              'Item $index',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          );
        }),
      ),
    );
  }
}
