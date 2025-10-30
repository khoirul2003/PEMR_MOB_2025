import 'package:codelab_09/widgets/filter_carousel.dart';
import 'package:codelab_09/widgets/photo_filter_camera.dart';
import 'package:codelab_09/widgets/takepicture_screen.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final cameras = await availableCameras();
  final firstCamera = cameras.first;

  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      home: PhotoFilterCamera(camera: firstCamera),
      // home: TakePictureScreen(camera: firstCamera),
      // home: PhotoFilterCarousel(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
