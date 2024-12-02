import 'package:flutter/cupertino.dart';
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
                          
                          style: const TextStyle(
                              color: AppColors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.normal),
                        ),
                        GestureDetector(
                          onTap: onTap ,
                          child: Text(
                            textTow ,
                                                 
                            style: const TextStyle(
                                color: AppColors.bluegrey,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    );
  }
}