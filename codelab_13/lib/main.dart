import 'package:flutter/material.dart';

import 'dart:convert';
import 'model/pizza.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter JSON Demo',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Pizza> myPizzas = [];

  String convertToJSON(List<Pizza> pizzas) {
    final List<Map<String, dynamic>> pizzaMapList = pizzas
        .map((pizza) => pizza.toJson())
        .toList();

    return jsonEncode(pizzaMapList);
  }

  Future<List<Pizza>> readJsonFile() async {
    String myString = await DefaultAssetBundle.of(
      context,
    ).loadString('assets/pizzalist.json');

    List pizzaMapList = jsonDecode(myString);

    List<Pizza> myPizzas = [];
    for (var pizzaMap in pizzaMapList) {
      Pizza myPizza = Pizza.fromJson(pizzaMap);
      myPizzas.add(myPizza);
    }

    String json = convertToJSON(myPizzas);
    print(json);

    return myPizzas;
  }

  @override
  void initState() {
    super.initState();
    readJsonFile().then((value) {
      setState(() {
        myPizzas = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'JSON Khoirul',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),

      body: ListView.builder(
        itemCount: myPizzas.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(myPizzas[index].pizzaName),
            subtitle: Text(myPizzas[index].description),
          );
        },
      ),
    );
  }
}
