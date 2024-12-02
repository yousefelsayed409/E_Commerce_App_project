import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.asetsimage,
    this.press,
  }) : super(key: key);

  final String text;
  final IconData asetsimage;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.h),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: theme.colorScheme.onSurface,    
          padding: const EdgeInsets.all(20),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: theme.colorScheme.surface.withOpacity(0.2), 
        ),
        onPressed: press,
        child: Row(
          children: [
            Icon(
              asetsimage,
              size: 28,
              color: theme.iconTheme.color, ),
            SizedBox(width: 20.w),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  color: theme.textTheme.bodyLarge!.color, ),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey, ),
          ],
        ),
      ),
    );
  }
}
