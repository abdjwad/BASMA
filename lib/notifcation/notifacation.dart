import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  final List<Map<String, String>> notifications = [
    {
      'title': 'New Message',
      'body': 'You have received a new message from John.',
      'time': '5 min ago'
    },
    {
      'title': 'App Update',
      'body': 'A new update is available for your app.',
      'time': '10 min ago'
    },
    {
      'title': 'Friend Request',
      'body': 'Alice has sent you a friend request.',
      'time': '15 min ago'
    },
    {
      'title': 'Reminder',
      'body': 'Don\'t forget to complete your task today.',
      'time': '30 min ago'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: CircleAvatar(
              backgroundImage: AssetImage(
                "assets/images/photo_2_2024-06-01_13-09-41.jpg",
              ),
            ),
          ),
        ],
        backgroundColor: Color(0xFF98c242),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return Container(
            width: 200,
            child: Card(

              margin: EdgeInsets.symmetric(vertical: 10),
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: ListTile(
                leading: Icon(
                  Icons.notifications,
                  color: Color(0xFF98c242),
                  size: 40,
                ),
                title: Text(
                  notification['title']!,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5),
                    Text(
                      notification['body']!,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      notification['time']!,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  // Handle notification tap
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Tapped on ${notification['title']}')),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
