import 'package:flutter/material.dart';
import 'dart:math' as math;

class TextPaintPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
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
                painter: RepeatingCubicUnderlinedTextPainter(
                  text: 'TEXT PAINTER',
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              width: screenWidth / 2,

              child: Image.asset('assets/text_painter.png'),
            ),
          )

        ],
      ),
    );
  }
}

class CustomTextPainter extends CustomPainter {
  final String text;
  final TextStyle textStyle;

  CustomTextPainter({required this.text, required this.textStyle});

  @override
  void paint(Canvas canvas, Size size) {
    final textSpan = TextSpan(
      text: text,
      style: textStyle,
    );

    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();

    final offset = Offset((size.width - textPainter.width) / 2,
        (size.height - textPainter.height) / 2);
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class RepeatingCubicUnderlinedTextPainter extends CustomPainter {
  final String text;
  final TextStyle textStyle;
  final double amplitude;
  final int numRepeats;

  RepeatingCubicUnderlinedTextPainter({
    required this.text,
    required this.textStyle,
    this.amplitude = 5.0, // 곡선의 높이
    this.numRepeats = 5, // 반복 횟수
  });

  @override
  void paint(Canvas canvas, Size size) {
    final textSpan = TextSpan(
      text: text,
      style: textStyle,
    );

    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout(minWidth: 0, maxWidth: size.width);

    final offset = Offset((size.width - textPainter.width) / 2,
        (size.height - textPainter.height) / 2);
    textPainter.paint(canvas, offset);

    var paint = Paint()
      ..color = Colors.orange
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke;

    final arc1 = Path();
    arc1.moveTo(size.width * 0.2, size.height * 0.2);
    arc1.arcToPoint(
      Offset(size.width * 0.8, size.height * 0.2),
      radius: Radius.circular(textPainter.width),
      clockwise: false,
    );

    canvas.drawPath(arc1, paint);

    canvas.drawPath(arc1, paint);

    final arc2 = Path();
    arc2.moveTo(size.width * 0.2, size.height * 0.8);
    arc2.arcToPoint(
      Offset(size.width * 0.8, size.height * 0.8),
      radius: Radius.circular(textPainter.width),
    );

    canvas.drawPath(arc2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class MasterPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.strokeWidth = 2;
    paint.color = Colors.black;
    paint.style = PaintingStyle.stroke;
    Offset center = Offset(size.width/2, size.height/2);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}










