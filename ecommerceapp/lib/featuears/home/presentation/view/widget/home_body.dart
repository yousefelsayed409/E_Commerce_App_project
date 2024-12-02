// ignore: file_names
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:ecommerceapp/core/widgets/custom_nav.dart';
import 'package:ecommerceapp/featuears/categore/category_screen.dart';
import 'package:ecommerceapp/featuears/home/presentation/manger/home_cubit/home_cubit.dart';
import 'package:ecommerceapp/featuears/home/presentation/view/widget/carousel_widget.dart';
import 'package:ecommerceapp/featuears/home/presentation/view/widget/home_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redacted/redacted.dart';
import '../../../../Details/Detail_screen.dart';
import '../../../../Favorite/presentation/manger/favorite_cubit/favorite_cubit.dart';
import 'custom_card_widget.dart';
import 'header_section.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        final cubit = context.read<HomeCubit>();
        final favoriteCubit = context.read<FavoriteCubit>();
    
        return Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.h),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              children: [
                const HomeHeader(),
                const SizedBox(height: 15),
                HeaderSection(
                  textone: "Special for you",
                  textTow: "See More",
                ),
                SizedBox(height: 15.h),
                cubit.banners.isEmpty
                    ? const Center(child: CupertinoActivityIndicator())
                    : const CarouselWidget(),
                SizedBox(height: 15.h),
                HeaderSection(
                  onTap: () {
                    CustomNavigation.navigateTo(
                      context,
                      const CategoryScreen(),
                    );
                  },
                  textone: "Categories",
                  textTow: "See More",
                ),
                SizedBox(height: 15.h),
                cubit.categories.isEmpty
                    ? const Center(child: CupertinoActivityIndicator())
                    : _buildCategoriesList(cubit),
                SizedBox(height: 15.h),
                HeaderSection(textone: "Products", textTow: "See More"),
                SizedBox(height: 40.h),
                cubit.products.isEmpty
                    ? const Center(child: CupertinoActivityIndicator())
                    : _buildProductsGrid(cubit, favoriteCubit),
              ],
            ),
          );
      },
    );
  }

  Widget _buildCategoriesList(HomeCubit cubit) {
    return SizedBox(
      height: 50.h,
      width: double.infinity,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: cubit.categories.length,
        separatorBuilder: (context, index) => SizedBox(width: 15.w),
        itemBuilder: (context, index) {
          return CircleAvatar(
            radius: 30.h,
            backgroundImage: NetworkImage(cubit.categories[index].url!),
          ).redacted(
            context: context,
            redact: true,
            configuration:  RedactedConfiguration(
              animationDuration: const Duration(milliseconds: 800),
            ),
          );
        },
      ),
    );
  }

  Widget _buildProductsGrid(HomeCubit cubit, FavoriteCubit favoriteCubit) {
    final products = cubit.filteredProducts.isEmpty
        ? cubit.products
        : cubit.filteredProducts;

    return DynamicHeightGridView(
      crossAxisCount: 2,
      crossAxisSpacing: 20,
      mainAxisSpacing: 80,
      itemCount: products.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      builder: (context, index) {
        final product = products[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsScreen(ppprouduct: product),
              ),
            );
          },
          child: Customcard(model: product, cubit: favoriteCubit),
        );
      },
    ).redacted(
      context: context,
      redact: true,
      configuration:  RedactedConfiguration(
        animationDuration: const Duration(milliseconds: 800),
      ),
    );
  }
}
