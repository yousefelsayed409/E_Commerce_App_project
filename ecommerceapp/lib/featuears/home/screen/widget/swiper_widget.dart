import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redacted/redacted.dart';

import '../../../../core/utils/app_color.dart';
import '../../../Layout/Layout_cubit.dart/cubit/layout_cubit.dart';

class SwiperWidget extends StatefulWidget {
  const SwiperWidget({super.key});

  @override
  State<SwiperWidget> createState() => _SwiperWidgetState();
}

class _SwiperWidgetState extends State<SwiperWidget> {
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<LayoutCubit>(context);

    return SizedBox(
      height: 150.h,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40.h),
        child: Swiper(
          itemCount: cubit.banners.length,
          autoplay: true,
          autoplayDelay: 1000, 
          duration: 700, 
          itemBuilder: (context, index) {
            return CachedNetworkImage(
              height: 120.h,
              width: 120.w,
              fit: BoxFit.fill,
              imageUrl: cubit.banners[index].url!,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  const Center(child: CupertinoActivityIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            );
          },
          pagination: const SwiperPagination(
            margin: EdgeInsets.only(top: 0),
            builder: DotSwiperPaginationBuilder(
              activeSize: 15,
              activeColor: AppColors.red,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    ).redacted(
      context: context,
      redact: true,
      configuration: RedactedConfiguration(
        animationDuration: const Duration(milliseconds: 800), //default
      ),
    );
  }
}
