import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:shopping/models/Item.dart';
import 'package:shopping/pages/home_page.dart';
import 'package:shopping/pages/item_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => HomePage()),
      GoRoute(
        path: '/item',
        builder: (context, state) {
          final item = state.extra as Item; 
          return ItemPage(item: item);
        },
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Belanja App',
      debugShowCheckedModeBanner: false,
    );
  }
}
