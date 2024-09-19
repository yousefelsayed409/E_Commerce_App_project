// import 'package:flutter/material.dart';

// import '../../../core/models/product_model.dart';
// import '../../../core/utils/constants.dart';
// import 'cart_counter.dart';

// class ColorDots extends StatelessWidget {
//   const ColorDots({
//     Key? key,
//     required this.product,
//   }) : super(key: key);

//   final ProductModel product;

//   @override
//   Widget build(BuildContext context) {
//     // Now this is fixed and only for demo
//     int selectedColor = 3;
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: (22)),
//       child: Row(
//         children: const [
       
//           Spacer(),
//           CartCounter(),
//           // IconButton(
//           //   icon: Icons.remove,
//           //   press: () {},
//           // ),
//           // SizedBox(width: (20)),
//           // RoundedIconBtn(
//           //   icon: Icons.add,
//           //   showShadow: true,
//           //   press: () {},
//           // ),
//         ],
//       ),
//     );
//   }
// }

// class ColorDot extends StatelessWidget {
//   const ColorDot({
//     Key? key,
//     required this.color,
//     this.isSelected = false,
//   }) : super(key: key);

//   final Color color;
//   final bool isSelected;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(right: 2),
//       padding: const EdgeInsets.all((8)),
//       height: (40),
//       width: (40),
//       decoration: BoxDecoration(
//         color: Colors.transparent,
//         border:
//             Border.all(color: isSelected ? kPrimaryColor : Colors.transparent),
//         shape: BoxShape.circle,
//       ),
//       child: DecoratedBox(
//         decoration: BoxDecoration(
//           color: color,
//           shape: BoxShape.circle,
//         ),
//       ),
//     );
//   }
// }
