import 'dart:io';
import 'package:flutter/material.dart';
import '../../../models/Product.dart';
import '../ProductDetails.dart';

class MyProductsScreen extends StatelessWidget {
  final List<ProductStor> myProducts;

  const MyProductsScreen({super.key, required this.myProducts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Products'),
      ),
      body: ListView.builder(
        itemCount: myProducts.length,
        itemBuilder: (context, index) {
          final product = myProducts[index];

          return Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: product.isAsset
                    ? Image.asset(product.image, width: 50, height: 50, fit: BoxFit.cover)
                    : Image.file(File(product.image), width: 50, height: 50, fit: BoxFit.cover),
              ),
              title: Text(product.name, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('Price: ${product.price} S.P'),
              trailing: IconButton(
                icon: Icon(Icons.info, color: Colors.blue),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailsScreen(productStor: product),
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
