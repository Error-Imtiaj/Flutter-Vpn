import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:openvpn_flutter/openvpn_flutter.dart';
import 'package:vpn/features/home/utils/server_list.dart';

class VPNController extends GetxController {
  late OpenVPN engine;

  final status = Rxn<VpnStatus>();
  final stage = RxnString();
  final isGranted = false.obs;
  final server = ServerList().servers;
  final defaultServer = 0.obs;

  @override
  void onInit() {
    super.onInit();

    engine = OpenVPN(
      onVpnStatusChanged: (data) {
        status.value = data;
      },
      onVpnStageChanged: (data, raw) {
        stage.value = raw;
      },
    );

    _initializeEngine();
    _checkNotificationPermission();
  }

  Future<void> _initializeEngine() async {
    await engine.initialize(
      groupIdentifier: "group.com.laskarmedia.vpn", // iOS
      providerBundleIdentifier:
          "id.laskarmedia.openvpnFlutterExample.VPNExtension", // iOS
      localizedDescription: "VPN by Nizwar", // iOS
      lastStage: (s) => stage.value = s.name,
      lastStatus: (s) => status.value = s,
    );
  }

  Future<void> _checkNotificationPermission() async {
    final granted = await Permission.notification.isGranted;
    isGranted.value = granted;

    if (!granted) {
      await Permission.notification.request();
    }
  }

  Future<void> connectVPN(int n) async {
    final config = await rootBundle.loadString(server[n].configPath);
    await engine.connect(
      config,
      server[n].locationName,
      username: server[n].userName,
      password: server[n].passWord,
      certIsRequired: true,
    );
  }

  void disconnectVPN() {
    engine.disconnect();
  }
}
