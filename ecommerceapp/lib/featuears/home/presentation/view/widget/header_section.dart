import 'package:ecommerceapp/core/utils/app_styles.dart';
import 'package:flutter/cupertino.dart';
import '../../../../../core/helper/Shared/Local_NetWork.dart';
import '../../../../../core/utils/app_color.dart';

class HeaderSection extends StatelessWidget {
   HeaderSection({super.key, required this.textone, required this.textTow , this.onTap});
  final String textone ;
    final String textTow ;

void Function()? onTap ;
  @override
  Widget build(BuildContext context) {
    return   Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        Text(
                          textone ,
                          
                          style: 
                            TextStyle(
                           color: CashNetwork.getCashData(key: 'theme') == 'light'
                                ? AppColors.black
                                : AppColors.white,
                              // color: AppColors.black,
                              // fontSize: 20,
                              // fontWeight: FontWeight.normal
                              ),
                        ),
                        GestureDetector(
                          onTap: onTap ,
                          child: Text(
                            textTow ,
                                                 
                            style: AppStyles.textStyle10.copyWith(
                              color: AppColors.bluegrey,
                              fontSize: 14
                            )
                            
                          ),
                        ),
                      ],
                    );
  }
}