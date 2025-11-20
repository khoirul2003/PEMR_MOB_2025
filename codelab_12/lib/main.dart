import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    // Membuat tampilan dasar dengan AppBar untuk melihat perubahan judul dan warna tema
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
