import 'package:etarot/services/card_face_service.dart';
import 'package:flutter/material.dart';
import 'package:etarot/model/CardFace.dart';

class CardFaceServiceTest extends StatefulWidget {
  @override
  _CardFacePageState createState() => _CardFacePageState();
}

class _CardFacePageState extends State<CardFaceServiceTest> {
  final TextEditingController cardFaceIdController = TextEditingController();
  final CardFaceService cardFaceService = CardFaceService();
  String displayedAttribute = '';

  Future<void> readCardFace() async {
    String cardFaceId = cardFaceIdController.text.trim();
    if (cardFaceId.isNotEmpty) {
      CardFace? cardFace = await cardFaceService.getCardFace(cardFaceId);
      if (cardFace != null) {
        setState(() {
          displayedAttribute = cardFace.meaning;
        });
      } else {
        setState(() {
          displayedAttribute = 'Card face not found';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Face Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: cardFaceIdController,
              decoration: InputDecoration(labelText: 'Enter Card Face ID'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: readCardFace,
              child: Text('Read Card Face'),
            ),
            SizedBox(height: 16.0),
            Text(
              'Displayed Attribute: $displayedAttribute',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CardFaceServiceTest(),
  ));
}
