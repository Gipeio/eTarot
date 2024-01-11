import 'package:etarot/model/Card.dart';
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
          return GestureDetector(
            onTap: () {
              // Add your functionality here when the rectangle is clicked
              print('Rectangle ${index + 1} clicked!');
            },
            child: Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(8.0),
              ),
              // You can customize the content of each rectangle here
            ),
          );
        }),
      ),
    );
  }
}
