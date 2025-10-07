import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping/models/Item.dart';
import 'package:shopping/widgets/product_card.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final List<Item> items = [
    Item(
      name: 'Sugar',
      price: 100000,
      fotoProduk: 'images/sugar.png',
      stok: 10,
      rating: 4.5,
    ),
    Item(
      name: 'Salt',
      price: 150000,
      fotoProduk: 'images/salt.png',
      stok: 5,
      rating: 4.0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Toko Belanja')),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.75,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return ProductCard(item: item);
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            alignment: Alignment.center,
            child: Text(
              'Muhammad Khoirul Anwarudin - 244107023007',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
