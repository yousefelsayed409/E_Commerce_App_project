import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 115.h,
      width: 115.w,
      child: Stack(
        fit: StackFit.passthrough,
        clipBehavior: Clip.none,
        children: [
          const CircleAvatar(
            backgroundColor: Colors.red,
            foregroundColor: Colors.black,
            backgroundImage: AssetImage("assets/images/success.png"),
          ),
          Positioned(
            right: -5,
            bottom: -10,
            left: 70,
            child: Container(
              height: 35,
              width: 35,
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: const BorderSide(color: Colors.teal),
                  ),
                  backgroundColor: const Color(0xFFF5F6F9),
                ),
                onPressed: () {},
                child: const Icon(
                  Icons.camera_enhance,
                  color: Colors.black,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
