import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceapp/core/widgets/snakbar_widget.dart';
import 'package:ecommerceapp/featuears/Favorite/presentation/manger/favorite_cubit/favorite_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/models/product_model.dart';
import '../../../../../core/utils/app_styles.dart';

// ignore: must_be_immutable
class Customcard extends StatelessWidget {
  Customcard({
    this.ontap,
    required this.model,
    super.key,
    required this.cubit,
  });

  ProductModel model;
  final Function? ontap;
  final FavoriteCubit  cubit;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              blurRadius: 50,
              color: Colors.black.withOpacity(0),
              spreadRadius: 20,
              offset: const Offset(20, 20),
            ),
          ]),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.h),
            ),
            elevation: 10,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  Text(model.name!,
                      style: AppStyles.textStyle16
                          .copyWith(overflow: TextOverflow.ellipsis)),
                  SizedBox(
                    height: 3.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Text(
                              "${model.price!}\$",
                              style: TextStyle(fontSize: 14.sp),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        child: Icon(
                          Icons.favorite,
                          size: 30,
                          color: cubit.FavoriteId.contains(model.id.toString())
                              ? Colors.red
                              : Colors.black,
                        ),
                        onTap: () {
                          // Add | remove product favorites
                          cubit.AddOrRemoveFromFavorites(
                              productId: model.id.toString());
                              showsnakbarwidget(
                        context, 'Success', true);
                        },
                      )
                    ],
                  ),
                  Text(
                    "${model.oldPrice!} \$",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13.sp,
                        decoration: TextDecoration.lineThrough),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: 0,
          // top: -40,
          bottom: 95.h,
          // top: -1,
          child: CachedNetworkImage(
            height: 110.h,
            width: 110.w,
            imageUrl: '${model.image}',
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                const Center(child: CupertinoActivityIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          
        )
      ],
    );
  }
}
