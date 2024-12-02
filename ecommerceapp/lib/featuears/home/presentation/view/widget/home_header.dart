
import 'package:ecommerceapp/featuears/home/presentation/manger/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Search_foem_field.dart';
import 'icon_with_counter.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
        // final cubit = context.read<LayoutCubit>();

    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return SearchField(
                  onChanged: (value) {
                    cubit.filterProducts(input: value);
                  },
                );
            },
          ),
          IconBtnWithCounter(
            IIcon: Icons.add_shopping_cart,
            press: () => '',
            // Navigator.pushReplacementNamed(context, AppRoute.cartScreen),
          ),
          IconBtnWithCounter(
            IIcon: Icons.notifications,
            numOfitem: 3,
            press: () {},
          ),
        ],
      ),
    );
  }
}
