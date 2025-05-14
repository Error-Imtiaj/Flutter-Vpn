import 'package:get/get.dart';
import 'package:vpn/features/home/ui/controllers/vpn_controller.dart';
import 'package:vpn/features/serverpage/ui/controller/server_controller.dart';

class MyAppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(VPNController());
    Get.put(ServerController());
  }
}
