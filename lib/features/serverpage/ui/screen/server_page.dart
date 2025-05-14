import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn/features/home/ui/controllers/vpn_controller.dart';
import 'package:vpn/features/home/utils/model/vpn_config_model.dart';
import 'package:vpn/features/home/utils/server_list.dart';
import 'package:vpn/features/serverpage/ui/controller/server_controller.dart';
import 'package:vpn/features/serverpage/ui/widget/server_list_tile.dart';

class ServerPage extends StatefulWidget {
  const ServerPage({super.key});

  @override
  State<ServerPage> createState() => _ServerPageState();
}

class _ServerPageState extends State<ServerPage> {
  final VPNController controller = Get.find<VPNController>();
  final List<VpnConfigModel> allServers = ServerList().servers;
  final ServerController serverController = Get.find<ServerController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),
      body: ListView.builder(
        itemCount: allServers.length,
        itemBuilder: (context, index) {
          return ServerListTile(
            server: allServers[index],
            index: index,
            onTap: () async => await serverController.handleServerTap(
                index: index, vpnController: controller),
          );
        },
      ),
    );
  }

}
