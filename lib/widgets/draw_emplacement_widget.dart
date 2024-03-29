import 'dart:math';

import 'package:etarot/model/Card.dart';
import 'package:etarot/model/CardFace.dart';
import 'package:etarot/services/card_face_service.dart';
import 'package:etarot/widgets/card_detail_widget.dart';
import 'package:etarot/styling/style.dart';
import 'package:flutter/material.dart';

class DrawEmplacementObject extends StatefulWidget {
  final int index;
  bool occupied;
  bool hidden;
  TarotCard? card;
  CardFace? cardFace;
  int facePosition;
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
    this.cardFace,
    this.facePosition = 0,
  });

  void revealCard() {
    // Delegating the call to the state's updateCard method
    _drawEmplacementObjectState.revealCard();
  }

  void addHiddenCard(TarotCard card) {
    // Delegating the call to the state's updateCard method
    _drawEmplacementObjectState.addHiddenCard(card);
  }

  void showCardDetails(TarotCard card, CardFace cardFace){
    _drawEmplacementObjectState.showCardDetails(card, cardFace);
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
      alignment: Alignment.center,
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
        alignment: Alignment.center,
      );
    });
  }

  void showCardDetails(TarotCard card, CardFace cardFace) {
  Navigator.of(context).push(
    PageRouteBuilder(
      opaque: false,
      pageBuilder: (BuildContext context, _, __) {
        return CardDetailWidget(card: card, cardFace: cardFace,reversed: widget.facePosition,);
      },
    ),
  );
}

@override
Widget build(BuildContext context) {
  return GestureDetector(
    onTap: () async {
      if (!widget.occupied) {
        widget.deck.shuffle();
        TarotCard drawnCard = widget.deck.removeAt(0);
        addHiddenCard(drawnCard);
        CardFaceService cardFaceService = CardFaceService();
        List<CardFace> cardFaces = [];
        CardFace? firstFace = await cardFaceService.getCardFace(widget.card!.faceId);
        CardFace? secondFace = await cardFaceService.getCardFace(widget.card!.reversedFaceId);
        cardFaces.add(firstFace!);
        cardFaces.add(secondFace!);
        widget.facePosition = Random().nextInt(2);
        widget.cardFace = cardFaces[widget.facePosition];
      } else {
        if (widget.hidden) {
          revealCard();
        } else {
          showCardDetails(widget.card!, widget.cardFace!);
        }
      }
    },
    child: Container(
      margin: EdgeInsets.all(14.0),
      child: (widget.facePosition != 0) ?
        Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationX(3.14),
          child: _buildCardContent(),
        ) : _buildCardContent(),
    ),
  );
}

Widget _buildCardContent() {
  return Container(
    decoration: BoxDecoration(
      // Use backgroundImage property for setting the background image
      image: widget.backgroundImage,
      border: Border.all(color: Style.itemColor),
      borderRadius: BorderRadius.circular(10.0),
    ),
    // Your other widget content here
  );
}


}
