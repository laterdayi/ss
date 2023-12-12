class CheckListFormInfoModel {
/*
{
  "eFormId": "433646300835909",
  "prefix": "wb"
} 
*/

  String? eFormId;
  String? prefix;

  CheckListFormInfoModel({
    this.eFormId,
    this.prefix,
  });
  CheckListFormInfoModel.fromJson(Map<String, dynamic> json) {
    eFormId = json['eFormId']?.toString();
    prefix = json['prefix']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['eFormId'] = eFormId;
    data['prefix'] = prefix;
    return data;
  }
}
