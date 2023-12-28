import 'package:flutter/material.dart';
import 'package:etarot/model/Drawing.dart'; // Import your Drawing model
import 'package:etarot/services/drawing_service.dart';
class DrawingTestPage extends StatefulWidget {
  @override
  _DrawingTestPageState createState() => _DrawingTestPageState();
}

class _DrawingTestPageState extends State<DrawingTestPage> {
  DrawingService drawingService = DrawingService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawing Test Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                // Create a drawing with every id of faces (replace with actual face ids)
                Drawing newDrawing = Drawing(
                  id: 'PTVaGguFQXibWkvmNvv0 ', // replace with an actual drawing id
                  userId: 'user_id', // replace with an actual user id
                  drawingDate: DateTime.now(),
                  cardFaceIds: ['face_id_1', 'face_id_2'], // replace with actual face ids
                  objectiveNote: 5,
                  subjectiveNote: 3,
                );

                // Create the drawing
                await drawingService.createDrawing(newDrawing);
              },
              child: Text('Create Drawing'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                // Get all drawing ids
                List<Drawing> allDrawings = await drawingService.getAllDrawings();

                // Print the ids of all drawings
                for (Drawing drawing in allDrawings) {
                  print('Drawing ID: ${drawing.id}');
                }
              },
              child: Text('Get All Drawing IDs'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                // Specify a drawing id (replace with an actual drawing id)
                String specificDrawingId = 'LlMHJLO54mcgXOWurwhG';

                // Get the objective note of a specific drawing
                Drawing? specificDrawing =
                    await drawingService.getDrawingById(specificDrawingId);

                // Print the objective note of the specific drawing
                if (specificDrawing != null) {
                  print('Objective Note of $specificDrawingId: ${specificDrawing.objectiveNote}');
                } else {
                  print('Drawing with ID $specificDrawingId not found.');
                }
              },
              child: Text('Get Objective Note of Specific Drawing'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                // Specify a drawing id to delete (replace with an actual drawing id)
                String drawingIdToDelete = 'LlMHJLO54mcgXOWurwhG';

                // Delete the drawing
                await drawingService.deleteDrawing(drawingIdToDelete);
              },
              child: Text('Delete Drawing'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: DrawingTestPage(),
  ));
}
