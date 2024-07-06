import 'package:basma/components/palette.dart';
import 'package:basma/screens/graduation/componants/ProductItemScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/order_provider.dart';

class CompletedOrdersPage extends StatelessWidget {
  const CompletedOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final completedOrders = Provider.of<OrderProvider>(context)
        .orders
        .where((order) => order['status'] == 'منجز')
        .toList();

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Palette.activeColor,
        title: Text('Completed Orders'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: completedOrders.length,
        itemBuilder: (context, index) {
          final order = completedOrders[index];
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
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              trailing: IconButton(
                icon: const Icon(Icons.info, color: Colors.blue),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProductItemScreen(product: order),
                    ),
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
