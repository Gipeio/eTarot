import 'package:etarot/model/Card.dart';
import 'package:etarot/model/CardFace.dart';
import 'package:flutter/material.dart';

class CardDetailWidget extends StatefulWidget {
  final TarotCard card;
  final CardFace cardFace;
  final int reversed;

  CardDetailWidget({required this.card, required this.cardFace, required this.reversed});

  @override
  _CardDetailWidgetState createState() => _CardDetailWidgetState();
}

class _CardDetailWidgetState extends State<CardDetailWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context); // Close the widget on tap
      },
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.all(16.0),
          color: Colors.black87,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                (widget.reversed != 0) ? // Check if reversed is not equal to 0
                  Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationX(3.14), // Rotate around the X axis by pi radians (180 degrees)
                    child: _buildCardImage(),
                  ) : _buildCardImage(),
                SizedBox(height: 16.0),
                Text(
                  widget.cardFace.meaning ?? 'No meaning available',
                  style: TextStyle(fontSize: 16.0, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCardImage() {
    return Image.asset(
      'assets/cards/${widget.card.id}.jpg',
      height: MediaQuery.of(context).size.height * 0.8,
      fit: BoxFit.contain,
    );
  }
}
