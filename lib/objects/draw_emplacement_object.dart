import 'package:etarot/model/Card.dart';
import 'package:etarot/styling/style.dart';
import 'package:flutter/material.dart';

class DrawEmplacementObject extends StatefulWidget {
  final int index;
  bool occupied;
  TarotCard? card;
  final List<TarotCard> deck;
  DecorationImage? backgroundImage;

  DrawEmplacementObject({
    Key? key,
    required this.index,
    required this.deck,
    this.occupied = false,
    this.card,
    this.backgroundImage,
  });

    void updateCard(TarotCard card) {
    // Delegating the call to the state's updateCard method
    _drawEmplacementObjectState.updateCard(card);
  }

  _DrawEmplacementObjectState get _drawEmplacementObjectState =>
      _DrawEmplacementObjectState();

  @override
  _DrawEmplacementObjectState createState() => _DrawEmplacementObjectState();
}

class _DrawEmplacementObjectState extends State<DrawEmplacementObject> {
  Color backgroundColor = Style.backgroundColor;

  void pressEmptyEmplacement() {
    setState(() {
      backgroundColor = Colors.blue;
    });
  }

  void updateCard(TarotCard card) {
    setState(() {
      widget.card = card;
      widget.occupied = true;
      // Set the background image for occupied state
      // Replace 'your_image_path.png' with the path to your image asset
      widget.backgroundImage = DecorationImage(
        image: AssetImage('assets/eTarot_logo.png'),
        fit: BoxFit.cover,
      );
    });
  }


 @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!widget.occupied) {
          pressEmptyEmplacement();

          if (widget.deck.isNotEmpty) {
            widget.deck.shuffle();
            TarotCard drawnCard = widget.deck.removeAt(0);
            print("added " + drawnCard.name + " deck is now: " + widget.deck.length.toString());
            // Call the updateCard method from the state
            updateCard(drawnCard);
          } else {
            print(widget.card?.name);
          }
        }
      },
      child: Container(
        margin: EdgeInsets.all(14.0),
        decoration: BoxDecoration(
          // Use backgroundImage property for setting the background image
          image: widget.backgroundImage,
          border: Border.all(color: Style.itemColor),
          borderRadius: BorderRadius.circular(40.0),
        ),
        // Your other widget content here
      ),
    );
  }
}
