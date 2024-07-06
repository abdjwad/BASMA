import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

import '../../../provider/order_provider.dart';
import 'CompletedOrdersPage.dart';
import 'ShareOptionsPage.dart';
 // Update with your actual path

class MyOrders extends StatelessWidget {
  const MyOrders({super.key});

  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<OrderProvider>(context).orders;

    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15.0),
        child: GNav(
          mainAxisAlignment: MainAxisAlignment.center,
          rippleColor: Colors.grey,
          hoverColor: Colors.grey,
          haptic: true,
          tabBorderRadius: 20,
          tabActiveBorder: Border.all(color: Colors.black, width: 1),
          tabBorder: Border.all(color: Colors.blue, width: 1),
          tabShadow: [
            BoxShadow(color: Color(0xFF98c242).withOpacity(0.3), blurRadius: 15)
          ],
          curve: Curves.easeOutExpo,
          duration: const Duration(milliseconds: 600),
          gap: 8,
          activeColor: Color(0xFF020F86),
          iconSize: 20,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          tabs: [
            GButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CompletedOrdersPage()),
                );
              },
              icon: Icons.real_estate_agent,
              text: 'CompletedOrders',
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('طلباتي'),
        backgroundColor: const Color(0xFF98c242),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 10),
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: ListTile(
              leading: Icon(Icons.shopping_bag),
              title: Text(
                order['name'],
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    order['description'],
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'الحالة: ${order['status']}',
                    style: TextStyle(
                      fontSize: 16,
                      color: order['status'] == 'منجز' ? Colors.green : Colors.orange,
                    ),
                  ),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.share, color: Colors.blue),
                    onPressed: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShareOptionsPage(order: order),
                        ),
                      );
                      if (result == true) {
                        Provider.of<OrderProvider>(context, listen: false).completeOrder(index);
                      }
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      Provider.of<OrderProvider>(context, listen: false).removeOrder(index);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
