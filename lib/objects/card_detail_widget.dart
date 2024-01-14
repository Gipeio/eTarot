import 'package:etarot/model/Card.dart';
import 'package:flutter/material.dart';

class CardDetailWidget extends StatefulWidget {
  final TarotCard card;

  CardDetailWidget({required this.card});

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
                Image.asset(
                  'assets/cards/${widget.card.id}.jpg',
                  height: MediaQuery.of(context).size.height * 0.8,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 16.0),
                Text(
                  widget.card.name ?? 'No meaning available',
                  style: TextStyle(fontSize: 16.0, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
