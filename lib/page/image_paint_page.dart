import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'dart:math' as math;

import 'package:flutter/services.dart';

class ImagePaintPage extends StatefulWidget {
  @override
  _ImagePaintPageState createState() => _ImagePaintPageState();
}

class _ImagePaintPageState extends State<ImagePaintPage> {
  ui.Image? image;

  @override
  void initState() {
    super.initState();

    loadImage('assets/image.jpg');
  }

  Future loadImage(String path) async {
    final data = await rootBundle.load(path);
    final bytes = data.buffer.asUint8List();
    final image = await decodeImageFromList(bytes);

    setState(() => this.image = image);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: image == null
                ? CircularProgressIndicator()
                : Container(
              height: 300,
              width: 300,
              child: FittedBox(
                child: SizedBox(
                  width: image!.width.toDouble(),
                  height: image!.height.toDouble(),
                  child: CustomPaint(
                    painter: ImagePainter(image!),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: image == null
                ? CircularProgressIndicator()
                : Container(
              height: 300,
              width: 300,
              child: FittedBox(
                child: SizedBox(
                  width: image!.width.toDouble(),
                  height: image!.height.toDouble(),
                  child: CustomPaint(
                    painter: ImagePainter2(image!),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              width: screenWidth/2,

              child: Image.asset('assets/image_painter.png'),
            ),
          )
        ],
      ),
    );
  }
}

class ImagePainter extends CustomPainter {
  final ui.Image image;

  const ImagePainter(this.image);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    canvas.drawImage(image, Offset.zero, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class ImagePainter2 extends CustomPainter {
  final ui.Image image;

  const ImagePainter2(this.image);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.colorFilter = ColorFilter.mode(Colors.blue, BlendMode.overlay);

    canvas.translate(size.width / 2, size.height / 2);
    canvas.rotate(math.pi / 4); // 45도 회전
    final src = Rect.fromPoints(Offset(10.0, 20.0), Offset(300.0, 300.0));
    final dst = Rect.fromPoints(Offset(100.0, 150.0), Offset(500.0, 700.0));
    canvas.scale(-1.0, 1.0);
    canvas.drawImageRect(image, src, dst, paint);
    canvas.save();
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}



