class CheckListFormItemDetailModelItemList {
/*
{
  "itemName": "维保_数值_无自动校验",
  "itemValue": "23",
  "sample": [
    "1"
  ],
  "belongTo": 1,
  "remark": "1",
  "standard": "um",
  "attachmentImage": "1",
  "unit": "1",
  "result": 1
} 
*/

  String? itemName;
  String? itemValue;
  List<String?>? sample;
  int? belongTo;
  String? remark;
  String? standard;
  String? attachmentImage;
  String? unit;
  int? result;

  CheckListFormItemDetailModelItemList({
    this.itemName,
    this.itemValue,
    this.sample,
    this.belongTo,
    this.remark,
    this.standard,
    this.attachmentImage,
    this.unit,
    this.result,
  });
  CheckListFormItemDetailModelItemList.fromJson(Map<String, dynamic> json) {
    itemName = json['itemName']?.toString();
    itemValue = json['itemValue']?.toString();
    if (json['sample'] != null) {
      final v = json['sample'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      sample = arr0;
    }
    belongTo = json['belongTo']?.toInt();
    remark = json['remark']?.toString();
    standard = json['standard']?.toString();
    attachmentImage = json['attachmentImage']?.toString();
    unit = json['unit']?.toString();
    result = json['result']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['itemName'] = itemName;
    data['itemValue'] = itemValue;
    if (sample != null) {
      final v = sample;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v);
      }
      data['sample'] = arr0;
    }
    data['belongTo'] = belongTo;
    data['remark'] = remark;
    data['standard'] = standard;
    data['attachmentImage'] = attachmentImage;
    data['unit'] = unit;
    data['result'] = result;
    return data;
  }
}

class CheckListFormItemDetailModel {
/*
{
  "formName": "维保",
  "formType": "EnumFormType_PM",
  "sampleNum": 0,
  "testNum": 0,
  "itemList": [
    {
      "itemName": "维保_数值_无自动校验",
      "itemValue": "23",
      "sample": [
        "1"
      ],
      "belongTo": 1,
      "remark": "1",
      "standard": "um",
      "attachmentImage": "1",
      "unit": "1",
      "result": 1
    }
  ],
  "fromResult": 1
} 
*/

  String? formName;
  String? formType;
  int? sampleNum;
  int? testNum;
  List<CheckListFormItemDetailModelItemList?>? itemList;
  int? fromResult;

  CheckListFormItemDetailModel({
    this.formName,
    this.formType,
    this.sampleNum,
    this.testNum,
    this.itemList,
    this.fromResult,
  });
  CheckListFormItemDetailModel.fromJson(Map<String, dynamic> json) {
    formName = json['formName']?.toString();
    formType = json['formType']?.toString();
    sampleNum = json['sampleNum']?.toInt();
    testNum = json['testNum']?.toInt();
    if (json['itemList'] != null) {
      final v = json['itemList'];
      final arr0 = <CheckListFormItemDetailModelItemList>[];
      v.forEach((v) {
        arr0.add(CheckListFormItemDetailModelItemList.fromJson(v));
      });
      itemList = arr0;
    }
    fromResult = json['fromResult']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['formName'] = formName;
    data['formType'] = formType;
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
    data['fromResult'] = fromResult;
    return data;
  }
}
