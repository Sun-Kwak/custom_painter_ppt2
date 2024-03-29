import 'package:flutter/material.dart';

class RectanglePaintPage extends StatefulWidget {
  @override
  State<RectanglePaintPage> createState() => _RectanglePaintPageState();
}

class _RectanglePaintPageState extends State<RectanglePaintPage> {
  PaintingStyle currentPaintingStyle = PaintingStyle.stroke;
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
                    painter: RectanglePainter(paintingStyle: currentPaintingStyle),
                    // child: Text(
                    //   "Custom Paint",
                    //   style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
                    // ),
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        currentPaintingStyle = PaintingStyle.stroke;
                      });
                    },
                    child: Text('stroke'),
                  ),
                  SizedBox(width: 10,),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        currentPaintingStyle = PaintingStyle.fill;
                      });
                    },
                    child: Text('fill'),
                  ),
                ],
              )

            ],
          ),
          Center(
            child: Container(
              width: screenWidth/2,

              child: Image.asset('assets/rectangle_painter.png'),
            ),
          )
        ],
      ),
    );
  }
}

class RectanglePainter extends CustomPainter {
  final PaintingStyle paintingStyle;
  RectanglePainter({required this.paintingStyle});
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 10
      ..style = paintingStyle;

    final a = Offset(size.width * 1 / 6, size.height * 1 / 4);
    final b = Offset(size.width * 5 / 6, size.height * 3 / 4);
    final rect = Rect.fromPoints(a, b);

    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
