// import 'dart:io';
//
// import 'package:flutter/material.dart';
//
// import '../../../../models/Product.dart';
// import '../../../components/palette.dart';
//
// class ProductImages extends StatefulWidget {
//   const ProductImages({
//     Key? key, required this.productStor,
//   }) : super(key: key);
//
//   final ProductStor productStor;
//
//   @override
//   _ProductImagesState createState() => _ProductImagesState();
// }
//
// class _ProductImagesState extends State<ProductImages> {
//   int selectedImage = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SizedBox(height: 20),
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
//
//       ],cover
//     );
//   }
// }
//
