import 'package:flutter/material.dart';

class ColorStream {
  // Langkah 4 & Jawaban Soal 2: Tambah variabel colors dengan 10 warna
  final List<Color> colors = [
    Colors.blueGrey,
    Colors.amber,
    Colors.deepPurple,
    Colors.lightBlue,
    Colors.teal,
    // 5 warna tambahan untuk Soal 2
    Colors.red,
    Colors.green,
    Colors.pink,
    Colors.orange,
    Colors.indigo,
  ];

  // Langkah 5: Tambah method getColors() (menggunakan async*)
  Stream<Color> getColors() async* {
    // Langkah 6: Tambah perintah yield*
    yield* Stream.periodic(const Duration(seconds: 1), (int t) {
      int index = t % colors.length;
      return colors[index];
    });
  }
}
