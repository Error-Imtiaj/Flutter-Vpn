import 'package:get/get.dart';
import 'package:openvpn_flutter/openvpn_flutter.dart';
import 'package:vpn/features/home/ui/controllers/vpn_controller.dart';

class ServerController extends GetxController {
  Future<void> handleServerTap({
    required int index,
    required VPNController vpnController,
  }) async {
    vpnController.defaultServer.value = index;

    if (vpnController.stage.value == VPNStage.disconnected.name) {
      Get.back();
      await vpnController.connectVPN(index);
    } else {
      vpnController.disconnectVPN();

      // Wait until the VPN is disconnected or timeout after 5 seconds
      bool isDisconnected = false;
      int retries = 0;
      while (retries < 50) {
        await Future.delayed(const Duration(milliseconds: 100));
        if (vpnController.stage.value == VPNStage.disconnected.name) {
          isDisconnected = true;
          break;
        }
        retries++;
      }

      if (isDisconnected) {
        Get.back();
        await vpnController.connectVPN(index);
      } else {
        Get.snackbar(
          "Error",
          "Failed to disconnect VPN. Try again.",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
  }
}
