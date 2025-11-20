import 'package:flutter/material.dart';
// Langkah 6: Import dart:async dan dart:math
import 'dart:async';
import 'dart:math';
import 'stream.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Soal 1: Tambahkan nama panggilan Anda pada title app
    return MaterialApp(
      title: 'Stream - Khoirul',
      theme: ThemeData(
        // Soal 1: Gantilah warna tema aplikasi sesuai kesukaan Anda (diubah menjadi teal)
        primarySwatch: Colors.teal,
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
  // Variabel untuk Stream Warna (dari praktikum sebelumnya)
  Color bgColor = Colors.blueGrey;

  // Langkah 7: Tambah variabel untuk NumberStream
  int lastNumber = 0;
  // Gunakan tipe yang benar, yaitu StreamController<int>
  late StreamController<int> numberStreamController;
  late NumberStream numberStream;

  // Langkah 10 & 15: Tambah dan Edit method addRandomNumber()
  void addRandomNumber() {
    Random random = Random();

    // Kode untuk Soal 7 (Langkah 15):
    // numberStream.addError();

    // Kembalikan kode ke kondisi semula (untuk Praktikum 3)
    int myNum = random.nextInt(10); // Menghasilkan angka 0-9
    numberStream.addNumberToSink(myNum); // Mengirim angka ke sink
  }

  // Langkah 8 & 14: Edit initState()
  @override
  void initState() {
    super.initState();
    // Inisialisasi NumberStream
    numberStream = NumberStream();
    // Mengambil controller dan stream
    numberStreamController = numberStream.controller;
    Stream<int> stream = numberStreamController.stream;

    // Mulai mendengarkan stream (Langkah 14: Tambah onError)
    stream
        .listen((event) {
          setState(() {
            lastNumber = event; // Memperbarui UI dengan angka baru
          });
        })
        .onError((error) {
          setState(() {
            lastNumber = -1; // Mengatur -1 jika terjadi error
          });
        });
  }

  // Langkah 9: Edit dispose()
  @override
  void dispose() {
    // Menutup controller saat widget dibuang
    numberStreamController.close();
    super.dispose();
  }

  // Method changeColor dari praktikum 1
  void changeColor() async {
    // kode dihilangkan karena fokus ke NumberStream
  }

  @override
  Widget build(BuildContext context) {
    // Langkah 11: Edit method build()
    return Scaffold(
      appBar: AppBar(title: const Text('Dart Streams Controller - Khoirul')),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Menampilkan angka acak terakhir
            Text(
              lastNumber == -1
                  ? 'ERROR'
                  : lastNumber
                        .toString(), // Tampilkan ERROR jika lastNumber = -1
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: lastNumber == -1
                    ? Colors.red
                    : Theme.of(context).primaryColor,
              ),
            ),
            // Tombol untuk memicu penambahan angka acak
            ElevatedButton(
              onPressed: () => addRandomNumber(),
              child: const Text('New Random Number'),
            ),
          ],
        ),
      ),
    );
  }
}
