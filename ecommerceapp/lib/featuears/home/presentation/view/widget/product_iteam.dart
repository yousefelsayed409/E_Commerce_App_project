// import 'package:flutter/material.dart';

// import '../../../../Layout/Layout_cubit.dart/cubit/layout_cubit.dart';
// import '../../../../componants/App_Router.dart';
// import '../../../../models/product_model.dart';

// class productItem extends StatelessWidget {
//   _productItem(
//       // ignore: unused_element
//       {super.key,
//       required this.model,
//       required this.cubit,
//       this.onTap});
//   final ProductModel model;
//   final LayoutCubit cubit;
//   final Function()? onTap;
//   @override
//   Widget build(BuildContext context) {
//     // List<ProductModel>? proooducts;

//     return InkWell(
//       onTap: () {
//         Navigator.pushNamed(context, AppRoute.detailsScreen, arguments: model);
//       },
//       child: Stack(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(4),
//               color: Colors.grey.withOpacity(0.2),
//             ),
//             padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 12),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Expanded(
//                   child: Image.network(
//                     model.image!,
//                     fit: BoxFit.fill,
//                     width: double.infinity,
//                     height: double.infinity,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Text(
//                   model.name!,
//                   style: const TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16,
//                       overflow: TextOverflow.ellipsis),
//                 ),
//                 const SizedBox(
//                   height: 2,
//                 ),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: Row(
//                         children: [
//                           FittedBox(
//                               fit: BoxFit.scaleDown,
//                               child: Text(
//                                 "${model.price!} \$",
//                                 style: TextStyle(fontSize: 13),
//                               )),
//                           SizedBox(
//                             width: 5,
//                           ),
//                           FittedBox(
//                             // fit: BoxFit.scaleDown,
//                             child: Text(
//                               "${model.oldPrice!} \$",
//                               style: TextStyle(
//                                   color: Colors.grey,
//                                   fontSize: 12.5,
//                                   decoration: TextDecoration.lineThrough),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                     GestureDetector(
//                       child: Icon(
//                         Icons.favorite,
//                         size: 20,
//                         color: cubit.FavoriteId.contains(model.id.toString())
//                             ? Colors.red
//                             : Colors.grey,
//                       ),
//                       onTap: () {
//                         // Add | remove product favorites
//                         cubit.AddOrRemoveFromFavorites(
//                             productId: model.id.toString());
//                       },
//                     )
//                   ],
//                 )
//               ],
//             ),
//           ),
//           CircleAvatar(
//             // backgroundColor: Colors.black,
//             child: GestureDetector(
//               onTap: () {
//                 cubit.addOrRemoveFromCart(id: model.id.toString());
//               },
//               child: Icon(
//                 Icons.shopping_cart,
//                 color: cubit.CartsId.contains(model.id.toString())
//                     ? Colors.red
//                     : Colors.grey,
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
// // _productItem(
// //                               model: cubit.filteredProducts.isEmpty
// //                                   ? cubit.products[index]
// //                                   : cubit.filteredProducts[index],
// //                               cubit: cubit);

// // class _productItem({
  
// //   }) {
// //   final Function()? onTap;
// //   final  
// //   return InkWell(
// //     onTap: () {
// //       Navigator.pushNamed(context, routeName)
// //     },
// //     child: Stack(
// //       children: [
// //         Container(
// //           decoration: BoxDecoration(
// //             borderRadius: BorderRadius.circular(4),
// //             color: Colors.grey.withOpacity(0.2),
// //           ),
// //           padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 12),
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               Expanded(
// //                 child: Image.network(
// //                   model.image!,
// //                   fit: BoxFit.fill,
// //                   width: double.infinity,
// //                   height: double.infinity,
// //                 ),
// //               ),
// //               const SizedBox(
// //                 height: 10,
// //               ),
// //               Text(
// //                 model.name!,
// //                 style: const TextStyle(
// //                     fontWeight: FontWeight.bold,
// //                     fontSize: 16,
// //                     overflow: TextOverflow.ellipsis),
// //               ),
// //               const SizedBox(
// //                 height: 2,
// //               ),
// //               Row(
// //                 children: [
// //                   Expanded(
// //                     child: Row(
// //                       children: [
// //                         FittedBox(
// //                             fit: BoxFit.scaleDown,
// //                             child: Text(
// //                               "${model.price!} \$",
// //                               style: TextStyle(fontSize: 13),
// //                             )),
// //                         SizedBox(
// //                           width: 5,
// //                         ),
// //                         FittedBox(
// //                           // fit: BoxFit.scaleDown,
// //                           child: Text(
// //                             "${model.oldPrice!} \$",
// //                             style: TextStyle(
// //                                 color: Colors.grey,
// //                                 fontSize: 12.5,
// //                                 decoration: TextDecoration.lineThrough),
// //                           ),
// //                         )
// //                       ],
// //                     ),
// //                   ),
// //                   GestureDetector(
// //                     child: Icon(
// //                       Icons.favorite,
// //                       size: 20,
// //                       color: cubit.FavoriteId.contains(model.id.toString())
// //                           ? Colors.red
// //                           : Colors.grey,
// //                     ),
// //                     onTap: () {
// //                       // Add | remove product favorites
// //                       cubit.AddOrRemoveFromFavorites(
// //                           productId: model.id.toString());
// //                     },
// //                   )
// //                 ],
// //               )
// //             ],
// //           ),
// //         ),
// //         CircleAvatar(
// //           // backgroundColor: Colors.black,
// //           child: GestureDetector(
// //             onTap: () {
// //               cubit.addOrRemoveFromCart(id: model.id.toString());
// //             },
// //             child: Icon(
// //               Icons.shopping_cart,
// //               color: cubit.CartsId.contains(model.id.toString())
// //                   ? Colors.red
// //                   : Colors.grey,
// //             ),
// //           ),
// //         )
// //       ],
// //     ),
// //   );
// // }
