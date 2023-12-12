class EquipmentMaintainPlanListModelCompletedPMList {
/*
{
  "id": "435723532521541",
  "scheduleName": "测试 计划1",
  "eqpName": "55",
  "line": "测试/测试-1/测试-2",
  "planHours": 10,
  "planExecuteTime": "2023-07-05 15:43:05",
  "pmeFormId": "414"
} 
*/

  String? id;
  String? scheduleName;
  String? eqpName;
  String? line;
  int? planHours;
  String? planExecuteTime;
  String? pmeFormId;

  EquipmentMaintainPlanListModelCompletedPMList({
    this.id,
    this.scheduleName,
    this.eqpName,
    this.line,
    this.planHours,
    this.planExecuteTime,
    this.pmeFormId,
  });
  EquipmentMaintainPlanListModelCompletedPMList.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    scheduleName = json['scheduleName']?.toString();
    eqpName = json['eqpName']?.toString();
    line = json['line']?.toString();
    planHours = json['planHours']?.toInt();
    planExecuteTime = json['planExecuteTime']?.toString();
    pmeFormId = json['pmeFormId']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['scheduleName'] = scheduleName;
    data['eqpName'] = eqpName;
    data['line'] = line;
    data['planHours'] = planHours;
    data['planExecuteTime'] = planExecuteTime;
    data['pmeFormId'] = pmeFormId;
    return data;
  }
}

class EquipmentMaintainPlanListModelToBePMList {
/*
{
  "id": "435735910551621",
  "scheduleName": "测试备注4",
  "eqpName": "22",
  "line": "测试/测试-1/测试-2",
  "planHours": 8,
  "planExecuteTime": "2023-07-05 16:33:28"
} 
*/

  String? id;
  String? scheduleName;
  String? eqpName;
  String? line;
  int? planHours;
  String? planExecuteTime;

  EquipmentMaintainPlanListModelToBePMList({
    this.id,
    this.scheduleName,
    this.eqpName,
    this.line,
    this.planHours,
    this.planExecuteTime,
  });
  EquipmentMaintainPlanListModelToBePMList.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    scheduleName = json['scheduleName']?.toString();
    eqpName = json['eqpName']?.toString();
    line = json['line']?.toString();
    planHours = json['planHours']?.toInt();
    planExecuteTime = json['planExecuteTime']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['scheduleName'] = scheduleName;
    data['eqpName'] = eqpName;
    data['line'] = line;
    data['planHours'] = planHours;
    data['planExecuteTime'] = planExecuteTime;
    return data;
  }
}

class EquipmentMaintainPlanListModel {
/*
{
  "toBePMList": [
    {
      "id": "435735910551621",
      "scheduleName": "测试备注4",
      "eqpName": "22",
      "line": "测试/测试-1/测试-2",
      "planHours": 8,
      "planExecuteTime": "2023-07-05 16:33:28"
    }
  ],
  "toBePMNumber": 1,
  "completedPMList": [
    {
      "id": "435723532521541",
      "scheduleName": "测试 计划1",
      "eqpName": "55",
      "line": "测试/测试-1/测试-2",
      "planHours": 10,
      "planExecuteTime": "2023-07-05 15:43:05",
      "pmeFormId": "414"
    }
  ],
  "completedPMNumber": 2
} 
*/

  List<EquipmentMaintainPlanListModelToBePMList?>? toBePMList;
  int? toBePMNumber;
  List<EquipmentMaintainPlanListModelCompletedPMList?>? completedPMList;
  int? completedPMNumber;

  EquipmentMaintainPlanListModel({
    this.toBePMList,
    this.toBePMNumber,
    this.completedPMList,
    this.completedPMNumber,
  });
  EquipmentMaintainPlanListModel.fromJson(Map<String, dynamic> json) {
    if (json['toBePMList'] != null) {
      final v = json['toBePMList'];
      final arr0 = <EquipmentMaintainPlanListModelToBePMList>[];
      v.forEach((v) {
        arr0.add(EquipmentMaintainPlanListModelToBePMList.fromJson(v));
      });
      toBePMList = arr0;
    }
    toBePMNumber = json['toBePMNumber']?.toInt();
    if (json['completedPMList'] != null) {
      final v = json['completedPMList'];
      final arr0 = <EquipmentMaintainPlanListModelCompletedPMList>[];
      v.forEach((v) {
        arr0.add(EquipmentMaintainPlanListModelCompletedPMList.fromJson(v));
      });
      completedPMList = arr0;
    }
    completedPMNumber = json['completedPMNumber']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (toBePMList != null) {
      final v = toBePMList;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v!.toJson());
      }
      data['toBePMList'] = arr0;
    }
    data['toBePMNumber'] = toBePMNumber;
    if (completedPMList != null) {
      final v = completedPMList;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v!.toJson());
      }
      data['completedPMList'] = arr0;
    }
    data['completedPMNumber'] = completedPMNumber;
    return data;
  }
}
