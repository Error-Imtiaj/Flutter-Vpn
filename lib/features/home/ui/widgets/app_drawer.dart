import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vpn/app/app_color.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 800.w,
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: AppColor.greenShadeColor),
            child: Center(
              child: Text("TON VPN",
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontSize: 80.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: Text("Home", style: TextStyle(fontSize: 40.sp)),
            onTap: () => Get.back(),
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip),
            title: Text("Privacy Policy", style: TextStyle(fontSize: 40.sp)),
            onTap: () {
              _launchPrivacyPolicy();
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

  void _launchPrivacyPolicy() async {
    final Uri url = Uri.parse(
        'https://error-imtiaj.github.io/Privacy-Policy/ton-vpn-privacy-policy.html');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }
}
