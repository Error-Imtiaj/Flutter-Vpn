import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vpn/app/app_color.dart';
import 'package:vpn/features/home/ui/controllers/vpn_controller.dart';

class VPNStageText extends StatelessWidget {
  const VPNStageText({super.key});

  @override
  Widget build(BuildContext context) {
    final stage = Get.find<VPNController>().stage.value;
    final text = (stage ?? "disconnected").replaceFirstMapped(
      RegExp(r'^[a-z]'),
      (match) => match.group(0)!.toUpperCase(),
    );

    return Text(
      text,
      style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: AppColor.greenColor,
            fontSize: 48.sp,
            letterSpacing: 0.8,
          ),
    );
  }
}
