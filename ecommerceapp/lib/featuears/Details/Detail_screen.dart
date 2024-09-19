// ignore_for_file: deprecated_member_use

import 'package:ecommerceapp/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/models/product_model.dart';
import '../../core/utils/app_color.dart';
import '../../core/widgets/defult_button.dart';
import '../../core/widgets/snakbar_widget.dart';
import '../Layout/Layout_cubit.dart/cubit/layout_cubit.dart';
import 'components/Top_rounded_container.dart';
import 'components/cart_counter.dart';
import 'components/custom_Appbar.dart';
import 'components/product_descroption.dart';
import 'components/product_title_with_image.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    super.key,
    required this.ppprouduct,
  });

  final ProductModel ppprouduct;

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<LayoutCubit>(context);

    return Scaffold(
      // bottomNavigationBar: ,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: const CustomAppBar(),
      ),
      body: ListView(
        children: [
          productimage(ppprouduct: ppprouduct),
          TopRoundedContainer(
            color: AppColors.white,
            child: Column(
              children: [
                ProductDescription(
                  product: ppprouduct,
                  pressOnSeeMore: () {},
                ),
                TopRoundedContainer(
                  color: Colors.teal.withOpacity(0.3),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      const TextSpan(
                                          text: "Price \n",
                                          style:
                                              TextStyle(color: Colors.black)),
                                      TextSpan(
                                        text: "\$${ppprouduct.price}",
                                        style: AppStyles.textStyle24
                                        //  Theme.of(context)
                                        //     .textTheme,
                                        //     .headlineSmall!
                                            .copyWith(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold 
                                                ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const CartCounter(),
                          ],
                        ),
                      ),
                      TopRoundedContainer(
                        color: Colors.red.withOpacity(0.0),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 20,
                            right: 20,
                            bottom: (40),
                            top: (15),
                          ),
                          child: DefaultButton(
                            text: "Add To Cart",
                            press: () {
                              cubit.addOrRemoveFromCart(
                                  id: ppprouduct.id.toString());
                              showsnakbarwidget(
                                  context, 'Successfully add product', true);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
 








  // Padding(
  //               padding: const EdgeInsets.all(20),
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   Text(
  //                     '',
  //                     // ppprouduct.title.substring(0, 15),
  //                     style: TextStyle(
  //                         fontWeight: FontWeight.bold, fontSize: 18),
  //                   ),
  //                   // CartCounter(),
  //                 ],
  //               ),
  //             ),
  //             Padding(
  //               padding: const EdgeInsets.symmetric(horizontal: 16),
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   const Ratingg(),
  //                   RichText(
  //                     text: TextSpan(
  //                       children: [
  //                         TextSpan(
  //                             text: "Price\n",
  //                             style: TextStyle(color: Colors.black)),
  //                         TextSpan(
  //                           text: "\$${ppprouduct.price}",
  //                           style: Theme.of(context)
  //                               .textTheme
  //                               .headlineSmall!
  //                               .copyWith(
  //                                   color: Colors.black,
  //                                   fontWeight: FontWeight.bold),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             Column(
  //               children: [
  //                 Description(ppproduct: ppprouduct),
  //                 ColorAndSize(ppprouduct: ppprouduct),
  //                 AddToCart(ppproduct: ppprouduct),
  //               ],
  //             )
  //             SizedBox(
  //               height: 15,
  //             ),