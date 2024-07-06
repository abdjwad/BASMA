import 'package:flutter/material.dart';
class ProductStor {
  final String name;
  final String location;
  final String description;
  final double price;
  final int likeCount;
  final int phone;
  final List<Color> colors;

  final String image;
  final bool isAsset;


  ProductStor( {
    required this.phone,
    required this.likeCount,
    required this.name,
    required this.location,
    required this.description,
    required this.price,
    required this.image,
    required this.colors,

    required this.isAsset,
  });
}
class Cart {
  final List<ProductStor> items;

  Cart({required this.items});

  void addProduct(ProductStor product) {
    items.add(product);
  }

  void removeProduct(ProductStor product) {
    items.remove(product);
  }

  double get totalPrice {
    return items.fold(0, (total, current) => total + current.price);
  }
}


class Product {
  final int id;
  final String title, description;
  final List<String> images;
  final List<Color> colors;
  final double rating, price;
  final bool isFavourite, isPopular;


  Product({
    required this.id,
    required this.images,
    required this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    required this.title,
    required this.price,
    required this.description,
  });
}

// Our demo Products

List<Product> demoProducts = [
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
  Product(
    id: 3,
    images: [
      "assets/images/photo_1_2024-06-01_13-54-09.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Gloves XC Omega - Polygon",
    price: 36.55,
    description: description,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 4,
    images: [
      "assets/images/photo_1_2024-06-01_13-54-09.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Logitech Head",
    price: 20.20,
    description: description,
    rating: 4.1,
    isFavourite: true,
  ),
];

const String description =
    "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";