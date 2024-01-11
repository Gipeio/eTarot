import 'package:etarot/model/Card.dart';
import 'package:etarot/styling/style.dart';
import 'package:flutter/material.dart';

class DrawEmplacementObject extends StatelessWidget {
  final int index;
  final VoidCallback onPressed;
  final bool occupied;
  final TarotCard? card;


  const DrawEmplacementObject({
    required this.index,
    required this.onPressed,
    this.occupied = false,
    this.card,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onPressed,
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
