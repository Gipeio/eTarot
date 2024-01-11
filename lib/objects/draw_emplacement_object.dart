import 'package:etarot/styling/style.dart';
import 'package:flutter/material.dart';

class DrawEmplacementObject extends StatelessWidget {
  final int index;

  const DrawEmplacementObject({
    required this.index,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        // Add your functionality here when the rectangle is clicked
        print('Rectangle $index clicked!');
      },
      child: Container(
        margin: EdgeInsets.all(14.0),
        decoration: BoxDecoration(
          color: Style.backgroundColor,
          border: Border.all(color: Style.itemColor),
          borderRadius: BorderRadius.circular(40.0),
        ),
        // You can customize the content of each rectangle here
      ),
    );
  }
}
