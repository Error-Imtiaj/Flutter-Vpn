import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vpn/app/app_color.dart';

class BigButton extends StatelessWidget {
  const BigButton({
    super.key, this.onTap,
  });
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: Container(
        width: 620.w, // Outer container slightly bigger to show border
        height: 620.h,
        padding: EdgeInsets.all(30.r),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.grey.shade400, // Border color
            width: 2, // Border width
          ),
        ),
        child: Container(
          width: 600.w,
          height: 600.h,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                AppColor.greenColor,
                AppColor.greenShadeColor,
              ],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            ),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 8,
                offset: Offset(4, 4),
              ),
            ],
          ),
          child: Icon(
            Icons.power_settings_new_rounded,
            color: Colors.white,
            size: 220.r,
          ),
        ),
      ),
    );
  }
}
