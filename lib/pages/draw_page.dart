import 'package:etarot/model/Card.dart';
import 'package:etarot/objects/button_object.dart';
import 'package:etarot/objects/draw_emplacement_object.dart';
import 'package:etarot/services/card_service.dart';
import 'package:etarot/styling/style.dart';
import 'package:flutter/material.dart';

class DrawPage extends StatefulWidget {
  @override
  _DrawPageState createState() => _DrawPageState();
}

class _DrawPageState extends State<DrawPage> {
  @override
  void initState() {
    super.initState();
    loadCards();
  }

  void _nullFunc() {
    // Add functionality for button press here
  }

    Future<void> loadCards() async {
    CardService cardService = CardService();
    List<TarotCard> cards = await cardService.getAllCards();
    for (TarotCard card in cards){
      print(card.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.backgroundColor,
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.85, // Set a fixed height for GridView
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.width / (2 * MediaQuery.of(context).size.height * 0.4),
              ),
              itemBuilder: (context, index) {
                return DrawEmplacementObject(index: index);
              },
              itemCount: 4,
            ),
          ),
          CustomButtonObject(label: "aeazeaze", onPressed: _nullFunc),
        ],
      ),
    );
  }
}
