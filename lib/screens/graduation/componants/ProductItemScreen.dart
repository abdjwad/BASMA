import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:provider/provider.dart';

import '../../../provider/order_provider.dart';
import 'myOrder.dart';

class ProductItemScreen extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductItemScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                child: Image.asset(product['image'] ?? "assets/imges/Food Picture.png"),
              ),
              buttonArrow(context),
              scroll(context),
            ],
          ),
        ));
  }

  Widget buttonArrow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          clipBehavior: Clip.hardEdge,
          height: 55,
          width: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget scroll(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 0.6,
        maxChildSize: 1.0,
        minChildSize: 0.6,
        builder: (context, scrollController) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20)),
            ),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 5,
                          width: 35,
                          color: Colors.black12,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    product['name']!,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    product['time'] ?? "لا احد",

                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 25,
                        backgroundImage:
                        AssetImage("assets/images/photo_2_2024-06-01_13-09-41.jpg"),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        product['author'] ?? "Elena Shelby",

                      ),
                      const Spacer(),
                      LikeButton(
                        size: 30,
                        circleColor: const CircleColor(
                            start: Color(0xD8A61392), end: Color(0xff0099cc)),
                        likeBuilder: (bool isLiked) {
                          return Icon(
                            Icons.favorite,
                            color: isLiked ?Color(0xD8A61392): Colors.grey.shade600,
                            size: 30,
                          );
                        },



                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "${product['likes'] ?? 273} Likes",

                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Divider(
                      height: 4,
                    ),
                  ),
                  Text(
                    "Description",

                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    product['description']!,

                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Divider(
                      height: 4,
                    ),
                  ),
                  Text(
                    "Ingredients",

                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: product['ingredients'].length,
                    itemBuilder: (context, index) => ingredients(context, product['ingredients'][index]),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Divider(
                      height: 4,
                    ),
                  ),
                  Text(
                    "Steps",

                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: product['steps'].length,
                    itemBuilder: (context, index) => steps(context, index, product['steps'][index]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Provider.of<OrderProvider>(context, listen: false)
                          .addOrder(product.cast<String, String>());
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
        });
  }

  Widget ingredients(BuildContext context, String ingredient) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 10,
            backgroundColor: Color(0xFFE3FFF8),
            child: Icon(
              Icons.done,
              size: 15,
              color: Colors.green,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            ingredient,

          ),
        ],
      ),
    );
  }

  Widget steps(BuildContext context, int index, String step) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            backgroundColor: Colors.black,
            radius: 12,
            child: Text("${index + 1}"),
          ),
          Column(
            children: [
              SizedBox(
                width: 270,
                child: Text(
                  step,
                  maxLines: 3,

                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Image.asset(
                "assets/images/photo_2_2024-06-01_13-09-41.jpg",
                height: 155,
                width: 270,
              )
            ],
          )
        ],
      ),
    );
  }
}
