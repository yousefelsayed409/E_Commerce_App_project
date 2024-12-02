// import 'package:flutter/material.dart';
// import 'package:test/core/models/product_model.dart';



// class CustomCard extends StatelessWidget {
//   CustomCard({
//     this.ontap,
//     required this.product,
//     Key? key,
//   }) : super(key: key);

//   ProductModel product;
//   final Function? ontap;

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       clipBehavior: Clip.none,
//       children: [
//         Container(
//           decoration: BoxDecoration(boxShadow: [
//             BoxShadow(
//               blurRadius: 50,
//               color: Colors.grey.withOpacity(.1),
//               spreadRadius: 20,
//               offset: const Offset(10, 10),
//             ),
//           ]),
//           child: Card(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(12),
//             ),
//             elevation: 10,
//             child: Padding(
//               padding:
//                   const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     product.name.toString(),
//                     style: const TextStyle(
//                       color: Colors.grey,
//                       fontSize: 16,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 3,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         r'$' '${product.price}',
//                         style: const TextStyle(
//                           fontSize: 16,
//                         ),
//                       ),
//                       const Icon(
//                         Icons.favorite,
//                         color: Colors.red,
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//         Positioned(
//           right: 20,
//           top: -60,
//           child: Image.network(
//             product.image!,
//             height: 100,
//             width: 100,
//           ),
//         )
//       ],
//     );
//   }
// }
 
// // class foorm extends StatelessWidget {
// //    foorm({this.onTap , required this.ppprouduct ,super.key});
// //   AllProductModels ppprouduct ;
// //   void Function()? onTap;

// //   @override
// //   Widget build(BuildContext context) {
// //     return InkWell(
// //       onTap: onTap ,
// //       child: Container(),
// //     ) ;
// //   }
// // }