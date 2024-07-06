import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../provider/order_provider.dart';
import 'myOrder.dart';

class DetailsGraduation extends StatelessWidget {
  final Map<String, String> product;

  DetailsGraduation({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
        backgroundColor: Color(0xFF98c242),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                "assets/images/product_image.jpg",
                height: 200,
              ),
            ),
            SizedBox(height: 20),
            Text(
              product['name']!,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Description: ${product['description']!}',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Price: ${product['price']!}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Provider.of<OrderProvider>(context, listen: false).addOrder(product);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyOrders(),
                  ),
                );
              },
              child: Text('Add to Shopping List'),
            ),
          ],
        ),
      ),
    );
  }
}
