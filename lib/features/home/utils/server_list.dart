import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:vpn/app/flag_file_path.dart';
import 'package:vpn/app/icon_path.dart';
import 'package:vpn/app/ovpn_file_path.dart';
import 'package:vpn/features/home/utils/model/vpn_config_model.dart';

class ServerList {
  List<VpnConfigModel> servers = [
    VpnConfigModel(
      proIconPath: IconPath.proIconPath,
      flagPath: FlagFilePath.usFlag,
      configPath: OvpnFilePath.bestNewYorkServer,
      locationName: "NewYork",
      userName: dotenv.env['PAID_USERNAME'],
      passWord: dotenv.env['PAID_PASSWORD'],
    ),
    VpnConfigModel(
      proIconPath: IconPath.notProIconPath,
      flagPath: FlagFilePath.canadaFlag,
      configPath: OvpnFilePath.ca_server,
      locationName: "Canada",
      userName: dotenv.env['FREE_USERNAME'],
      passWord: dotenv.env['FREE_PASSWORD'],
    ),
    VpnConfigModel(
      proIconPath: IconPath.notProIconPath,
      flagPath: FlagFilePath.franceFlag,
      configPath: OvpnFilePath.fr_server,
      locationName: "France",
      userName: dotenv.env['FREE_USERNAME'],
      passWord: dotenv.env['FREE_PASSWORD'],
    ),
    VpnConfigModel(
      proIconPath: IconPath.notProIconPath,
      flagPath: FlagFilePath.germanFlag,
      configPath: OvpnFilePath.ge_server,
      locationName: "German",
      userName: dotenv.env['FREE_USERNAME'],
      passWord: dotenv.env['FREE_PASSWORD'],
    ),
    VpnConfigModel(
      proIconPath: IconPath.notProIconPath,
      flagPath: FlagFilePath.ukFlag,
      configPath: OvpnFilePath.uk_server,
      locationName: "United Kingdom",
      userName: dotenv.env['FREE_USERNAME'],
      passWord: dotenv.env['FREE_PASSWORD'],
    ),
    VpnConfigModel(
      proIconPath: IconPath.notProIconPath,
      flagPath: FlagFilePath.polandFlag,
      configPath: OvpnFilePath.po_server,
      locationName: "Poland",
      userName: dotenv.env['FREE_USERNAME'],
      passWord: dotenv.env['FREE_PASSWORD'],
    ),
  ];
}
