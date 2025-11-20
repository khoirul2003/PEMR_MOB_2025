import 'package:flutter/material.dart';
// Langkah 7: Import file stream.dart
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
  // Langkah 8: Tambah variabel
  Color bgColor = Colors.blueGrey;
  late ColorStream colorStream;

  // Langkah 10: Lakukan override initState()
  @override
  void initState() {
    super.initState();
    colorStream = ColorStream();
    changeColor();
  }

  // Langkah 9: Tambah method changeColor()
  void changeColor() async {
    // Mendengarkan stream warna dari colorStream.getColors()
    // Loop akan berjalan selama stream terus mengeluarkan event
    await for (var eventColor in colorStream.getColors()) {
      setState(() {
        bgColor = eventColor; // Mengubah warna background setiap ada event baru
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Langkah 11: Ubah isi Scaffold()
    return Scaffold(
      appBar: AppBar(title: const Text('Dart Streams App - Khoirul')),
      body: Container(
        // Menggunakan bgColor untuk dekorasi background
        decoration: BoxDecoration(color: bgColor),
        // Tambahkan child agar container memiliki ukuran penuh dan teks di tengah
        child: Center(
          child: Text(
            'Warna Akan Berubah Otomatis',
            style: TextStyle(
              color: Colors.white.withOpacity(
                0.9,
              ), // Teks putih agar terlihat di semua warna
              fontSize: 24,
              fontWeight: FontWeight.bold,
              shadows: const [
                Shadow(
                  blurRadius: 5.0,
                  color: Colors.black54,
                  offset: Offset(2, 2),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
