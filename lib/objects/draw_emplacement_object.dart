import 'package:etarot/model/Card.dart';
import 'package:etarot/styling/style.dart';
import 'package:flutter/material.dart';

class DrawEmplacementObject extends StatefulWidget {
  final int index;
  final Function() onPressed;
  final bool occupied;
  final TarotCard? card;

  const DrawEmplacementObject({
    Key? key,
    required this.index,
    required this.onPressed,
    this.occupied = false,
    this.card,
  }) : super(key: key);

  @override
  _DrawEmplacementObjectState createState() => _DrawEmplacementObjectState();

  void changeColorExternally() {}
}

class _DrawEmplacementObjectState extends State<DrawEmplacementObject> {
  Color backgroundColor = Style.backgroundColor;

  void pressEmptyEmplacement() {
    setState(() {
      backgroundColor = Colors.blue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onPressed();
      },
      onTapDown: (details) {
        if (!widget.occupied) {
          pressEmptyEmplacement();
        }
      },
      child: Container(
        margin: EdgeInsets.all(14.0),
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: Style.itemColor),
          borderRadius: BorderRadius.circular(40.0),
        ),
        // Your other widget content here
      ),
    );
  }

  // Additional method to change color externally
  void changeColorExternally() {
    pressEmptyEmplacement();
  }
}
