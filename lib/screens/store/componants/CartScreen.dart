import 'dart:io';
import 'package:basma/components/palette.dart';
import 'package:flutter/material.dart';
import '../../../models/Product.dart';
import '../ProductDetails.dart';

class CartScreen extends StatefulWidget {
  final List<ProductStor> cartItems;

  const CartScreen({super.key, required this.cartItems});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final List<ProductStor> selectedItems = [];

  @override
  Widget build(BuildContext context) {
    double totalPrice = selectedItems.fold(0, (total, current) => total + current.price);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.activeColor,
        title: Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: widget.cartItems.length,
        itemBuilder: (context, index) {
          final product = widget.cartItems[index];
          bool isSelected = selectedItems.contains(product);

          return Dismissible(
            key: Key(product.name),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              setState(() {
                widget.cartItems.removeAt(index);
                selectedItems.remove(product);
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("${product.name} removed from cart")),
              );
            },
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
            child: Container(
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
                selected: isSelected,
                onTap: () {
                  setState(() {
                    if (isSelected) {
                      selectedItems.remove(product);
                    } else {
                      selectedItems.add(product);
                    }
                  });
                },
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Total Price: ${totalPrice} S.P', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Implement checkout functionality
              },
              child: Text('Checkout'),
            ),
          ],
        ),
      ),
    );
  }
}
