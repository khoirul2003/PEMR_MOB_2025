import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout: Muhammad Khoirul Anwarudin - 244107023007',
      home: Scaffold(
        appBar: AppBar(title: const Text('Flutter layout demo')),
        body: ListView(
          children: [
             Image.asset(
              'images/buthak.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection(context),
            textSection,
          ],
        ),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }

  Widget get titleSection => Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: const Text(
                  'Wisata Gunung di Batu',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                'Batu, Malang, Indonesia',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
        Icon(Icons.star, color: Colors.red[500]),
        const Text('41'),
      ],
    ),
  );

  Widget buttonSection(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );
  }

  Widget get textSection => Container(
    padding: const EdgeInsets.all(32),
    child: const Text(
      'Kota Batu adalah salah satu destinasi wisata populer di Jawa Timur. '
      'Terletak di pegunungan dengan udara yang sejuk, Batu dikenal sebagai '
      'kota wisata dengan beragam pilihan rekreasi. Mulai dari wisata alam '
      'seperti Gunung Panderman, Gunung Butak, dan Coban Rondo, hingga wisata '
      'modern seperti Jatim Park, Museum Angkut, dan Batu Night Spectacular. \n\n'
      'Selain itu, Batu juga terkenal dengan agrowisatanya, terutama kebun apel '
      'yang menjadi ikon khas kota ini. Keindahan alam, budaya, dan berbagai '
      'fasilitas wisata membuat Batu menjadi tujuan favorit wisatawan lokal '
      'maupun mancanegara. \n\n'
      'Nama: Muhammad Khoirul Anwarudin \n'
      'NIM : 244107023007',
      softWrap: true,
    ),
  );
}
