Nama: Muhammad Khoirul Anwarudin

Class: TI3I

NIM: 24410702003

Soal 1

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream - Khoirul',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const StreamHomePage(),
    );
  }
}
```

```dart
class _StreamHomePageState extends State<StreamHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Aplikasi Stream - Khoirul')),
      body: Center(
        child: Text(
          'Halaman Utama Streams',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
```

![alt text](img/soal_1.png)

Soal 2

```dart
import 'package:flutter/material.dart';

class ColorStream {
  final List<Color> colors = [
    Colors.blueGrey,
    Colors.amber,
    Colors.deepPurple,
    Colors.lightBlue,
    Colors.teal,

    Colors.red,
    Colors.green,
    Colors.pink,
    Colors.orange,
    Colors.indigo,
  ];
}
```


Soal 3

```dart
yield* Stream.periodic(
  const Duration(seconds: 1), (int t) {
    int index = t % colors.length;
    return colors[index];
});
```

Jelaskan fungsi keyword yield* pada kode tersebut!
Apa maksud isi perintah kode tersebut?

Jawaban:

1. Fungsi Keyword yield*:

  - Fungsi dari yield* (baca: yield star) adalah untuk mendelegasikan pengeluaran (emitting) item dari satu generator (async* atau sync* function) ke generator lain atau, dalam kasus ini, ke Stream lain.

  - Secara spesifik, yield* mengambil semua elemen dari Stream yang dioperasikan (Stream.periodic dalam kasus ini) dan "mengeluarkannya" (yields them) satu per satu ke dalam Stream yang sedang didefinisikan (getColors()). Ini memungkinkan getColors() untuk menjadi penghubung langsung ke Stream yang dihasilkan oleh Stream.periodic.

2. Maksud Isi Perintah Kode:

  - Perintah kode tersebut membuat Stream periodik yang akan mengeluarkan (emit) salah satu dari sepuluh warna di dalam colors setiap 1 detik, mengulangi urutan warna tersebut secara terus-menerus.

Soal 4

![alt text](img/soal_4.gif)

Soal 5

![alt text](img/soal_5.gif)

| Fitur        | await for                                                                 | listen()                                                                                  |
|--------------|---------------------------------------------------------------------------|-------------------------------------------------------------------------------------------|
| **Sifat**    | *Blocking* (menunggu), synchronous di dalam fungsi `async`.               | *Non-blocking* (asynchronous), event-driven.                                              |
| **Kapan Berhenti** | Berhenti hanya ketika fungsi `async` yang mengandungnya selesai, atau Stream selesai. | Perlu dihentikan secara eksplisit (misalnya di `dispose()` dengan `StreamSubscription`). |
| **Penggunaan Umum** | Untuk memproses semua event secara berurutan di dalam satu fungsi hingga Stream selesai. | Untuk menangani event secara *real-time* di UI (seperti `setState`) dan tetap memungkinkan kode lain berjalan secara paralel. |


Soal 6