import 'package:flutter/material.dart';


class BagEmptyWidget extends StatelessWidget {
  const BagEmptyWidget(
      {super.key,
      required this.titleonetow,
      required this.imagePath,
      required this.titleone,
      required this.SubTitle,
      });
  final String imagePath;
  final String titleone;
  final String titleonetow;
  final String SubTitle;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            width: double.infinity,
            height: size.height * 0.22,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            titleone,
            style: TextStyle(fontSize: 35, color: Colors.teal),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            titleonetow,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            SubTitle,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
          ),
          const SizedBox(
            height: 10,
          ),
          // ElevatedButton(
          //     style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
          //     onPressed: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) {
          //             return LayoutScreen();
          //           },
          //         ),
          //       );
          //     },
          //     child: Text(textbotton))
        ],
      ),
    );
  }
}
