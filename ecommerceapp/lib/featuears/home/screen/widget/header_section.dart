import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../../core/utils/app_color.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key, required this.textone, required this.textTow});
  final String textone ;
    final String textTow ;


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
                        Text(
                          textTow ,
                       
                          style: const TextStyle(
                              color: AppColors.bluegrey,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    );
  }
}