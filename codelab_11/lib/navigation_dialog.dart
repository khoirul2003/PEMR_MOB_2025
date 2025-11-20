import 'package:flutter/material.dart';

class NavigationDialogScreen extends StatefulWidget {
  const NavigationDialogScreen({super.key});

  @override
  State<NavigationDialogScreen> createState() => _NavigationDialogScreenState();
}

class _NavigationDialogScreenState extends State<NavigationDialogScreen> {
  // Soal 15: Menggunakan warna awal favorit (Orange)
  Color color = Colors.orange.shade700;

  // --- Praktikum 9, Langkah 3: Tambah method async untuk dialog ---
  Future<void> _showColorDialog(BuildContext context) async {
    // showDialog mengembalikan Future, kita menggunakan await untuk menunggu hasilnya.
    final selectedColor = await showDialog<Color>(
      barrierDismissible: false, // Dialog tidak bisa ditutup dengan tap di luar
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Very important question'),
          content: const Text('Please choose a color'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cyan'), // Menggunakan warna favorit
              onPressed: () {
                // Menggunakan Navigator.pop untuk mengembalikan nilai Color
                Navigator.pop(context, Colors.cyan.shade700);
              },
            ),
            TextButton(
              child: const Text('Deep Purple'), // Menggunakan warna favorit
              onPressed: () {
                Navigator.pop(context, Colors.deepPurple.shade700);
              },
            ),
            TextButton(
              child: const Text('Teal'), // Menggunakan warna favorit
              onPressed: () {
                Navigator.pop(context, Colors.teal.shade700);
              },
            ),
          ],
        );
      },
    );

    // Setelah dialog ditutup, eksekusi dilanjutkan di sini.
    if (selectedColor != null) {
      // Perbarui state dengan warna yang dikembalikan dari dialog
      setState(() {
        color = selectedColor;
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
        title: const Text('Navigation Dialog Screen - Khoirul'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Change Color'),
          // --- Praktikum 9, Langkah 4: Panggil method di ElevatedButton ---
          onPressed: () {
            _showColorDialog(context);
          },
        ),
      ),
    );
  }
}
