import 'package:flutter/material.dart';

class RoundedRectanglePaintPage extends StatefulWidget {
  @override
  State<RoundedRectanglePaintPage> createState() =>
      _RoundedRectanglePaintPageState();
}

class _RoundedRectanglePaintPageState extends State<RoundedRectanglePaintPage> {
  double radius = 32;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  color: Colors.white,
                  width: 300,
                  height: 300,
                  child: CustomPaint(
                    painter: RoundedRectanglePainter(radius: radius),
                  ),
                ),
              ),
              Slider(
                  value: radius,
                  min: 0,
                  max: 100,
                  onChanged: (value) {
                    setState(
                      () {
                        radius = value;
                      },
                    );
                  })
            ],
          ),
          Center(
            child: Container(
              width: screenWidth / 2,
              child: Image.asset('assets/rounded_rectangle_painter.png'),
            ),
          )
        ],
      ),
    );
  }
}

class RoundedRectanglePainter extends CustomPainter {
  final double radius;
  RoundedRectanglePainter({required this.radius});
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke;

    Offset center = size.center(Offset.zero);

    final a = Offset(size.width * 1 / 6, size.height * 1 / 4);
    final b = Offset(size.width * 5 / 6, size.height * 3 / 4);
    final rect = Rect.fromPoints(a, b);
    final _radius = Radius.circular(radius);

    canvas.drawRRect(RRect.fromRectAndRadius(rect, _radius), paint);
    TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: '${radius.toStringAsFixed(0)}',
        style: const TextStyle(fontSize: 100.0, fontWeight: FontWeight.w500, color: Colors.deepPurple),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(canvas, Offset(center.dx - textPainter.width / 2, center.dy - textPainter.height / 2));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
