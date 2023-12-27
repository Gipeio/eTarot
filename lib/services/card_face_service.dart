import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:etarot/model/CardFace.dart';

class CardFaceService {
  final CollectionReference cardFacesCollection =
      FirebaseFirestore.instance.collection('cardFaces');


  // READ
  Future<CardFace?> getCardFace(String cardFaceId) async {
    DocumentSnapshot documentSnapshot =
        await cardFacesCollection.doc(cardFaceId).get();

    if (documentSnapshot.exists) {
      return CardFace.fromJson(documentSnapshot.data() as Map<String, dynamic>, documentSnapshot.id);
    } else {
      return null;
    }
  }

}
