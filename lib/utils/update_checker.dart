import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:vpn/app/app_color.dart';

class UpdateChecker {
  Future<void> checkForUpdate(BuildContext context) async {
    final remoteConfig = FirebaseRemoteConfig.instance;

    try {
      await remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: Duration(seconds: 10),
        minimumFetchInterval: Duration(hours: 1),
      ));
      await remoteConfig.fetchAndActivate();
    } catch (e) {
      print("Remote Config fetch error: $e");
    }

    final latestVersion = remoteConfig.getString('latest_version');
    final forceUpdate = remoteConfig.getBool('force_update_required');
    final updateUrl = remoteConfig.getString('update_url');

    final packageInfo = await PackageInfo.fromPlatform();
    final currentVersion = packageInfo.version;

    if (_isVersionLower(currentVersion, latestVersion) && forceUpdate) {
      _showUpdateDialog(context, updateUrl);
    }
  }

  bool _isVersionLower(String current, String latest) {
    List<int> currentParts = current.split('.').map(int.parse).toList();
    List<int> latestParts = latest.split('.').map(int.parse).toList();
    for (int i = 0; i < latestParts.length; i++) {
      if (i >= currentParts.length || latestParts[i] > currentParts[i])
        return true;
      if (latestParts[i] < currentParts[i]) return false;
    }
    return false;
  }

  void _showUpdateDialog(BuildContext context, String url) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        title: Text(
          'Update Required',
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 64.sp),
        ),
        content: Text(
          'A new version of TON VPN is available. Please update to continue.',
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: Colors.black,
              ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () async {
              final Uri uri = Uri.parse(url);

              // // TODO  ADD THIS PUBLISHING IN PLAY STORE
              // // if (await canLaunchUrl(uri)) {
              // //   await launchUrl(uri, mode: LaunchMode.externalApplication);
              // // }

              // TODO REMOVE THIS BEFORE PUBLISHING IN PLAY STORE
              if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
                throw 'Could not launch $url';
              }
              // Add in your main app
            },
            style: ElevatedButton.styleFrom(
                shape: ContinuousRectangleBorder(),
                backgroundColor: AppColor.greenShadeColor),
            child: Text(
              'Update Now',
              style: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
