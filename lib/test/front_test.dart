import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Complex UI Example',
      home: FrontTestPage(),
    ),
  );
}

class FrontTestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Complex UI Example'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildHeader(),
            _buildCardWithTitle('Card 1', 'This is the content of Card 1.'),
            _buildCardWithTitle('Card 2', 'This is the content of Card 2.'),
            _buildCardWithTitle('Card 3', 'This is the content of Card 3.'),
            // Add more cards or UI elements as needed
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: Colors.blue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome to My App',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            'Explore the features below:',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardWithTitle(String title, String content) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Column(
        children: [
          ListTile(
            title: Text(
              title,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(content),
          ),
          // Add more widgets inside the card as needed
        ],
      ),
    );
  }
}
