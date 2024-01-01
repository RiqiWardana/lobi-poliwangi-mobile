import 'package:flutter/material.dart';

class BeasiswaCard extends StatelessWidget {
  final String title;
  final String content;
  final String imagePath; // Add this field

  BeasiswaCard(
      {required this.title, required this.content, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Add Image Widget
            Image.network(
              imagePath,
              height: 50,
              width: 50,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              content,
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
