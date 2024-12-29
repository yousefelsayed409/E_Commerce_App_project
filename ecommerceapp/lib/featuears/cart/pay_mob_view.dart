import 'package:ecommerceapp/core/helper/Shared/Local_NetWork.dart';
import 'package:ecommerceapp/core/localization/localization.dart';
import 'package:ecommerceapp/core/utils/app_assets.dart';
import 'package:ecommerceapp/core/widgets/api_constants.dart';
import 'package:ecommerceapp/core/widgets/defult_button.dart';
import 'package:ecommerceapp/core/widgets/snakbar_widget.dart';

import 'package:ecommerceapp/featuears/cart/manger/cart_cubit/cart_cubit.dart';
import 'package:ecommerceapp/featuears/cart/manger/paypal_cubit/cubit.dart';
import 'package:ecommerceapp/featuears/cart/manger/paypal_cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/widgets/custom_nav.dart';
import 'toggle_screen.dart';
import 'widget/cart_info_item.dart';

class PayMobScreen extends StatefulWidget {
  const PayMobScreen({super.key});

  @override
  State<PayMobScreen> createState() => _PayMobScreenState();
}

class _PayMobScreenState extends State<PayMobScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentStates>(
      listener: (context, state) {
        if (state is PaymentOrderIdSuccessStates) {
          // Navigate to the next screen when order ID is obtained successfully
          CustomNavigation.navigateTo(context, const ToggleScreen());
        } else if (state is PaymentAuthErrorStates ||
                   state is PaymentOrderIdErrorStates) {
          // Show error message
          showsnakbarwidget(context, " please try again", false);

    //       ScaffoldMessenger.of(context).showSnackBar(
    //  const SnackBar(content: const Text('Error: Please try again ')),

    //         // SnackBar(content: Text('Error: ${state is PaymentAuthErrorStates ? state.error : (state as PaymentOrderIdErrorStates).error}')),
    //       );
        }
      },
      builder: (context, state) {
        var cuubit = BlocProvider.of<CartCubit>(context);
            var cubit = BlocProvider.of<PaymentCubit>(context);
    
            return Scaffold(
              appBar: AppBar(
                title:  Text(
          "PayMob Checkout".tr(context),
           style: TextStyle(
            fontSize: 20.sp,
                                            color:  CashNetwork.getCashData(key: 'theme') == 'light'
                                ? Colors.white
                                : Colors.white,
                                          ),
        ),
                backgroundColor: Colors.teal,
                centerTitle: true,
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(height: 18.h),
                      SizedBox(
                        height: 220.h,
                        child: SvgPicture.asset(AppAssets.imagecompletCart
                        ,),
                      ),
                      SizedBox(height: 25.h),
                      
                      OrderInfoItem(
                        title: 'Price Order'.tr(context),
                        value: '${cuubit.totalPrice} \$',
                      ),
                      SizedBox(height: 3.h),
                       OrderInfoItem(title: 'Discount'.tr(context), value: r'0$'),
                      Divider(
                        thickness: 2,
                        height: 34.h,
                        color: const Color(0xffC7C7C7),
                      ),
                      OrderInfoItem(
                        title: 'Total Price'.tr(context),
                        value: '${cuubit.totalPrice} \$',
                      ),
                      SizedBox(height: 16.h),
                      DefaultButton(
                        
                        text: state is PaymentOrderIdLoadingStates ? 'Processing...'.tr(context) : 'Pay Now'.tr(context),
                        press: state is PaymentOrderIdLoadingStates ? null : () async {
                          // Make sure the token is obtained before proceeding
                          // ignore: unnecessary_null_comparison
                          if (ApiContest.paymentFirstToken != null) {
                            await cubit.getOrderRegistrationID(
                              price: '${cuubit.totalPrice * 100}', // Convert to cents without $ symbol
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Authorization token is missing')),
                            );
                          }
                        },
                      ),
                      const SizedBox(height: 12),
                    ],
                  ),
                ),
              ),
            );
      },
    );
  }
}
