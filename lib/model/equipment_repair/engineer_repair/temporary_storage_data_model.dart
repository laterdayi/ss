import 'package:pms_mobile/model/common/check_list/check_list_form_item_data_model.dart';

class TemporaryStorageDataModel {
/*
{
  "callFaultConfigId": "490899686928453",
  "sopName": "测试.mp4",
  "eFormId": "475400100601925",
  "prefix": "bc",
  "isSample": 0,
  "sampleNum": 1,
  "testNum": 5,
  "itemList": [
    {
      "id": "435376241270853",
      "itemName": "维保-输入",
      "category": 1,
      "itemGroup": "",
      "dataType": 2,
      "dataSource": "",
      "dataSourceList": [
        ""
      ],
      "attachment": 0,
      "isCheck": 0,
      "judgeType": 0,
      "failValue": "",
      "belongTo": 1,
      "apply": 1,
      "finalResult": 0,
      "remark": "",
      "itemValue": "",
      "attachmentPath": "",
      "result": 1,
      "itemOrder": 1,
      "judgeReason": "",
      "standard": "",
      "unit": "",
      "maxItemValue": 100
    }
  ],
  "faultName": "wssEqpType04故障类型01",
  "lotId": "",
  "faultDescription": "1",
  "faultReason": "2",
  "improveMeasure": "3",
  "recoveryConditions": [
    "MQC"
  ]
} 
*/

  String? callFaultConfigId;
  String? sopName;
  String? eFormId;
  String? prefix;
  int? isSample;
  int? sampleNum;
  int? testNum;
  List<CheckListFormItemDataModelItemList?>? itemList;
  String? faultName;
  String? lotId;
  String? faultDescription;
  String? faultReason;
  String? improveMeasure;
  List<String>? recoveryConditions;

  TemporaryStorageDataModel({
    this.callFaultConfigId,
    this.sopName,
    this.eFormId,
    this.prefix,
    this.isSample,
    this.sampleNum,
    this.testNum,
    this.itemList,
    this.faultName,
    this.lotId,
    this.faultDescription,
    this.faultReason,
    this.improveMeasure,
    this.recoveryConditions,
  });
  TemporaryStorageDataModel.fromJson(Map<String, dynamic> json) {
    callFaultConfigId = json['callFaultConfigId']?.toString();
    sopName = json['sopName']?.toString();
    eFormId = json['eFormId']?.toString();
    prefix = json['prefix']?.toString();
    isSample = json['isSample']?.toInt();
    sampleNum = json['sampleNum']?.toInt();
    testNum = json['testNum']?.toInt();
    if (json['itemList'] != null) {
      final v = json['itemList'];
      final arr0 = <CheckListFormItemDataModelItemList>[];
      v.forEach((v) {
        arr0.add(CheckListFormItemDataModelItemList.fromJson(v));
      });
      itemList = arr0;
    }
    faultName = json['faultName']?.toString();
    lotId = json['lotId']?.toString();
    faultDescription = json['faultDescription']?.toString();
    faultReason = json['faultReason']?.toString();
    improveMeasure = json['improveMeasure']?.toString();
    if (json['recoveryConditions'] != null) {
      final v = json['recoveryConditions'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      recoveryConditions = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['callFaultConfigId'] = callFaultConfigId;
    data['sopName'] = sopName;
    data['eFormId'] = eFormId;
    data['prefix'] = prefix;
    data['isSample'] = isSample;
    data['sampleNum'] = sampleNum;
    data['testNum'] = testNum;
    if (itemList != null) {
      final v = itemList;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v!.toJson());
      }
      data['itemList'] = arr0;
    }
    data['faultName'] = faultName;
    data['lotId'] = lotId;
    data['faultDescription'] = faultDescription;
    data['faultReason'] = faultReason;
    data['improveMeasure'] = improveMeasure;
    if (recoveryConditions != null) {
      final v = recoveryConditions;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v);
      }
      data['recoveryConditions'] = arr0;
    }
    return data;
  }
}
