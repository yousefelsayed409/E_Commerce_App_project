import 'package:ecommerceapp/core/utils/app_assets.dart';
import 'package:ecommerceapp/core/widgets/api_constants.dart';
import 'package:ecommerceapp/core/widgets/defult_button.dart';
import 'package:ecommerceapp/featuears/Layout/Layout_cubit.dart/cubit/layout_cubit.dart';
import 'package:ecommerceapp/featuears/Layout/Layout_cubit.dart/cubit/layout_state.dart';
import 'package:ecommerceapp/featuears/cart/manger/cubit/cubit.dart';
import 'package:ecommerceapp/featuears/cart/manger/cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/widgets/custom_nav.dart';
import 'toggle_screen.dart';
import 'widget/cart_info_item.dart';

class CompletPayScreen extends StatefulWidget {
  const CompletPayScreen({super.key});

  @override
  State<CompletPayScreen> createState() => _CompletPayScreenState();
}

class _CompletPayScreenState extends State<CompletPayScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentStates>(
      listener: (context, state) {
        if (state is PaymentOrderIdSuccessStates) {
          // Navigate to the next screen when order ID is obtained successfully
          navigateTo(context, ToggleScreen());
        } else if (state is PaymentAuthErrorStates ||
                   state is PaymentOrderIdErrorStates) {
          // Show error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: ${state is PaymentAuthErrorStates ? state.error : (state as PaymentOrderIdErrorStates).error}')),
          );
        }
      },
      builder: (context, state) {
        return BlocBuilder<LayoutCubit, LayoutStates>(
          builder: (context, layoutState) {
            var cuubit = BlocProvider.of<LayoutCubit>(context);
            var cubit = BlocProvider.of<PaymentCubit>(context);
    
            return Scaffold(
              backgroundColor: const Color(0xffFFFFFF),
              appBar: AppBar(
                title: const Text(
          "PayMob Checkout",
          style: TextStyle(fontSize: 20),
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
                      Container(
                        height: 220.h,
                        child: SvgPicture.asset(AppAssets.imagecompletCart),
                      ),
                      SizedBox(height: 25.h),
                      
                      OrderInfoItem(
                        title: 'Price Order ',
                        value: '${cuubit.totalPrice} \$',
                      ),
                      SizedBox(height: 3.h),
                      const OrderInfoItem(title: 'Discount', value: r'0$'),
                      Divider(
                        thickness: 2,
                        height: 34.h,
                        color: const Color(0xffC7C7C7),
                      ),
                      OrderInfoItem(
                        title: 'Total Price',
                        value: '${cuubit.totalPrice} \$',
                      ),
                      SizedBox(height: 16.h),
                      DefaultButton(
                        
                        text: state is PaymentOrderIdLoadingStates ? 'Processing...' : 'Pay Now',
                        press: state is PaymentOrderIdLoadingStates ? null : () async {
                          // Make sure the token is obtained before proceeding
                          // ignore: unnecessary_null_comparison
                          if (ApiContest.paymentFirstToken != null) {
                            await cubit.getOrderRegistrationID(
                              price: '${cuubit.totalPrice * 100}', // Convert to cents without $ symbol
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Authorization token is missing')),
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
      },
    );
  }
}
