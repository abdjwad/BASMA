import 'package:basma/screens/graduation/componants/myOrder.dart';
import 'package:flutter/material.dart';
import 'package:basma/screens/graduation/componants/detilsGradu.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'componants/ProductItemScreen.dart';

class Graduation extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      'name': 'Introduction to Mathematics',
      'description': 'This course provides a comprehensive introduction to various mathematical concepts and theories.',
      'price': '\$50',
      'image': 'assets/images/photo_2_2024-06-01_13-09-41.jpg',
      'time': '2 hours',
      'author': 'Professor',
      // Likes as a string
      'ingredients': ['Mathematical Concepts', 'Theories', 'Practice Problems'].map((e) => e.toString()).toList(),
      'steps': ['Step 1: Learn basic arithmetic', 'Step 2: Understand algebraic concepts', 'Step 3: Solve advanced calculus problems'],
    },
  {
      'name': 'Introduction to Mathematics',
      'description': 'This course provides a comprehensive introduction to various mathematical concepts and theories.',
      'price': '\$50',
      'image': 'assets/images/photo_2_2024-06-01_13-09-41.jpg',
      'time': '2 hours',
      'author': 'Professor',
      // Likes as a string
      'ingredients': ['Mathematical Concepts', 'Theories', 'Practice Problems'].map((e) => e.toString()).toList(),
      'steps': ['Step 1: Learn basic arithmetic', 'Step 2: Understand algebraic concepts', 'Step 3: Solve advanced calculus problems'],
    },
  {
      'name': 'Introduction to Mathematics',
      'description': 'This course provides a comprehensive introduction to various mathematical concepts and theories.',
      'price': '\$50',
      'image': 'assets/images/photo_2_2024-06-01_13-09-41.jpg',
      'time': '2 hours',
      'author': 'Professor',
      // Likes as a string
      'ingredients': ['Mathematical Concepts', 'Theories', 'Practice Problems'].map((e) => e.toString()).toList(),
      'steps': ['Step 1: Learn basic arithmetic', 'Step 2: Understand algebraic concepts', 'Step 3: Solve advanced calculus problems'],
    },

   ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15.0),
        child: GNav(
            rippleColor: Colors.grey,
            hoverColor: Colors.grey,
            haptic: true,
            tabBorderRadius: 20,
            tabActiveBorder: Border.all(color: Colors.black, width: 1),
            tabBorder: Border.all(color: Colors.blue, width: 1),
            tabShadow: [
              BoxShadow(
                  color: Color(0xFF98c242).withOpacity(0.3), blurRadius: 15)
            ],
            curve: Curves.easeOutExpo,
            duration: Duration(milliseconds: 600),
            gap: 8,
            activeColor: Color(0xFF020F86),
            iconSize: 20,

            // selected tab background color
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            // navigation bar padding
            tabs: [
              GButton(
                onPressed: () {

                },
                icon: Icons.devices_other,
                text: 'Other requests',
              ),

              GButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MyOrders()));

                },
                icon: Icons.menu,
                text: 'My requests',
              )
            ]),
      ),
      appBar: AppBar(
        title: Text('Educational Products'),
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
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Container(
            width: 200,
            child: Card(
              margin: EdgeInsets.symmetric(vertical: 10),
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: ListTile(
                leading: IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ProductItemScreen(product: product,)));
                  },
                  icon: Icon(Icons.menu_book_sharp),
                  color: Color(0xFF98c242),
                ),
                title: Text(
                  product['name']!,
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
                      product['description']!,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Price: ${product['price']!}',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  // Handle product tap
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Tapped on ${product['name']}')),
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
