class FormBasicDataModelItemList {
/*
{
  "id": "487058073038917",
  "itemName": "数值_不校验",
  "category": 0,
  "dataType": 1,
  "dataSource": "",
  "dataSourceList": [
    "1"
  ],
  "attachment": 0,
  "isCheck": 0,
  "judgeType": 0,
  "belongTo": 1,
  "apply": 1,
  "finalResult": 0,
  "itemValue": "",
  "result": 1,
  "itemOrder": 1,
  "maxItemValue": 100
} 
*/

  String? id;
  String? itemName;
  int? category;
  int? dataType;
  String? dataSource;
  List<String?>? dataSourceList;
  int? attachment;
  int? isCheck;
  int? judgeType;
  int? belongTo;
  int? apply;
  int? finalResult;
  String? itemValue;
  int? result;
  int? itemOrder;
  int? maxItemValue;

  FormBasicDataModelItemList({
    this.id,
    this.itemName,
    this.category,
    this.dataType,
    this.dataSource,
    this.dataSourceList,
    this.attachment,
    this.isCheck,
    this.judgeType,
    this.belongTo,
    this.apply,
    this.finalResult,
    this.itemValue,
    this.result,
    this.itemOrder,
    this.maxItemValue,
  });
  FormBasicDataModelItemList.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    itemName = json['itemName']?.toString();
    category = json['category']?.toInt();
    dataType = json['dataType']?.toInt();
    dataSource = json['dataSource']?.toString();
    if (json['dataSourceList'] != null) {
      final v = json['dataSourceList'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      dataSourceList = arr0;
    }
    attachment = json['attachment']?.toInt();
    isCheck = json['isCheck']?.toInt();
    judgeType = json['judgeType']?.toInt();
    belongTo = json['belongTo']?.toInt();
    apply = json['apply']?.toInt();
    finalResult = json['finalResult']?.toInt();
    itemValue = json['itemValue']?.toString();
    result = json['result']?.toInt();
    itemOrder = json['itemOrder']?.toInt();
    maxItemValue = json['maxItemValue']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['itemName'] = itemName;
    data['category'] = category;
    data['dataType'] = dataType;
    data['dataSource'] = dataSource;
    if (dataSourceList != null) {
      final v = dataSourceList;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v);
      }
      data['dataSourceList'] = arr0;
    }
    data['attachment'] = attachment;
    data['isCheck'] = isCheck;
    data['judgeType'] = judgeType;
    data['belongTo'] = belongTo;
    data['apply'] = apply;
    data['finalResult'] = finalResult;
    data['itemValue'] = itemValue;
    data['result'] = result;
    data['itemOrder'] = itemOrder;
    data['maxItemValue'] = maxItemValue;
    return data;
  }
}

class FormBasicDataModel {
/*
{
  "callFaultConfigId": "491989553344581",
  "sop": "bucket01/呼叫统计_20231205141623 (1).xlsx",
  "sopName": "呼叫统计_20231205141623 (1).xlsx",
  "eFormId": "475400100601925",
  "prefix": "bc",
  "faultDescription": "bc",
  "isSample": 0,
  "sampleNum": 1,
  "testNum": 5,
  "itemList": [
    {
      "id": "487058073038917",
      "itemName": "数值_不校验",
      "category": 0,
      "dataType": 1,
      "dataSource": "",
      "dataSourceList": [
        "1"
      ],
      "attachment": 0,
      "isCheck": 0,
      "judgeType": 0,
      "belongTo": 1,
      "apply": 1,
      "finalResult": 0,
      "itemValue": "",
      "result": 1,
      "itemOrder": 1,
      "maxItemValue": 100
    }
  ]
} 
*/

  String? callFaultConfigId;
  String? sop;
  String? sopName;
  String? eFormId;
  String? prefix;
  String? faultDescription;
  int? isSample;
  int? sampleNum;
  int? testNum;
  List<FormBasicDataModelItemList?>? itemList;

  FormBasicDataModel({
    this.callFaultConfigId,
    this.sop,
    this.sopName,
    this.eFormId,
    this.prefix,
    this.faultDescription,
    this.isSample,
    this.sampleNum,
    this.testNum,
    this.itemList,
  });
  FormBasicDataModel.fromJson(Map<String, dynamic> json) {
    callFaultConfigId = json['callFaultConfigId']?.toString();
    sop = json['sop']?.toString();
    sopName = json['sopName']?.toString();
    eFormId = json['eFormId']?.toString();
    prefix = json['prefix']?.toString();
    faultDescription = json['faultDescription']?.toString();
    isSample = json['isSample']?.toInt();
    sampleNum = json['sampleNum']?.toInt();
    testNum = json['testNum']?.toInt();
    if (json['itemList'] != null) {
      final v = json['itemList'];
      final arr0 = <FormBasicDataModelItemList>[];
      v.forEach((v) {
        arr0.add(FormBasicDataModelItemList.fromJson(v));
      });
      itemList = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['callFaultConfigId'] = callFaultConfigId;
    data['sop'] = sop;
    data['sopName'] = sopName;
    data['eFormId'] = eFormId;
    data['prefix'] = prefix;
    data['faultDescription'] = faultDescription;
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
    return data;
  }
}
