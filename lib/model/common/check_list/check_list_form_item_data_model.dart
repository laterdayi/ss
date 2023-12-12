class CheckListFormItemDataModelItemList {
/*
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
  "failvalue:": 1,
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
*/

  String? id;
  String? itemName;
  int? category;
  String? itemGroup;
  int? dataType;
  String? dataSource;
  List<String?>? dataSourceList;
  int? attachment;
  int? isCheck;
  int? judgeType;
  String? failValue;
  int? belongTo;
  int? apply;
  int? finalResult;
  String? remark;
  dynamic itemValue;
  String? attachmentPath;
  int? result;
  int? itemOrder;
  String? failvalue;
  String? judgeReason;
  String? standard;
  String? unit;
  int? maxItemValue;
  String? attachmentFile;
  String? attachmentName;

  CheckListFormItemDataModelItemList({
    this.id,
    this.itemName,
    this.category,
    this.itemGroup,
    this.dataType,
    this.dataSource,
    this.dataSourceList,
    this.attachment,
    this.isCheck,
    this.judgeType,
    this.failValue,
    this.belongTo,
    this.apply,
    this.failvalue,
    this.finalResult,
    this.remark,
    this.itemValue,
    this.attachmentPath,
    this.result,
    this.itemOrder,
    this.judgeReason,
    this.standard,
    this.unit,
    this.maxItemValue,
    this.attachmentName,
    this.attachmentFile,
  });
  CheckListFormItemDataModelItemList.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    itemName = json['itemName']?.toString();
    category = json['category']?.toInt();
    itemGroup = json['itemGroup']?.toString();
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
    failValue = json['failValue']?.toString();
    belongTo = json['belongTo']?.toInt();
    apply = json['apply']?.toInt();
    finalResult = json['finalResult']?.toInt();
    remark = json['remark']?.toString();
    failvalue = json['failvalue']?.toString();
    itemValue = json['itemValue']?.toString();
    attachmentPath = json['attachmentPath']?.toString();
    result = json['result']?.toInt();
    itemOrder = json['itemOrder']?.toInt();
    judgeReason = json['judgeReason']?.toString();
    standard = json['standard']?.toString();
    unit = json['unit']?.toString();
    maxItemValue = json['maxItemValue']?.toInt();
    attachmentFile = json['attachmentFile']?.toString();
    attachmentName = json['attachmentName']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['itemName'] = itemName;
    data['failvalue'] = failvalue;
    data['category'] = category;
    data['itemGroup'] = itemGroup;
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
    data['failValue'] = failValue;
    data['belongTo'] = belongTo;
    data['apply'] = apply;
    data['finalResult'] = finalResult;
    data['remark'] = remark;
    data['itemValue'] = itemValue;
    data['attachmentPath'] = attachmentPath;
    data['result'] = result;
    data['itemOrder'] = itemOrder;
    data['judgeReason'] = judgeReason;
    data['standard'] = standard;
    data['unit'] = unit;
    data['attachmentName'] = attachmentName;
    data['maxItemValue'] = maxItemValue;
    data['attachmentFile'] = attachmentFile;
    return data;
  }
}

class CheckListFormItemDataModel {
/*
{
  "formPrefix": "wb",
  "isSample": 0,
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
      "failvalue:": 1,
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
  ]
} 
*/

  String? formPrefix;
  int? isSample;
  List<CheckListFormItemDataModelItemList?>? itemList;

  CheckListFormItemDataModel({
    this.formPrefix,
    this.isSample,
    this.itemList,
  });
  CheckListFormItemDataModel.fromJson(Map<String, dynamic> json) {
    formPrefix = json['formPrefix']?.toString();
    isSample = json['isSample']?.toInt();
    if (json['itemList'] != null) {
      final v = json['itemList'];
      final arr0 = <CheckListFormItemDataModelItemList>[];
      v.forEach((v) {
        arr0.add(CheckListFormItemDataModelItemList.fromJson(v));
      });
      itemList = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['formPrefix'] = formPrefix;
    data['isSample'] = isSample;
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
