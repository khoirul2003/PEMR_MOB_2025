import 'package:flutter/material.dart';

class IntroductionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Introduction to Layouts')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Overview',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Layouts in Flutter are built with widgets. Widgets are classes used to build UIs. Widgets are also used to build UI elements. Compose simple widgets to build complex widgets.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Conceptual Example',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Image.network(
              'https://docs.flutter.dev/assets/images/docs/ui/layout/lakes-icons.png',
              height: 150,
            ),
            Text('Three icons with labels.'),
            Image.network(
              'https://docs.flutter.dev/assets/images/docs/ui/layout/lakes-icons-visual.png',
              height: 150,
            ),
            Text(
              'Visual layout for rows and columns with debugPaintSizeEnabled set to true.',
            ),
          ],
        ),
      ),
    );
  }
}
