import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping/models/Item.dart';

class ProductCard extends StatelessWidget {
  final Item item;

  const ProductCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.go('/item', extra: item);
      },
      child: Card(
        elevation: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: (item.fotoProduk.startsWith('http'))
                  ? Image.network(
                      item.fotoProduk,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    )
                  : Image.asset(
                      item.fotoProduk,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text('Rp ${item.price.toStringAsFixed(0)}'),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      Text('${item.rating}'),
                      SizedBox(width: 5),
                      Text('(${item.stok} stok)'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
