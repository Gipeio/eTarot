import 'package:etarot/model/Card.dart';
import 'package:etarot/widgets/card_detail_widget.dart';
import 'package:etarot/styling/style.dart';
import 'package:flutter/material.dart';

class DrawEmplacementObject extends StatefulWidget {
  final int index;
  bool occupied;
  bool hidden;
  TarotCard? card;
  final List<TarotCard> deck;
  DecorationImage? backgroundImage;

  DrawEmplacementObject({
    Key? key,
    required this.index,
    required this.deck,
    this.occupied = false,
    this.hidden = true,
    this.card,
    this.backgroundImage,
  });

  void revealCard() {
    // Delegating the call to the state's updateCard method
    _drawEmplacementObjectState.revealCard();
  }

  void addHiddenCard(TarotCard card) {
    // Delegating the call to the state's updateCard method
    _drawEmplacementObjectState.addHiddenCard(card);
  }

  void showCardDetails(TarotCard card){
    _drawEmplacementObjectState.showCardDetails(card);
  }

  _DrawEmplacementObjectState get _drawEmplacementObjectState =>
      _DrawEmplacementObjectState();

  @override
  _DrawEmplacementObjectState createState() => _DrawEmplacementObjectState();
}

class _DrawEmplacementObjectState extends State<DrawEmplacementObject> {
  Color backgroundColor = Style.backgroundColor;

  void revealCard() {
    setState(() {
      widget.hidden = false;
      widget.backgroundImage = DecorationImage(
        image: AssetImage('assets/cards/${widget.card?.id}.jpg'),
        fit: BoxFit.fill,
      );
    });
  }

  void addHiddenCard(TarotCard card) {
    setState(() {
      widget.card = card;
      widget.occupied = true;
      widget.backgroundImage = const DecorationImage(
        image: AssetImage('assets/backCard.jpg'),
        fit: BoxFit.fill,
      );
    });
  }

  void showCardDetails(TarotCard card) {
  Navigator.of(context).push(
    PageRouteBuilder(
      opaque: false,
      pageBuilder: (BuildContext context, _, __) {
        return CardDetailWidget(card: card);
      },
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!widget.occupied) {
          widget.deck.shuffle();
          TarotCard drawnCard = widget.deck.removeAt(0);
          addHiddenCard(drawnCard);
          // Call the updateCard method from the state
        } else {
          if (widget.hidden) {
            revealCard();
          } else {
            showCardDetails(widget.card!);
          }
        }
      },
      child: Container(
        margin: EdgeInsets.all(14.0),
        decoration: BoxDecoration(
          // Use backgroundImage property for setting the background image
          image: widget.backgroundImage,
          border: Border.all(color: Style.itemColor),
          borderRadius: BorderRadius.circular(10.0),
        ),
        // Your other widget content here
      ),
    );
  }
}
