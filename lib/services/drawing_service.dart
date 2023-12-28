import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:etarot/model/Drawing.dart';

class DrawingService {
  final CollectionReference drawingsCollection =
      FirebaseFirestore.instance.collection('drawings');

  // CREATE
  Future<void> createDrawing(Drawing drawing) async {
    try {
      await drawingsCollection.add(drawing.toJson());
    } catch (e) {
      print('Error creating drawing: $e');
      throw e;
    }
  }

  // READ ALL
  Future<List<Drawing>> getAllDrawings() async {
    try {
      QuerySnapshot querySnapshot = await drawingsCollection.get();
      return querySnapshot.docs.map((doc) {
        return Drawing.fromJson(doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
    } catch (e) {
      print('Error getting all drawings: $e');
      throw e;
    }
  }

  // READ SPECIFIC
  Future<Drawing?> getDrawingById(String drawingId) async {
    try {
      DocumentSnapshot documentSnapshot =
          await drawingsCollection.doc(drawingId).get();
      if (documentSnapshot.exists) {
        return Drawing.fromJson(
            documentSnapshot.data() as Map<String, dynamic>, documentSnapshot.id);
      } else {
        return null;
      }
    } catch (e) {
      print('Error getting drawing by ID: $e');
      throw e;
    }
  }

  // DELETE
  Future<void> deleteDrawing(String drawingId) async {
    try {
      await drawingsCollection.doc(drawingId).delete();
    } catch (e) {
      print('Error deleting drawing: $e');
      throw e;
    }
  }
}
