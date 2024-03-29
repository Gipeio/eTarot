import 'package:etarot/model/Card.dart';
import 'package:etarot/widgets/button_widget.dart';
import 'package:etarot/widgets/draw_emplacement_widget.dart';
import 'package:etarot/services/card_service.dart';
import 'package:etarot/styling/style.dart';
import 'package:flutter/material.dart';

class DrawPage extends StatefulWidget {
  @override
  _DrawPageState createState() => _DrawPageState();
}

class _DrawPageState extends State<DrawPage> {
  late List<TarotCard> deck;

  @override
  void initState() {
    super.initState();
    deck = [];
    loadCards();
  }

  void _nullFunc() {
    print(deck.toString());
  }

  Future<void> loadCards() async {
    CardService cardService = CardService();
    List<TarotCard> loadedDeck = await cardService.getAllCards();
    
    setState(() {
      deck = loadedDeck;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.backgroundColor,
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.85,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.width / (2 * MediaQuery.of(context).size.height * 0.4),
              ),
              itemBuilder: (context, index) {
                return DrawEmplacementObject(
                  index: index,
                  deck: deck,
                );
              },
              itemCount: 4,
            ),
          ),
          CustomButtonObject(label: "Continue", onPressed: _nullFunc),
        ],
      ),
    );
  }
}
