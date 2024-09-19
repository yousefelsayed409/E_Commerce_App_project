// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../../../core/models/product_model.dart';
// import '../../../core/widgets/defult_button.dart';
// import '../../Layout/Layout_cubit.dart/cubit/layout_cubit.dart';
// import 'cart_counter.dart';

// class SectionPriceDetailsPeoduct extends StatelessWidget {
//    SectionPriceDetailsPeoduct({super.key});
// ProductModel? ppprouduct ;
//   @override
//   Widget build(BuildContext context) {
//         final cubit = BlocProvider.of<LayoutCubit>(context);

//     return Column(
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 15.h),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Column(
//                               children: [
//                                 RichText(
//                                   text: TextSpan(
//                                     children: [
//                                       const TextSpan(
//                                           text: "Price \n",
//                                           style:
//                                               TextStyle(color: Colors.black)),
//                                       TextSpan(
//                                         text: "\$${ppprouduct?.price}",
//                                         style: Theme.of(context)
//                                             .textTheme
//                                             .headlineSmall!
//                                             .copyWith(
//                                                 color: Colors.black,
//                                                 fontWeight: FontWeight.bold),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                              CartCounter(initialQuantity: ,),
//                           ],
//                         ),
//                       ),
//                       DefaultButton(
//                         text: "Add To Cart",
//                         press: () {
//                           cubit.addOrRemoveFromCart(
//                               id: ppprouduct!.id.toString());
//                         },
//                       ),
//                     ],
//                   );
//   }
// }