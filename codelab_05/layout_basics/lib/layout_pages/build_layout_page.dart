import 'package:flutter/material.dart';

class BuildLayoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lay out a widget')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'How to lay out a single widget in Flutter',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              '1. Select a layout widget: Choose from a variety of layout widgets based on how you want to align or constrain a visible widget.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              '2. Create a visible widget: Choose a visible widget for your app to contain visible elements, such as text, images, or icons.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              '3. Add the visible widget to the layout widget: All layout widgets have either a child property if they take a single child or a children property if they take a list of widgets.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              '4. Add the layout widget to the page: Instantiate and returning a widget in the app\'s build() method displays the widget.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              '5. Run your app:  When you run the app, you should see Hello World.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Example:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Center(child: Text('Hello World', style: TextStyle(fontSize: 32))),
          ],
        ),
      ),
    );
  }
}
