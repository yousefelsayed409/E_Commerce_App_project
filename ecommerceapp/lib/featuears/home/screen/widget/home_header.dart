import 'package:ecommerceapp/featuears/Layout/Layout_cubit.dart/cubit/layout_cubit.dart';
import 'package:ecommerceapp/featuears/Layout/Layout_cubit.dart/cubit/layout_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/routes/app_routes.dart';
import 'Search_foem_field.dart';
import 'icon_with_counter.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LayoutCubit>();
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BlocBuilder<LayoutCubit, LayoutStates>(
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
