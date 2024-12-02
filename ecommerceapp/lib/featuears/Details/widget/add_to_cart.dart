// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:flutter/material.dart';

// import '../../../core/utils/constants.dart';




// class AddToCart extends StatelessWidget {
//   const AddToCart({super.key, });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding:  EdgeInsets.symmetric(
//           vertical: kDefaultPaddin, horizontal: kDefaultPaddin),
//       child: Row(
//         children: <Widget>[
         
//           Expanded(
//             child: ElevatedButton(
//               onPressed: () {},
//               style: ElevatedButton.styleFrom(
//                 minimumSize: const Size(double.infinity, 48),
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(18)),
//                 backgroundColor: Colors.black,
//               ),
//               child: Text(
//                 "Buy  Now".toUpperCase(),
//                 style: const TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class Acart extends StatelessWidget {
//   Acart({
//     Key? key,
//     // required this.ppproduct,
//   }) : super(key: key);
//   // final AllProductModels ppproduct;
//   void Function()? onTap;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16),
//       child: GestureDetector(
//         onTap: () {
//           // Navigator.pop(context);
//         },
//         child: Container(
//           height: 50,
//           width: double.infinity,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(32),
//             color: Colors.black,
//           ),
//           child: Center(
//             child: Text(
//               "Buy  Now".toUpperCase(),
//               style: const TextStyle(
//                 fontSize: 17,
//                 // fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
