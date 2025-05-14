class VpnConfigModel {
  final String configPath;
  final String locationName;
  final String? userName;
  final String? passWord;
  final String flagPath;
  final String? proIconPath;

  VpnConfigModel({
    this.proIconPath,
    required this.flagPath,
    required this.configPath,
    required this.locationName,
    required this.userName,
    required this.passWord,
  });
}
