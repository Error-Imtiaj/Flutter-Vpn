import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vpn/features/home/ui/controllers/vpn_controller.dart';
import 'package:vpn/features/serverpage/ui/screen/server_page.dart';

class SelectedServerTile extends StatelessWidget {
  const SelectedServerTile({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<VPNController>();
    final server = controller.server[controller.defaultServer.value];

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 100.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: Colors.grey.shade100,
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            spreadRadius: 2,
            offset: const Offset(4, 4),
            color: Colors.black.withOpacity(0.1),
          ),
        ],
      ),
      child: ListTile(
        leading: Image.asset(
          server.flagPath,
          width: 80.w,
          height: 80.h,
        ),
        title: Text(
          server.locationName,
          style: Theme.of(context)
              .textTheme
              .labelLarge
              ?.copyWith(fontSize: 40.sp),
        ),
        trailing: (server.proIconPath != null && server.proIconPath!.isNotEmpty)
            ? Image.asset(
                server.proIconPath!,
                width: 80.w,
                height: 80.h,
              )
            : const SizedBox(width: 80, height: 80),
        onTap: () => Get.to(() => const ServerPage()),
      ),
    );
  }
}
