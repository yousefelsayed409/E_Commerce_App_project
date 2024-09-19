import 'package:flutter/material.dart';
import '../../../../core/routes/app_routes.dart';
import 'Search_foem_field.dart';
import 'icon_with_counter.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SearchField(),
          IconBtnWithCounter(
            IIcon: Icons.add_shopping_cart,
            press: () =>
                Navigator.pushReplacementNamed(context, AppRoute.cartScreen),
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
