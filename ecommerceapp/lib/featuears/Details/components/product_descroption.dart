import 'package:ecommerceapp/core/utils/app_styles.dart';
import 'package:ecommerceapp/core/widgets/snakbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/models/product_model.dart';
import '../../../core/utils/constants.dart';
import '../../Layout/Layout_cubit.dart/cubit/layout_cubit.dart';
import '../../Layout/Layout_cubit.dart/cubit/layout_state.dart';

class ProductDescription extends StatefulWidget {
  const ProductDescription({
    Key? key,
    required this.product,
    this.pressOnSeeMore,
  }) : super(key: key);

  final ProductModel product;
  final GestureTapCallback? pressOnSeeMore;

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  bool isShowMore = true;

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<LayoutCubit>(context);

    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: (20.h)),
              child: Text(
                widget.product.name.toString(),
                style: AppStyles.textStyle20
                //  Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: EdgeInsets.all((15.h)),
                width: (64),
                decoration: BoxDecoration(
                  color: cubit.FavoriteId.contains(widget.product.id.toString())
                      ? const Color.fromARGB(255, 203, 132, 127)
                      : Colors.teal,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
                child: GestureDetector(
                  onTap: () {
                    cubit.AddOrRemoveFromFavorites(
                        productId: widget.product.id.toString());
                    showsnakbarwidget(
                        context, 'Success', true);
                  },
                  child: Icon(
                    Icons.favorite,
                    size: 26.h,
                    color:
                        cubit.FavoriteId.contains(widget.product.id.toString())
                            ? Colors.red
                            : Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: (20.h),
                right: (64.h),
              ),
              child: Text(
                widget.product.description.toString(),
                maxLines: isShowMore ? 2 : null,
                overflow: TextOverflow.visible,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: (20.h),
                vertical: 10.h,
              ),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isShowMore = !isShowMore;
                  });
                },
                child: Row(
                  children: [
                    Text(
                      isShowMore ? "See More Detail" : ' Show less ',
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, color: kPrimaryColor),
                    ),
                    SizedBox(width: 5.w),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 12.h,
                      color: kPrimaryColor,
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
