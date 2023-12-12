class VersionInfoModel {
/*
{
  "isUpdate": 1,
  "versionName": "1.0.4",
  "buildNumber": 5,
  "fileUrl": "Files/ApkPackages/.apk",
  "updateDescription": "111",
  "fileSize": 3581,
  "needForceUpdate": true
} 
*/

  int? isUpdate;
  String? versionName;
  int? buildNumber;
  String? fileUrl;
  String? updateDescription;
  int? fileSize;
  bool? needForceUpdate;

  VersionInfoModel({
    this.isUpdate,
    this.versionName,
    this.buildNumber,
    this.fileUrl,
    this.updateDescription,
    this.fileSize,
    this.needForceUpdate,
  });
  VersionInfoModel.fromJson(Map<String, dynamic> json) {
    isUpdate = json['isUpdate']?.toInt();
    versionName = json['versionName']?.toString();
    buildNumber = json['buildNumber']?.toInt();
    fileUrl = json['fileUrl']?.toString();
    updateDescription = json['updateDescription']?.toString();
    fileSize = json['fileSize']?.toInt();
    needForceUpdate = json['needForceUpdate'];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['isUpdate'] = isUpdate;
    data['versionName'] = versionName;
    data['buildNumber'] = buildNumber;
    data['fileUrl'] = fileUrl;
    data['updateDescription'] = updateDescription;
    data['fileSize'] = fileSize;
    data['needForceUpdate'] = needForceUpdate;
    return data;
  }
}
