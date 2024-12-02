import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceapp/core/widgets/snakbar_widget.dart';
import 'package:ecommerceapp/featuears/Favorite/presentation/manger/favorite_cubit/favorite_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import '../../../../core/widgets/empty_screen.dart';
import 'widget/appbar.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<FavoriteCubit>(context);
    return BlocConsumer<FavoriteCubit, FavoriteState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: buildAppBarfav(context),
          body: Padding(
            padding: EdgeInsets.all(8.0.h),
            child: Column(
              children: [
                Expanded(
                  child: cubit.favorites.isNotEmpty
                      ? ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: cubit.favorites.length,
                          itemBuilder: (context, index) {
                            return SwipeActionCell(
                              key: ValueKey(cubit.favorites[index].id),
                              trailingActions: [
                                SwipeAction(
                                  title: "Remove",
                                  onTap: (CompletionHandler handler) async {
                                    await handler(true);
                                    cubit.AddOrRemoveFromFavorites(
                                        productId: cubit.favorites[index].id!
                                            .toString());
                                    showsnakbarwidget(context,
                                        'Successfully removed', true);
                                  },
                                  color: Colors.red,
                                ),
                              ],
                              child: Container(
                                margin: EdgeInsets.all(10.h),
                                padding: EdgeInsets.all(10.h),
                                color: Colors.white.withOpacity(0.5),
                                child: Row(
                                  children: [ 
                                    CachedNetworkImage(
            height: 100.h,
            width: 100.w,
            imageUrl: cubit.favorites[index].image!,
            fit: BoxFit.fill,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                const Center(child: CupertinoActivityIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            cubit.favorites[index].name!,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(
                                            height: 7.h,
                                          ),
                                          Text(
                                              '${cubit.favorites[index].price!} \$'),
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
                          titleonetow: 'Your Favorite is empty',
                          imagePath: 'assets/images/shopping_cart.png',
                          titleone: 'oops',
                          SubTitle:
                              'Look Like Your Favorite Is Empty  Add SomeThing Now',
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
