import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:openvpn_flutter/openvpn_flutter.dart';
import 'package:vpn/features/home/ui/controllers/vpn_controller.dart';
import 'package:vpn/features/home/ui/widgets/app_drawer.dart';
import 'package:vpn/features/home/ui/widgets/big_button.dart';
import 'package:vpn/features/home/ui/widgets/byte_row.dart';
import 'package:vpn/features/home/ui/widgets/connection_secure.dart';
import 'package:vpn/features/home/ui/widgets/footer_status.dart';
import 'package:vpn/features/home/ui/widgets/server_tile.dart';
import 'package:vpn/features/home/ui/widgets/vpn_stage_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final VPNController controller = Get.find<VPNController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Obx(() {
            return CircleAvatar(
              backgroundImage: AssetImage(
                  controller.server[controller.defaultServer.value].flagPath),
            );
          }),
          Gap(40.w),
        ],
      ),
      body: Obx(() {
        return Column(
          children: [
            // Connection secure
            const ConnectionSecure(),
            Text(
              "${controller.status.value?.duration}",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 180.sp,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Gap(96.h),
            const ByteRow(),
            Gap(120.h),
            // Button
            BigButton(
              onTap: () {
                if (controller.stage.value == VPNStage.disconnected.name) {
                  controller.connectVPN(controller.defaultServer.value);
                } else {
                  controller.disconnectVPN();
                }
              },
            ),
            Gap(80.h),

            VPNStageText(),
            Gap(80.h),
            SelectedServerTile(),
            const Spacer(),
            FooterStatus(),
          ],
        );
      }),
    );
  }
}
