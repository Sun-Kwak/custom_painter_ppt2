import 'package:flutter/material.dart';

class TrianglePaintPage extends StatefulWidget {
  @override
  State<TrianglePaintPage> createState() => _TrianglePaintPageState();
}

class _TrianglePaintPageState extends State<TrianglePaintPage> {
  bool isAddPath = false;
  String path = 'add path';
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
                    painter: TrianglePainter(path: isAddPath),
                  ),
                ),
              ),
              SizedBox(height: 30,),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isAddPath = !isAddPath;
                    if(isAddPath) {
                      path = 'remove path';
                    } else {
                      path = 'add path';
                    }
                  });
                },
                child: Text(path),
              )
            ],
          ),
          Center(
            child: Container(
              width: screenWidth/2,

              child: Image.asset('assets/triangle_painter.png'),
            ),
          )

        ],
      ),
    );
  }
}

class TrianglePainter extends CustomPainter {
  final bool path;

  TrianglePainter({required this.path});
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.green
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final _path = Path();
    _path.moveTo(size.width * 1 / 2, size.height * 1 / 4);
    _path.lineTo(size.width * 1 / 6, size.height * 3 / 4);
    path ? _path.moveTo(size.width * 1 / 2, size.height * 3 / 4) : null;
    _path.lineTo(size.width * 5 / 6, size.height * 3 / 4);
    _path.lineTo(size.width * 1 / 2, size.height * 1 / 4);

    canvas.drawPath(_path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
