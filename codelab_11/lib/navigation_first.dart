import 'package:flutter/material.dart';
import 'navigation_second.dart'; // Impor layar kedua

class NavigationFirst extends StatefulWidget {
  const NavigationFirst({super.key});

  @override
  State<NavigationFirst> createState() => _NavigationFirstState();
}

class _NavigationFirstState extends State<NavigationFirst> {
  // Soal 15: Mengganti warna tema favorit (Orange)
  Color color = Colors.orange.shade700;

  // --- Praktikum 8, Langkah 3: Tambah method async/await untuk navigasi ---
  Future<void> _navigateAndGetColor(BuildContext context) async {
    // Navigator.push mengembalikan Future. Kita menggunakan await untuk menunggu
    // data yang 'di-pop' dari layar kedua.
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NavigationSecond()),
    );

    // Perbaikan: Hapus kurung kurawal ganda dan gunakan setState
    // Gunakan operator ?? untuk memberikan nilai default (Colors.orange) jika result null.
    if (result != null && result is Color) {
      setState(() {
        color = result;
      });
    }
  }
  // --------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        // Soal 15: Menambahkan nama panggilan pada properti title
        title: const Text('Navigation First Screen - Khoirul'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Change Color'),
          onPressed: () {
            _navigateAndGetColor(context);
          },
        ),
      ),
    );
  }
}
