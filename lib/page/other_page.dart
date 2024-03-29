import 'package:flutter/material.dart';

class OtherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Container(
              width: screenWidth/2-50,
              child: Image.asset('assets/all_draw.png'),
            ),
          ),
          Center(
            child: Container(
              width: screenWidth/2-50,
              child: Image.asset('assets/path_method.png'),
            ),
          )
        ],
      ),
    );
  }
}
