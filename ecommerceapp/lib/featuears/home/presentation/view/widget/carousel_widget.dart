import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerceapp/featuears/home/presentation/manger/home_cubit/home_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redacted/redacted.dart';


class CarouselWidget extends StatefulWidget {
  const CarouselWidget({super.key});

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HomeCubit>(context);

    return SizedBox(
      height: 150.h,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.h),
        child: CarouselSlider.builder(
          itemCount: cubit.banners.length,
          itemBuilder: (context, index, realIndex) {
            return CachedNetworkImage(
              height: 120.h,
              width: double.infinity,
              fit: BoxFit.fill,
              imageUrl: cubit.banners[index].url!,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  const Center(child: CupertinoActivityIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            );
          },
          options: CarouselOptions(
            height: 150.h,
            autoPlay: true, 
            autoPlayInterval: const Duration(seconds: 2), 
            autoPlayAnimationDuration: const Duration(milliseconds: 800),  
            enlargeCenterPage: true, 
            viewportFraction: 0.9, 
            initialPage: 0,
            enableInfiniteScroll: true, 
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
