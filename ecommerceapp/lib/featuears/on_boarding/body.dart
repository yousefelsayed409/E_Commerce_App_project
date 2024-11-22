
import 'package:ecommerceapp/core/helper/Shared/cash_helper.dart';
import 'package:ecommerceapp/core/widgets/api_constants.dart';
import 'package:ecommerceapp/featuears/auth/signIn/sign_in_screen.dart';
import 'package:ecommerceapp/featuears/on_boarding/onBoarding_contennt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../core/utils/constants.dart';
import '../../core/widgets/defult_button.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Welcome , Let’s go shopping!",
      "image": "assets/images/Online Groceries-cuate (1).png"
    },
    {
      "text": "We help people conect with store \naround Egypt",
      "image": "assets/images/Add to Cart-rafiki.png"
    },
    {
      "text": "We show the easy way to shop. \nJust stay at home with us",
      "image": "assets/images/Add to Cart-bro.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => onBoardingContent(
                  image: splashData[index]["image"],
                  text: splashData[index]['text'],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: (20.h)),
                child: Column(
                  children: <Widget>[
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => AnimatedContainer(
                          duration: kAnimationDuration,
                          margin: EdgeInsets.only(right: 5.h),
                          height: 6.h,
                          width: currentPage == index ? 20 : 6,
                          decoration: BoxDecoration(
                            color: currentPage == index
                                ? kPrimaryColor
                                : const Color(0xFFD8D8D8),
                            borderRadius: BorderRadius.circular(3.h),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(flex: 3),
                    DefaultButton(
                      text: "Continue",
                      press: () async{ 
                      CacheHelper().saveData(key: AppConst.onBoardingScreen, value: AppConst.onBoardingScreen);
                       Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SignInScreen();
                        }));
                      },
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
