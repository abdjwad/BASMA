import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../models/Product.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [
    Product(
      id: 1,
      images: [
        "assets/images/photo_1_2024-06-01_13-54-09.jpg",
        "assets/images/photo_1_2024-06-01_13-54-09.jpg",
        "assets/images/photo_1_2024-06-01_13-54-09.jpg",
        "assets/images/photo_1_2024-06-01_13-54-09.jpg",
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      title: "Wireless Controller for PS4™",
      price: 64.99,
      description: description,
      rating: 4.8,
      isFavourite: true,
      isPopular: true,
    ),
    Product(
      id: 2,
      images: [
        "assets/images/photo_1_2024-06-01_13-54-09.jpg",
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      title: "Nike Sport White - Man Pant",
      price: 50.5,
      description: description,
      rating: 4.1,
      isPopular: true,
    ),
  ];

  List<Product> get products => _products;

  void toggleFavourite(int index) {
  //  _products[index].isFavourite = !_products[index].isFavourite;
    notifyListeners();
  }
}
