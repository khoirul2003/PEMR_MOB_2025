import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'filter_selector.dart';
import 'dart:io';

@immutable
class PhotoFilterCamera extends StatefulWidget {
  final CameraDescription camera;
  const PhotoFilterCamera({super.key, required this.camera});

  @override
  State<PhotoFilterCamera> createState() => _PhotoFilterCameraState();
}

class _PhotoFilterCameraState extends State<PhotoFilterCamera> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  final _filters = [
    Colors.white,
    ...List.generate(
      Colors.primaries.length,
      (index) => Colors.primaries[(index * 4) % Colors.primaries.length],
    ),
  ];

  final _filterColor = ValueNotifier<Color>(Colors.white);

  @override
  void initState() {
    super.initState();
    _controller = CameraController(widget.camera, ResolutionPreset.medium);
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onFilterChanged(Color color) {
    _filterColor.value = color;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              children: [
                // Kamera
                Positioned.fill(child: CameraPreview(_controller)),

                // Filter overlay
                Positioned.fill(
                  child: ValueListenableBuilder(
                    valueListenable: _filterColor,
                    builder: (context, color, _) =>
                        Container(color: color.withOpacity(0.3)),
                  ),
                ),

                // Selector filter di bawah
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: FilterSelector(
                    filters: _filters,
                    onFilterChanged: _onFilterChanged,
                  ),
                ),

                // Tombol ambil foto 📸
                Positioned(
                  bottom: 100,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: FloatingActionButton(
                      backgroundColor: Colors.white,
                      onPressed: () async {
                        try {
                          await _initializeControllerFuture;
                          final image = await _controller.takePicture();
                          print('📸 Gambar disimpan di: ${image.path}');
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Foto disimpan di ${image.path}'),
                            ),
                          );
                        } catch (e) {
                          print('❌ Error: $e');
                        }
                      },
                      child: const Icon(Icons.camera_alt, color: Colors.black),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
