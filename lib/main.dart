import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:openvpn_flutter/openvpn_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late OpenVPN engine;
  VpnStatus? status;
  String? stage;
  bool _granted = false;

  @override
  void initState() {
    super.initState();

    engine = OpenVPN(
      onVpnStatusChanged: (data) {
        setState(() {
          status = data;
        });
      },
      onVpnStageChanged: (data, raw) {
        setState(() {
          stage = raw;
        });
      },
    );

    engine.initialize(
      groupIdentifier: "group.com.laskarmedia.vpn", // For iOS only
      providerBundleIdentifier:
          "id.laskarmedia.openvpnFlutterExample.VPNExtension", // iOS
      localizedDescription: "VPN by Nizwar", // iOS
      lastStage: (stage) {
        setState(() {
          this.stage = stage.name;
        });
      },
      lastStatus: (status) {
        setState(() {
          this.status = status;
        });
      },
    );

    Permission.notification.isGranted.then((_) {
      if (!_) Permission.notification.request();
    });
  }

  Future<String> loadVpnConfig() async {
    return await rootBundle.loadString('asset/uk.ovpn');
  }

  Future<void> initPlatformState() async {
    final config = await loadVpnConfig();

    engine.connect(
      config,
      "sINGAPOR",
      username: defaultVpnUsername,
      password: defaultVpnPassword,
      certIsRequired: true,
    );

    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('OpenVPN Example'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Stage: ${stage ?? VPNStage.disconnected.name}"),
              Text("Status: ${status?.toJson().toString() ?? "Disconnected"}"),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: initPlatformState,
                child: const Text("Start VPN"),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  engine.disconnect();
                },
                child: const Text("Stop VPN"),
              ),
              const SizedBox(height: 10),
              if (Platform.isAndroid)
                ElevatedButton(
                  onPressed: () async {
                    bool granted = await engine.requestPermissionAndroid();
                    setState(() {
                      _granted = granted;
                    });
                  },
                  child: Text(
                      _granted ? "Permission Granted" : "Request Permission"),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

const String defaultVpnUsername = "vpnbook";
const String defaultVpnPassword = "huba7re";
