import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:etarot/model/Card.dart';

class CardService {
  final CollectionReference cardsCollection =
      FirebaseFirestore.instance.collection('cards');

  Future<List<TarotCard>> getAllCards() async {
    try {
      QuerySnapshot querySnapshot = await cardsCollection.get();
      return querySnapshot.docs.map((doc) {
        return TarotCard.fromJson(doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
    } catch (e) {
      print('Error getting all cards: $e');
      return [];
    }
  }
}
