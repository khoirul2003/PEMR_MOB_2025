import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Praktikum API Muhammad Khoirul Anwarudin',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const FuturePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FuturePage extends StatefulWidget {
  const FuturePage({super.key});

  @override
  State<FuturePage> createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  String result = "Hasil akan tampil di sini...";

  Future<http.Response> getData() async {
    const authority = 'www.googleapis.com';

    const path = '/books/v1/volumes/0z-3DwAAQBAJ';

    const params = <String, dynamic>{};
    final uri = Uri.https(authority, path, params);

    return await http.get(uri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Page'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {});

                  getData()
                      .then((value) {
                        result = value.body.toString().substring(0, 450);

                        setState(() {});
                      })
                      .catchError((err) {
                        result = err.toString();

                        setState(() {});
                      });
                },
                child: const Text('Ambil Data'),
              ),
              const SizedBox(height: 20),

              const CircularProgressIndicator(),

              const SizedBox(height: 20),

              Text(result),
            ],
          ),
        ),
      ),
    );
  }
}
