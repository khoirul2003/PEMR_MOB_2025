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
    // Soal 1: Tambahkan nama panggilan Anda pada title app (diperbarui menjadi Khoirul)
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
  late StreamController<int> numberStreamController;
  late NumberStream numberStream;

  // Praktikum 3: Variabel untuk transformer
  late StreamTransformer<int, int> transformer;

  // Langkah 1, Praktikum 4: Variabel untuk StreamSubscription
  late StreamSubscription subscription;
  // Langkah 1, Praktikum 5: Tambah variabel baru
  late StreamSubscription subscription2;
  String values = '';

  // Langkah 5, Praktikum 4: Tambah method baru stopStream()
  void stopStream() {
    // Menutup controller, yang akan memicu onDone()
    numberStreamController.close();
  }

  // Langkah 8, Praktikum 4: Edit method addRandomNumber()
  void addRandomNumber() {
    Random random = Random();
    int myNum = random.nextInt(10); // Menghasilkan angka 0-9

    // Cek apakah controller sudah ditutup sebelum menambahkan data
    if (!numberStreamController.isClosed) {
      numberStream.addNumberToSink(myNum); // Mengirim angka ke sink
    } else {
      // Jika stream sudah ditutup, perbarui UI untuk menunjukkan stream mati
      setState(() {
        lastNumber = -1;
      });
    }
  }

  // Langkah 2, Praktikum 5: Edit initState()
  @override
  void initState() {
    super.initState();
    // Inisialisasi NumberStream
    numberStream = NumberStream();
    numberStreamController = numberStream.controller;

    // Langkah 4: Set broadcast stream
    Stream stream = numberStreamController.stream.asBroadcastStream();

    // --- Praktikum 5: Mencoba multiple subscriptions (sekarang bekerja) ---

    // Langganan pertama
    subscription = stream.listen((event) {
      setState(() {
        values += '$event - ';
        lastNumber = event;
      });
    });

    // Langganan kedua pada stream yang SAMA
    subscription2 = stream.listen((event) {
      setState(() {
        values += '$event - '; // Event yang sama akan ditambahkan lagi
      });
    });
    // --- Akhir Praktikum 5 ---
  }

  // Langkah 6, Praktikum 4: Pindah ke method dispose()
  @override
  void dispose() {
    // Membatalkan kedua langganan
    subscription.cancel();
    subscription2.cancel();
    // Menutup controller
    numberStreamController.close();
    super.dispose();
  }

  // Method changeColor dari praktikum 1
  void changeColor() async {
    // kode dihilangkan karena fokus ke NumberStream
  }

  @override
  Widget build(BuildContext context) {
    // Langkah 11, Praktikum 4: Edit method build()
    return Scaffold(
      appBar: AppBar(title: const Text('Dart Streams Broadcast - Khoirul')),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Langkah 5: Tambahkan Text(values)
            Text(values),
            // Menampilkan angka acak terakhir
            Text(
              // Tampilkan ERROR jika lastNumber = -1, jika tidak tampilkan angka
              lastNumber == -1 ? 'Stream Closed' : lastNumber.toString(),
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: lastNumber == -1
                    ? Colors.red
                    : Theme.of(context).primaryColor,
              ),
            ),
            // Tombol 1: Untuk memicu penambahan angka acak
            ElevatedButton(
              onPressed: () => addRandomNumber(),
              child: const Text('New Random Number'),
            ),
            // Langkah 7, Praktikum 4: Tambahkan button kedua
            ElevatedButton(
              onPressed: () => stopStream(),
              child: const Text('Stop Subscription'),
            ),
          ],
        ),
      ),
    );
  }
}
