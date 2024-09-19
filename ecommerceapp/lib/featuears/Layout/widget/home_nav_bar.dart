import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:ecommerceapp/core/utils/app_color.dart';
import 'package:ecommerceapp/featuears/Favorite/favorite_screen.dart';
import 'package:ecommerceapp/featuears/cart/Cart_screen.dart';
import 'package:ecommerceapp/featuears/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ecommerceapp/featuears/home/screen/Home_screen.dart';




class HomeNavBarWidget3 extends StatefulWidget {
  const HomeNavBarWidget3({Key? key}) : super(key: key);
  
  @override
  State<HomeNavBarWidget3> createState() => _HomeNavBarWidget3State();
}

class _HomeNavBarWidget3State extends State<HomeNavBarWidget3>
    with SingleTickerProviderStateMixin {
  int _tabIndex = 0;

  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: _tabIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CircleNavBar(
       circleShadowColor: AppColors.Teal,
        activeIcons: const [
          Icon(LineIcons.home, color: AppColors.Teal),
          Icon(LineIcons.heart, color: AppColors.Teal),
          Icon(LineIcons.shoppingBag, color: AppColors.Teal),
          Icon(LineIcons.user, color: AppColors.Teal),
        ],
        inactiveIcons: const [
          Icon(LineIcons.home, color: Colors.grey),
          Icon(LineIcons.heart, color: Colors.grey),
          Icon(LineIcons.shoppingBag, color: Colors.grey),
          Icon(LineIcons.user, color: Colors.grey),
        ],
        color: Colors.white,
        height: 50,
        circleWidth: 50,
        activeIndex: _tabIndex,
        onTap: (index) {
          setState(() {
            _tabIndex = index;
            pageController.jumpToPage(index);
          });
        },
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
        cornerRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(24),
          bottomLeft: Radius.circular(24),
        ),
        shadowColor: AppColors.Teal,
        elevation: 10,
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            _tabIndex = index;
          });
        },
        children: const [
          HomeScreen(),
          FavoriteScreen(),
          CartScreen(),
          ProfileScreen(),
        ],
      ),
    );
  }
}
