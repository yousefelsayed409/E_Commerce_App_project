import 'package:ecommerceapp/featuears/cart/widget/pay_pal_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/utils/app_styles.dart';
import '../../../core/widgets/defult_button.dart';
import '../manger/cart_cubit/cart_cubit.dart';
import '../pay_mob_view.dart';

class CheckoutCard extends StatefulWidget {
  const CheckoutCard({super.key});

  @override
  State<CheckoutCard> createState() => _CheckoutCardState();
}

class _CheckoutCardState extends State<CheckoutCard> {
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<CartCubit>(context);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.white, Colors.white],
          end: Alignment.bottomLeft,
          begin: Alignment.bottomRight,
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(5, 5),
            blurRadius: 25,
            color: Colors.black.withOpacity(0.3),
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: "Total:\n",
                    children: [
                      TextSpan(
                        text: '${cubit.totalPrice} \$',
                        style: AppStyles.textStyle16,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 220,
                  child: DefaultButton(
                    text: "Check Out",
                    press: () {
                      _showPaymentOptions(context ,);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showPaymentOptions(BuildContext context  , ) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) =>  const PayPalScreen(),
                  ));
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: SvgPicture.asset(
                    'assets/images/paypal.svg',
                    width: 25,
                    height: 27,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => const PayMobScreen(),
                  ));
                },
                child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.asset(
                      'assets/images/paymob-announces-new-uae-regional-hub.webp',
                      fit: BoxFit.cover,
                      width: 90,
                      height: 40,
                    )),
              ),
            ],
          ),
        );
      },
    );
  }
}
