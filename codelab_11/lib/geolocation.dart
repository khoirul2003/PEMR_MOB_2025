import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationScreen extends StatefulWidget {
  // Soal 11: Menambahkan nama panggilan pada properti title
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  // Variabel Future untuk FutureBuilder
  Future<Position>? position;

  @override
  void initState() {
    super.initState();
    position = getPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Current Location - Khoirul'),
      ), // Mempertahankan identitas
      body: Center(
        child: FutureBuilder(
          future: position,
          builder: (BuildContext context, AsyncSnapshot<Position> snapshot) {
            // 1. Cek jika masih menunggu data (sedang loading)
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            // --- Praktikum 7, Langkah 5: Tambah handling error setelah ConnectionState.done ---
            else if (snapshot.connectionState == ConnectionState.done) {
              // Cek apakah ada error
              if (snapshot.hasError) {
                return const Text(
                  'Something terrible happened!',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.red),
                );
              }

              // Jika tidak ada error, tampilkan data
              // Pastikan data tidak null sebelum memanggil toString()
              if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Latitude: ${snapshot.data!.latitude.toString()}\nLongitude: ${snapshot.data!.longitude.toString()}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              } else {
                return const Text('Data lokasi tidak tersedia.');
              }
            }
            // --------------------------------------------------------------------------------
            // 2. Default case (seharusnya tidak tercapai jika FutureBuilder dikelola dengan baik)
            else {
              return const Text('');
            }
          },
        ),
      ),
    );
  }

  // Method asinkron untuk mendapatkan posisi GPS
  Future<Position> getPosition() async {
    // Tambahan Soal 12: Menambahkan delay untuk melihat animasi loading
    await Future.delayed(const Duration(seconds: 3));

    // Perlu meminta izin sebelum getCurrentPosition
    await Geolocator.requestPermission();

    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Melempar exception yang akan ditangkap oleh FutureBuilder snapshot.hasError
      throw Exception('Layanan lokasi (GPS) tidak aktif.');
    }

    // Simulasikan throw error di sini untuk menguji Langkah 5
    // throw Exception('Simulasi Error di dalam FutureBuilder');

    Position pos = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    return pos;
  }
}
