import 'package:flutter/material.dart';

class CirclePaintPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Container(
              color: Colors.white,
              width: 300,
              height: 300,
              child: CustomPaint(
                painter: CirclePainter(),
              ),
            ),
          ),
          Center(
            child: Container(
              width: screenWidth/2,

              child: Image.asset('assets/circle_painter.png'),
            ),
          )

        ],
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    final paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(
      center,
      size.width * 1 / 4,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
