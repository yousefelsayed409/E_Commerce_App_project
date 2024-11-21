import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import '../../core/widgets/empty_screen.dart';
import '../../core/widgets/snakbar_widget.dart';
import '../Layout/Layout_cubit.dart/cubit/layout_cubit.dart';
import '../Layout/Layout_cubit.dart/cubit/layout_state.dart';
import 'widget/Cart_Chek_out.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<LayoutCubit>(context);

    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {
        if (state is AddOrRemoveItemFromCartsSuccessState) {
          // Optional: Additional actions
        }
      },
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: CheckoutCard(),
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
                                    Image.network(
                                      cubit.carts[index].image!,
                                      height: 100,
                                      width: 100,
                                      fit: BoxFit.fill,
                                    ),
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
                                                  cubit.AddOrRemoveFromFavorites(
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
                                                  color: cubit.FavoriteId.contains(
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
                      : const BagEmptyWidget(
                          titleonetow: 'Your Cart is empty',
                          imagePath: 'assets/images/shopping_cart.png',
                          titleone: 'oops',
                          SubTitle:
                              'Look Like Your Cart Is Empty  Add SomeThing Now',
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
    title: const Text(
      "Your Cart",
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.normal),
    ),
  );
}