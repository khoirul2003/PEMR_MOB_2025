import 'package:flutter/material.dart';

class NavigationSecond extends StatefulWidget {
  const NavigationSecond({super.key});

  @override
  State<NavigationSecond> createState() => _NavigationSecondState();
}

class _NavigationSecondState extends State<NavigationSecond> {
  @override
  Widget build(BuildContext context) {
    // Variabel lokal untuk menampung warna yang dipilih
    // Tidak perlu 'late' atau inisialisasi awal karena akan diset sebelum pop.
    Color color;

    return Scaffold(
      appBar: AppBar(
        // Soal 15: Menambahkan nama panggilan pada properti title
        title: const Text('Navigation Second Screen - Khoirul'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Soal 16: Mengganti warna favorit pertama (Red -> Cyan)
            ElevatedButton(
              child: const Text('Cyan'),
              onPressed: () {
                color = Colors.cyan.shade700;
                // Navigator.pop mengirimkan nilai 'color' kembali ke layar pertama
                Navigator.pop(context, color);
              },
            ),

            // Soal 16: Mengganti warna favorit kedua (Green -> Deep Purple)
            ElevatedButton(
              child: const Text('Deep Purple'),
              onPressed: () {
                color = Colors.deepPurple.shade700;
                Navigator.pop(context, color);
              },
            ),

            // Soal 16: Mengganti warna favorit ketiga (Blue -> Teal)
            ElevatedButton(
              child: const Text('Teal'),
              onPressed: () {
                color = Colors.teal.shade700;
                Navigator.pop(context, color);
              },
            ),
          ],
        ),
      ),
    );
  }
}
