import 'dart:io';

import 'package:basma/components/palette.dart';
import 'package:basma/screens/store/componants/product_images.dart';
import 'package:basma/screens/store/componants/top_rounded_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../models/Product.dart';
import 'componants/color_dots.dart';
import 'componants/product_description.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductStor productStor;

  const ProductDetailsScreen({super.key, required this.productStor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Palette.activeColor,
        elevation: 2,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: EdgeInsets.zero,
              elevation: 0,
              backgroundColor: Colors.white,
            ),
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
              size: 20,
            ),
          ),
        ),
        actions: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 20),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: [
                    const Text(
                      "4.7",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: TopRoundedContainer(
        color: Colors.white,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: ElevatedButton(
              onPressed: () {
              //  Navigator.pushNamed(context, CartScreen.routeName);
              },
              child: const Text("Add To Cart"),
            ),
          ),
        ),
      ),
        body: ListView(
          children: [
            Container(
              width: 350,
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: productStor.isAsset
                      ? AssetImage(productStor.image)
                      : FileImage(File(productStor.image)) as ImageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            TopRoundedContainer(
              color: Colors.white,
              child: Column(
                children: [
                  ProductDescription(
                    productStor: productStor,
                    pressOnSeeMore: () {},
                  ),
                ],
              ),
            ),
          ],
        )
      // body: SingleChildScrollView(
      //   padding: EdgeInsets.only(top: 44),
      //   child: Center(
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: <Widget>[
      //         Container(
      //           width: 350,
      //           height: 300,
      //           decoration: BoxDecoration(
      //             image: DecorationImage(
      //               image: productStor.isAsset
      //                   ? AssetImage(productStor.image)
      //                   : FileImage(File(productStor.image)) as ImageProvider,
      //               fit: BoxFit.cover,
      //             ),
      //           ),
      //         ),
      //         SizedBox(height: 10),
      //         Column(
      //           children: [
      //
      //             Container(
      //
      //               decoration: BoxDecoration(color:Palette.activeColor,borderRadius: BorderRadius.circular(20)),
      //               child: Text(
      //                 productStor.name,
      //                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      //               ),
      //             ),
      //             Text(
      //               productStor.location,
      //               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      //             ),
      //             Text(
      //               'Price: \$${productStor.price}',
      //               style: TextStyle(fontSize: 16),
      //             ),
      //             Text(
      //               'Phone: ${productStor.phone}',
      //               style: TextStyle(fontSize: 16),
      //             ),
      //           ],
      //         ),
      //         Padding(
      //           padding: const EdgeInsets.all(8.0),
      //           child: Text(
      //            ' location:${productStor.description},',
      //             textAlign: TextAlign.center,
      //           ),
      //         ),
      //         SizedBox(
      //           height: 40,
      //         ),
      //
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
