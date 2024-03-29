import 'package:flutter/material.dart';

class LinePaintPage extends StatefulWidget {
  @override
  State<LinePaintPage> createState() => _LinePaintPageState();
}

class _LinePaintPageState extends State<LinePaintPage> {
  StrokeCap currentStrokeCap = StrokeCap.round;
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
                    foregroundPainter: LinePainter(strokeCap: currentStrokeCap),
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        currentStrokeCap = StrokeCap.round;
                      });
                    },
                    child: Text('round'),
                  ),
                  SizedBox(width: 10,),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        currentStrokeCap = StrokeCap.butt;
                      });
                    },
                    child: Text('butt'),
                  ),
                  SizedBox(width: 10,),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        currentStrokeCap = StrokeCap.square;
                      });
                    },
                    child: Text('square'),
                  ),
                ],
              )
            ],
          ),
          Center(
            child: Container(
              width: screenWidth/2,

              child: Image.asset('assets/line_painter.png'),
            ),
          ),
        ],
      ),
    );
  }
}


class LinePainter extends CustomPainter {
  final StrokeCap strokeCap;
  LinePainter({required this.strokeCap});
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.amber
      ..strokeCap = strokeCap
      ..strokeWidth = 10;

    canvas.drawLine(
      Offset(size.width * 1 / 6, size.height * 1 / 2),
      Offset(size.width * 5 / 6, size.height * 1 / 2),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
