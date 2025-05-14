import 'package:get/get.dart';
import 'package:openvpn_flutter/openvpn_flutter.dart';
import 'package:vpn/features/home/ui/controllers/vpn_controller.dart';

class ServerController extends GetxController {
  Future<void> handleServerTap({required int index, required VPNController vpnController}) async {
    vpnController.defaultServer.value = index;

    if (vpnController.stage.value == VPNStage.disconnected.name) {
      Get.back();
      await vpnController.connectVPN(index);
    } else {
      vpnController.disconnectVPN();

      // Wait until VPN is disconnected
      while (vpnController.stage.value != VPNStage.disconnected.name) {
        await Future.delayed(const Duration(milliseconds: 100));
      }

      Get.back();
      await vpnController.connectVPN(index);
    }
  }
}
