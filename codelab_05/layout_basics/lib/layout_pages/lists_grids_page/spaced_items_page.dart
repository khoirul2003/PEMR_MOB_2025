import 'package:flutter/material.dart';

class SpacedItemsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const items = 4;

    return Scaffold(
      appBar: AppBar(title: Text('Spaced Items')),
       body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: List.generate(
                  items,
                  (index) => ItemWidget(text: 'Item $index'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ItemWidget extends StatelessWidget {
  const ItemWidget({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(height: 100, child: Center(child: Text(text))),
    );
  }
}
