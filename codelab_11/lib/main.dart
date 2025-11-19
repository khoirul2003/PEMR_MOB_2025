import 'dart:async';

import 'package:flutter/material.dart';
import 'package:async/async.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Books App Habibie', // Soal 1: Tambahkan nama panggilan Anda
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const FuturePage(),
    );
  }
}

class FuturePage extends StatefulWidget {
  const FuturePage({Key? key}) : super(key: key);

  @override
  State<FuturePage> createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  String result = 'No Data';
  late Completer completer; // Remove late.

  Future<String> getData() async {
    const String authority = 'www.googleapis.com';
    const String path =
        '/books/v1/volumes/YLKQCwAACAAJ'; // Soal 2: Ganti ID buku
    Uri url = Uri.https(authority, path);
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      // Soal 3: Penjelasan substring dan catchError
      // substring: mengambil bagian string dari index 0 hingga 100
      // catchError: menangkap error yang terjadi pada Future
      return response.body.substring(0, 100);
    } else {
      return 'Request failed with status: ${response.statusCode}.';
    }
  }

  Future<int> returnOneAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 1;
  }

  Future<int> returnTwoAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 2;
  }

  Future<int> returnThreeAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 3;
  }

  Future<int> count() async {
    int total = 0;
    total = await returnOneAsync();
    total += await returnTwoAsync();
    total += await returnThreeAsync();
    return total;
  }

  Future<String> handleError() async {
    try {
      // Simulate an operation that might throw an error
      await Future.delayed(const Duration(seconds: 2));
      throw Exception('An error occurred!'); // Simulate an exception
    } catch (e) {
      print('Caught error: ${e.toString()}'); // Optionally log the error
      return 'Error: ${e.toString()}';
    } finally {
      print('Complete'); // Optional: Runs whether an error was caught or not
    }
  }

  Future getNumberCompleter() {
    completer = Completer<int>();
    calculateCompleter();
    return completer.future;
  }

  Future calculateCompleter() async {
    await Future.delayed(const Duration(seconds: 5));
    completer.complete(42);
  }

  Future calculateError() async {
    await Future.delayed(const Duration(seconds: 5));
    completer.completeError('An error occurred!');
  }

  Future _calculateTotal() async {
    final futureGroup = FutureGroup<int>();

    futureGroup.add(returnOneAsync());
    futureGroup.add(returnTwoAsync());
    futureGroup.add(returnThreeAsync());
    futureGroup.close();
    futureGroup.future.then((List<int> value) {
      int total = 0;
      for (var element in value) {
        total += element;
      }
      setState(() {
        result = total.toString();
      });
    });
  }

  Future _testAsyncErrorHanding() async {
    String tempResult;
    try {
      tempResult = await handleError();
      setState(() {
        result = tempResult;
      });
    } catch (error) {
      print('Caught error $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Future Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 20),
            Text('Result: $result'),
            ElevatedButton(
              child: const Text('GO!'),
              onPressed: () {
                // _calculateTotal();
                /*getNumberCompleter().then((value) {
                  setState(() {
                    result = value.toString();
                  });
                }).catchError((e) {
                  result = 'An error occurred';
                });*/
                /*getNumberCompleter().then((value) {
                    setState(() {
                      result = value.toString();
                    });
                  }).catchError((e) {
                    result = 'An error occurred';
                  });*/
                _testAsyncErrorHanding();
                /*getData().then((value) {
                    setState(() {
                      result = value;
                    });
                  }).catchError((_) {
                    setState(() {
                      result = 'An error occurred';
                    });
                  });*/
              },
            ),
          ],
        ),
      ),
    );
  }
}
