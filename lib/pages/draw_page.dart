import 'package:etarot/model/Card.dart';
import 'package:etarot/objects/draw_emplacement_object.dart';
import 'package:etarot/styling/style.dart';
import 'package:flutter/material.dart';
import 'package:etarot/services/card_service.dart';

class DrawPage extends StatefulWidget {
  @override
  _DrawPageState createState() => _DrawPageState();
}

class _DrawPageState extends State<DrawPage> {
  @override
  void initState() {
    super.initState();
    loadAndPrintCards();
  }

  Future<void> loadAndPrintCards() async {
    CardService cardService = CardService();
    List<TarotCard> cards = await cardService.getAllCards();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.backgroundColor,
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(4, (index) {
          return DrawEmplacementObject(index: index);
        }),
      ),
    );
  }
}
