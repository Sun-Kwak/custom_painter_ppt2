import 'package:flutter/material.dart';

class CombinedPaintPage extends StatefulWidget {
  @override
  State<CombinedPaintPage> createState() => _CombinedPaintPageState();
}

class _CombinedPaintPageState extends State<CombinedPaintPage> {
  PathOperation? currentOperation;

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
                    painter: CombinedPainter(operation: currentOperation),
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        currentOperation = PathOperation.intersect;
                      });
                    },
                    child: Text('Intersect'),
                  ),
                  SizedBox(width: 10,),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        currentOperation = PathOperation.difference;
                      });
                    },
                    child: Text('Difference'),
                  ),
                  SizedBox(width: 10,),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        currentOperation = PathOperation.reverseDifference;
                      });
                    },
                    child: Text('ReverseDifference'),
                  ),
                  SizedBox(width: 10,),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        currentOperation = PathOperation.union;
                      });
                    },
                    child: Text('union'),
                  ),
                  SizedBox(width: 10,),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        currentOperation = PathOperation.xor;
                      });
                    },
                    child: Text('xor'),
                  ),
                  SizedBox(width: 10,),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        currentOperation = null;
                      });
                    },
                    child: Text('basic'),
                  )
                ],
              ),
            ],
          ),
          Center(
            child: Container(
              width: screenWidth / 2,
              child: Image.asset('assets/combined_painter.png'),
            ),
          )
        ],
      ),
    );
  }
}

class CombinedPainter extends CustomPainter {
  final PathOperation? operation;

  CombinedPainter({this.operation});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = operation == null ? PaintingStyle.stroke : PaintingStyle.fill
      ..color = Colors.blueGrey
      ..strokeWidth = 2;

    final paint2 = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.redAccent
      ..strokeWidth = 2;

    Rect recOne = Rect.fromCircle(
      center: Offset(size.width / 3, size.height / 2),
      radius: size.width / 4,
    );

    Rect recTwo = Rect.fromCircle(
      center: Offset(size.width / 3 * 2, size.height / 2),
      radius: size.width / 4,
    );

    Path pathOne = Path()..addOval(recOne);
    Path pathTwo = Path()..addOval(recTwo);

    if (operation != null) {
      canvas.drawPath(Path.combine(operation!, pathOne, pathTwo), paint);
      // canvas.drawPath(Path.combine(PathOperation.intersect, pathOne, pathTwo), paint);
      // canvas.drawPath(Path.combine(PathOperation.difference, pathOne, pathTwo), paint);
      // canvas.drawPath(Path.combine(PathOperation.reverseDifference, pathOne, pathTwo), paint);
      // canvas.drawPath(Path.combine(PathOperation.union, pathOne, pathTwo), paint);
      // canvas.drawPath(Path.combine(PathOperation.xor, pathOne, pathTwo), paint);
    } else {
      canvas.drawPath(pathOne, paint);
      canvas.drawPath(pathTwo, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
