import 'package:ecommerceapp/core/utils/app_assets.dart';
import 'package:ecommerceapp/featuears/Layout/Layout_cubit.dart/cubit/layout_cubit.dart';
import 'package:ecommerceapp/featuears/cart/widget/cart_info_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/widgets/defult_button.dart';

class PayPal extends StatefulWidget {

  const PayPal({super.key, });

  @override
  State<PayPal> createState() => _PayPalState();
}

class _PayPalState extends State<PayPal> {
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<LayoutCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "PayPal Checkout",
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
                title: 'Price Order',
                 value: '${cubit.totalPrice} \$',
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
                value: '${cubit.totalPrice} \$',
              ),
              SizedBox(height: 16.h),
              DefaultButton(
                text: 'Pay Now',
                press: () async {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => PaypalCheckout(
                      sandboxMode: true,
                clientId:
                    "AQDmPCYzBgTzPfEFnldVqBziRICrVFd8aF0gc4fF-4GEDZa15S3xwVDHqJNaXoKTw1b0G6xlCcmrVLt9",
                secretKey:
                    "EO7ouu9r4MtKweblbTRE5sqx_KHoG0sPKzJ466jmQ9q_Tu9uFACL1YjrRtzYGDdFyn-2YXEmcxLkOvGj",
                returnURL: "success.snippetcoder.com",
                cancelURL: "cancel.snippetcoder.com",
                transactions:  [
                  {
                    "amount": {
                      "total": '${cubit.totalPrice}',
                      "currency": "USD",
                      "details": {
                        // "subtotal": '70',
                        // "shipping": '0',
                        // "shipping_discount": 0
                      }
                    },
                    "description": "The payment transaction description.",
                    // "payment_options": {
                    //   "allowed_payment_method":
                    //       "INSTANT_FUNDING_SOURCE"
                    // },
                    "item_list": {
                      "items": [
                        // {
                        //   "name": "Apple",
                        //   "quantity": 4,
                        //   "price": '5',
                        //   "currency": "USD"
                        // },
                        // {
                        //   "name": "Pineapple",
                        //   "quantity": 5,
                        //   "price": '10',
                        //   "currency": "USD"
                        // }
                      ],

                      // shipping address is not required though
                      //   "shipping_address": {
                      //     "recipient_name": "Raman Singh",
                      //     "line1": "Delhi",
                      //     "line2": "",
                      //     "city": "Delhi",
                      //     "country_code": "IN",
                      //     "postal_code": "11001",
                      //     "phone": "+00000000",
                      //     "state": "Texas"
                      //  },
                    }
                  }
                ],
                note: "Contact us for any questions on your order.",
                onSuccess: (Map params) async {
                  print("onSuccess: $params");
                },
                onError: (error) {
                  print("onError: $error");
                  Navigator.pop(context);
                },
                onCancel: () {
                  print('cancelled:');
                },
              ),
                  ));
                },
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
