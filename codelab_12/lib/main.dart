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

  // Langkah 1: Tambah variabel untuk StreamSubscription
  late StreamSubscription subscription;

  // Langkah 5: Tambah method baru stopStream()
  void stopStream() {
    // Menutup controller, yang akan memicu onDone()
    numberStreamController.close();
  }

  // Langkah 8: Edit method addRandomNumber()
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

  // Langkah 2, 3, 4: Edit initState()
  @override
  void initState() {
    super.initState();
    // Inisialisasi NumberStream
    numberStream = NumberStream();
    numberStreamController = numberStream.controller;
    Stream<int> stream = numberStreamController.stream;

    // Inisialisasi Transformer (dari Praktikum 3)
    transformer = StreamTransformer<int, int>.fromHandlers(
      handleData: (value, sink) {
        sink.add(value * 10); // Data: Kalikan nilai dengan 10
      },
      handleError: (error, trace, sink) {
        sink.add(-1); // Error: Ganti error dengan nilai -1
      },
      handleDone: (sink) =>
          sink.close(), // Done: Tutup sink saat stream selesai
    );

    // Langkah 2: Mengambil StreamSubscription dari stream yang sudah ditransform
    subscription = stream.transform(transformer).listen((event) {
      setState(() {
        lastNumber =
            event; // lastNumber akan menyimpan nilai event * 10 atau -1
      });
    });

    // Langkah 3: Menambahkan onError ke StreamSubscription
    subscription.onError((error) {
      setState(() {
        lastNumber = -1; // Mengatur -1 jika terjadi error
      });
    });

    // Langkah 4: Menambahkan onDone ke StreamSubscription
    subscription.onDone(() {
      print('OnDone was called');
    });
  }

  // Langkah 6: Pindah ke method dispose()
  @override
  void dispose() {
    // Membatalkan langganan ketika widget dibuang
    subscription.cancel();
    // Menutup controller (walaupun subscription.cancel() sudah membatalkan, ini penting
    // agar controller tidak bocor jika tidak ada kode cancel)
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
      appBar: AppBar(title: const Text('Dart Streams Subscription - Khoirul')),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
            // Langkah 7: Tambahkan button kedua
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
