import 'package:flutter/material.dart';
import 'stream.dart'; // Import NumberStream
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Memberi nama aplikasi dengan identitas
    return MaterialApp(
      title: 'StreamBuilder - Khoirul',
      theme: ThemeData(
        // Menggunakan warna tema deepPurple
        primarySwatch: Colors.deepPurple,
      ),
      home: const StreamHomePage(),
    );
  }
}

class StreamHomePage extends StatefulWidget {
  const StreamHomePage({super.key});

  @override
  State<StreamHomePage> createState() => _StreamHomePageState();
}

class _StreamHomePageState extends State<StreamHomePage> {
  // Langkah 5: Tambah variabel Stream<int>
  late Stream<int> numberStream;

  // Langkah 6: Edit initState()
  @override
  void initState() {
    // Menginisialisasi stream periodik dari NumberStream
    numberStream = NumberStream().getNumbers();
    super.initState();
  }

  // Langkah 7: Edit method build() untuk menggunakan StreamBuilder
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StreamBuilder Demo'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: StreamBuilder<int>(
        // Menyediakan Stream yang akan didengarkan
        stream: numberStream,
        // Data awal yang ditampilkan sebelum event pertama tiba
        initialData: 0,
        // Builder yang dipanggil setiap kali ada event baru
        builder: (context, snapshot) {
          // Menangani Error (jika ada)
          if (snapshot.hasError) {
            debugPrint('Error: ${snapshot.error}');
            return const Center(
              child: Text(
                'Error!',
                style: TextStyle(color: Colors.red, fontSize: 32),
              ),
            );
          }

          // Menangani data (jika ada data atau initialData)
          if (snapshot.hasData) {
            // Mengembalikan widget Center dengan Text data dari stream
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Angka Acak:',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
                  ),
                  Text(
                    // Menampilkan data terbaru dari snapshot
                    snapshot.data.toString(),
                    style: const TextStyle(
                      fontSize: 96,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          }

          // Fallback, misalnya ConnectionState.waiting atau .done
          return const Center(child: Text('Menunggu Stream...'));
        },
      ),
    );
  }
}
