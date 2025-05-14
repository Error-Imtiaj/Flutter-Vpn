import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vpn/app/app_color.dart';
import 'package:vpn/features/home/ui/controllers/vpn_controller.dart';

class FooterStatus extends StatelessWidget {
  const FooterStatus({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<VPNController>();
    final isConnected = controller.stage.value == "connected";

    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      height: 120.h,
      decoration: BoxDecoration(
        color: isConnected
            ? AppColor.greenShadeColor
            : Colors.redAccent.shade400,
      ),
      child: Text(
        isConnected ? "You are now secured" : "Make your connection secure",
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
              fontSize: 40.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
      ),
    );
  }
}
