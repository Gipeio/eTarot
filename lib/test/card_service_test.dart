import 'package:etarot/services/card_service.dart';
import 'package:flutter/material.dart';
import 'package:etarot/model/Card.dart'; 

class CardTestPage extends StatefulWidget {
  @override
  _CardTestPageState createState() => _CardTestPageState();
}

class _CardTestPageState extends State<CardTestPage> {
  CardService cardService = CardService();
  List<TarotCard> allCards = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Test Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                // When the button is pressed, retrieve all cards
                List<TarotCard> cards = await cardService.getAllCards();

                // Update the state with the retrieved cards
                setState(() {
                  allCards = cards;
                });
              },
              child: Text('Get All Cards'),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: allCards.length,
                itemBuilder: (context, index) {
                  // Display card names in a ListView
                  return ListTile(
                    title: Text(allCards[index].name),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CardTestPage(),
  ));
}
