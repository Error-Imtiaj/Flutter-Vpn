import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 800.w,
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue.shade100),
            child: Center(
              child: Text(
                "Z_VPN",
                style: TextStyle(
                  fontSize: 60.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: Text("Home", style: TextStyle(fontSize: 40.sp)),
            onTap: () => Get.back(),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: Text("Settings", style: TextStyle(fontSize: 40.sp)),
            onTap: () {
              Get.snackbar(
                  "Coming Soon", "Settings page is under construction");
            },
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: Text("About", style: TextStyle(fontSize: 40.sp)),
            onTap: () {
              Get.dialog(
                AlertDialog(
                  title: Text(
                    "TON VPN",
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge
                        ?.copyWith(fontSize: 64.sp),
                  ),
                  content: Text(
                    "TON VPN, developed by Imtiaj, is a high-performance Android VPN app designed to prioritize your online privacy and security.",
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge
                        ?.copyWith(fontSize: 40.sp),
                  ),
                  actions: [
                    TextButton(
                        onPressed: () => Get.back(), child: const Text("OK"))
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
