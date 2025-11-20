import 'dart:async';
import 'package:flutter/material.dart';
// Import file screen baru
// import 'geolocation.dart';
// import 'navigation_first.dart'; // Diganti dengan navigation_dialog
import 'navigation_dialog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Soal 11/15: Menambahkan nama panggilan pada properti title
      title: 'Flutter Demo Khoirul',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // Langkah 5: Memanggil screen dialog baru (memperbaiki nama class)
      home: const NavigationDialogScreen(),
    );
  }
}

// Class-class sebelumnya dihapus/dilewati.
