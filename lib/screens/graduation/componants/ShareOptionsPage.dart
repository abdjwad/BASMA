import 'package:flutter/material.dart';

class ShareOptionsPage extends StatelessWidget {
  final Map<String, dynamic> order;

  const ShareOptionsPage({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Share Options'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(

            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Add your logic to share as PDF
                    },
                    child: Text('Share as PDF'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Add your logic to share as Video
                    },
                    child: Text('Share as Video'),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Add your logic to mark the order as completed
                      Navigator.pop(context, true);
                    },
                    child: Text('Mark as Completed'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
