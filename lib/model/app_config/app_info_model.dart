class AppInfoModel {
/*
{
  "version": "1.0.0",
  "buildNumber": "1",
} 
*/

  String? version;
  String? buildNumber;

  AppInfoModel({
    this.version,
    this.buildNumber,
  });
  AppInfoModel.fromJson(Map<String, dynamic> json) {
    version = json['version']?.toString();
    buildNumber = json['buildNumber']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['version'] = version;
    data['buildNumber'] = buildNumber;
    return data;
  }
}
