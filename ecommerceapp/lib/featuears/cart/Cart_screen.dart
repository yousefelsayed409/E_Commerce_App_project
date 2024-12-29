import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceapp/core/helper/Shared/Local_NetWork.dart';
import 'package:ecommerceapp/core/localization/localization.dart';
import 'package:ecommerceapp/featuears/Favorite/presentation/manger/favorite_cubit/favorite_cubit.dart';
import 'package:ecommerceapp/featuears/cart/manger/cart_cubit/cart_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:redacted/redacted.dart';
import '../../core/widgets/empty_screen.dart';
import '../../core/widgets/snakbar_widget.dart';
import 'widget/Cart_Chek_out.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
    @override

  void initState() {
    super.initState();
    final cartCubit = context.read<CartCubit>();
    cartCubit.getCarts();
    
  }
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<CartCubit>(context);
    final cubitfavorite = BlocProvider.of<FavoriteCubit>(context);

    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        if (state is AddOrRemoveItemFromCartsSuccessState) {
          // Optional: Additional actions
        }
      },
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: const CheckoutCard(),
          appBar: buildAppBar(context),
          body: Padding(
            padding: EdgeInsets.all(10.h),
            child: Column(
              children: [
                Expanded(
                  child: cubit.carts.isNotEmpty
                      ? ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          itemCount: cubit.carts.length,
                          separatorBuilder: (context, index) {
                            return SizedBox(height: 13.h);
                          },
                          itemBuilder: (context, index) {
                            return SwipeActionCell(
                              key: ValueKey(cubit.carts[index].id),
                              trailingActions: [
                                SwipeAction(
                                  title: "Delete",
                                  onTap: (CompletionHandler handler) async {
                                    await handler(true);
                                    cubit.addOrRemoveFromCart(
                                      id: cubit.carts[index].id.toString(),
                                    ).then((_) {
                                      showsnakbarwidget(
                                        context,
                                        'Successfully Removed',
                                        true,
                                      );
                                    });
                                  },
                                  color: Colors.red,
                                ),
                              ],
                              child: Container(
                                padding: EdgeInsets.all(10.h),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25.h),
                                ),
                                child: Row(
                                  children: [
                                    CachedNetworkImage(
            height: 100.h,
            width: 100.w,
            imageUrl:cubit.carts[index].image!,
            fit: BoxFit.fill,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                const Center(child: CupertinoActivityIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ).redacted(
  context: context,
  redact: true,
  configuration: RedactedConfiguration(
    animationDuration : const Duration(milliseconds: 800), //default
  ),
),
                                    // Image.network(
                                    //   cubit.carts[index].image!,
                                    //   height: 100,
                                    //   width: 100,
                                    //   fit: BoxFit.fill,
                                    // ),
                                    SizedBox(width: 20.w),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            cubit.carts[index].name!,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(height: 7.h),
                                          Row(
                                            children: [
                                              Text(
                                                '  ${cubit.carts[index].price!} \$',
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold),
                                              ),
                                              SizedBox(width: 7.h),
                                              if (cubit.carts[index].price !=
                                                  cubit.carts[index].oldPrice)
                                                Text(
                                                  '${cubit.carts[index].oldPrice!}',
                                                  style: const TextStyle(
                                                      decoration: TextDecoration
                                                          .lineThrough),
                                                ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              OutlinedButton(
                                                onPressed: () {
                                                  cubitfavorite.AddOrRemoveFromFavorites(
                                                      productId: cubit
                                                          .carts[index].id
                                                          .toString());
                                                  showsnakbarwidget(
                                                      context,
                                                      'Successfully add To Favorite',
                                                      true);
                                                },
                                                child: Icon(
                                                  Icons.favorite,
                                                  color:  
                                        
                                                  cubitfavorite.FavoriteId.contains(
                                                          cubit.carts[index].id
                                                              .toString())
                                                      ? Colors.red
                                                      : Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        )
                      :  BagEmptyWidget(
                          titleonetow: 'Your Cart is empty'.tr(context),
                          imagePath: 'assets/images/shopping_cart.png',
                          titleone: 'oops'.tr(context),
                          SubTitle:
                              'Look Like Your Cart Is Empty  Add SomeThing Now'.tr(context),
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Colors.teal,
    elevation: 5,
    centerTitle: true,
    title:  Text(
      "Your Cart".tr(context),
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.normal),
    ),
  );
}
