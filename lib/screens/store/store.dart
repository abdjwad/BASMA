import 'dart:io';
import 'package:basma/components/palette.dart';
import 'package:basma/models/Product.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:like_button/like_button.dart';
import 'ProductDetails.dart';
import 'componants/CartScreen.dart';
import 'componants/MyProductsScreen.dart';

class ProductGridScreen extends StatefulWidget {
  const ProductGridScreen({super.key});

  @override
  State<ProductGridScreen> createState() => _ProductGridScreenState();
}

class _ProductGridScreenState extends State<ProductGridScreen> {
  final List<ProductStor> products = List.generate(
    8,
    (index) => ProductStor(
      likeCount: 200,
      name: 'Product $index',
      price: (index + 1) * 10.0,
      image: 'assets/images/photo_2_2024-06-01_13-09-41.jpg',
      isAsset: true,
      description: 'sdddddddddddddddddddddddddddddddddddddddd',
      phone: 09213428,
      location: 'sfdaas',
      colors: [],
    ),
  );
  final List<ProductStor> cartItems = [];
  final List<ProductStor> myProducts = [];

  final picker = ImagePicker();

  Future<void> addNewProduct(BuildContext context) async {
    TextEditingController nameController = TextEditingController();
    TextEditingController priceController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    TextEditingController locationController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    File? imageFile;

    await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Product Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  controller: priceController,
                  decoration: InputDecoration(
                    labelText: 'Price',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  controller: locationController,
                  decoration: InputDecoration(
                    labelText: 'location',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    labelText: 'Phone',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                    labelText: 'description',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async {
                    final pickedFile =
                        await picker.pickImage(source: ImageSource.gallery);
                    if (pickedFile != null) {
                      setState(() {
                        imageFile = File(pickedFile.path);
                      });
                    }
                  },
                  child: Text('Gallery'),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    if (nameController.text.isNotEmpty &&
                        priceController.text.isNotEmpty &&
                        imageFile != null) {
                      setState(() {
                        myProducts.add(
                          ProductStor(
                            name: nameController.text,
                            price: double.parse(priceController.text),
                            image: imageFile!.path,
                            likeCount: 0,
                            isAsset: false,
                            description: 'Product description',
                            phone: 123456789,
                            location: 'Product location',
                            colors: [],
                          ),
                        );
                        products.add(
                          ProductStor(
                            name: nameController.text,
                            price: double.parse(priceController.text),
                            image: imageFile!.path,
                            likeCount: 22,
                            isAsset: false,
                            description: descriptionController.text,
                            location: descriptionController.text,
                            phone: 09888,
                            colors: [],
                          ),
                        );
                      });
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text('Add Product'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  int page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Palette.activeColor,
          items: const <Widget>[
            Icon(
              Icons.list,
              size: 30,
            ),
            Icon(Icons.add, size: 30),
            Icon(Icons.compare_arrows, size: 30),
          ],
          onTap: (index) {
            setState(() {
              page = index;
            });
            if (index == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      MyProductsScreen(myProducts: myProducts),
                ),
              );
            } else if (index == 1) {
              addNewProduct(context);
            }
          }),
      appBar: AppBar(
        backgroundColor: Palette.activeColor,
        title: Text('My products'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CartScreen(cartItems: cartItems),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
            childAspectRatio: 3 / 4,
          ),
          itemBuilder: (context, index) {
            return ProductCard(
              productStor: products[index],
              onAddToCart: (product) {
                setState(() {
                  cartItems.add(product);
                });
              },
            );
          },
        ),
      ),
    );
  }
}

class ProductCard extends StatefulWidget {
  const ProductCard({
    super.key,
    required this.productStor,
    required this.onAddToCart,
  });

  final ProductStor productStor;
  final Function(ProductStor) onAddToCart;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(
              productStor: widget.productStor,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(4),
        width: double.infinity,
        height: 250,
        decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Container(
              width: 170,
              height: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: widget.productStor.isAsset
                      ? AssetImage(widget.productStor.image)
                      : FileImage(File(widget.productStor.image))
                          as ImageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 2),
            Text('${widget.productStor.price} S.P'),
            LikeButton(
              circleColor: CircleColor(
                start: Color(0xff00ddff),
                end: Color(0xff0099cc),
              ),
              likeBuilder: (bool isLiked) {
                return Icon(
                  Icons.add_circle_outline_sharp,
                  color: isLiked ? Colors.deepPurpleAccent : Colors.grey,
                  size: 25,
                );
              },
              onTap: (isLiked) async {
                widget.onAddToCart(widget.productStor);
                return !isLiked;
              },
            ),
            const SizedBox(height: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                LikeButton(
                  circleColor: CircleColor(
                      start: Color(0xff00ddff), end: Color(0xff0099cc)),
                  likeBuilder: (bool isLiked) {
                    return Icon(
                      Icons.favorite,
                      color: isLiked ? Colors.deepPurpleAccent : Colors.grey,
                      size: 20,
                    );
                  },
                  likeCount: widget.productStor.likeCount,
                ),
                LikeButton(
                  circleColor: const CircleColor(
                      start: Color(0xff00ddff), end: Color(0xff0099cc)),
                  likeBuilder: (bool isLiked) {
                    return Icon(
                      Icons.clean_hands_outlined,
                      color: isLiked ? Colors.deepPurpleAccent : Colors.grey,
                      size: 20,
                    );
                  },
                  likeCount: widget.productStor.likeCount,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
