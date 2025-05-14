import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:vpn/app/app_color.dart';

class ConnectionSecure extends StatelessWidget {
  const ConnectionSecure({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.security_sharp,
          color: AppColor.greenColor,
        ),
        Gap(10.w),
        Text(
          "Connection Secure",
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: AppColor.greenColor,
                fontSize: 48.sp,
                letterSpacing: 0.8,
              ),
        ),
      ],
    );
  }
}
