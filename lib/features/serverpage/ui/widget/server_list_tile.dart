import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vpn/features/home/utils/model/vpn_config_model.dart';

class ServerListTile extends StatelessWidget {
  final VpnConfigModel server;
  final int index;
  final VoidCallback onTap;

  const ServerListTile({
    Key? key,
    required this.server,
    required this.index,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 80.w, vertical: 32.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: Colors.grey.shade100,
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            spreadRadius: 2,
            offset: Offset(4, 4),
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
        title: Text(server.locationName,
            style: Theme.of(context)
                .textTheme
                .labelLarge
                ?.copyWith(fontSize: 40.sp)),
        trailing: (server.proIconPath != null && server.proIconPath!.isNotEmpty)
            ? Image.asset(
                server.proIconPath!,
                width: 80.w,
                height: 80.h,
              )
            : const SizedBox(width: 80, height: 80),
        onTap: onTap,
      ),
    );
  }
}
