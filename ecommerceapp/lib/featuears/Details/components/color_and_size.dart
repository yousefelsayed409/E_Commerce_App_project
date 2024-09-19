import 'package:flutter/material.dart';

import '../../../core/utils/constants.dart';



class ColorAndSize extends StatelessWidget {
  const ColorAndSize({super.key, });

  // final AllProductModels ppprouduct;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  "Color",
                  style: TextStyle(color: Colors.black),
                ),
                Row(
                  children: const <Widget>[
                    ColorDot(
                      color: Color(0xFF356C95),
                      isSelected: true,
                    ),
                    ColorDot(
                      color: Color(0xFFF8C078),
                      isSelected: true,
                    ),
                    ColorDot(color: Color(0xFFA29B9B), isSelected: false),
                  ],
                ),
              ],
            ),
          ),
          // Expanded(
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: <Widget>[
          //       Text(
          //         "Choose Size",
          //         style: TextStyle(color: Colors.black),
          //       ),
          //       Row(
          //         children: <Widget>[
          //           ColorDot(
          //             color: Color(0xFF356C95),
          //             isSelected: true,
          //           ),
          //           ColorDot(
          //             color: Color(0xFFF8C078),
          //             isSelected: true,
          //           ),
          //           ColorDot(color: Color(0xFFA29B9B), isSelected: false),
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}

class ColorDot extends StatelessWidget {
  const ColorDot({super.key, required this.color, required this.isSelected});

  final Color color;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  const EdgeInsets.only(
        top: kDefaultPaddin / 4,
        right: kDefaultPaddin / 2,
      ),
      padding: const EdgeInsets.all(2.5),
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? color : Colors.transparent,
        ),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
