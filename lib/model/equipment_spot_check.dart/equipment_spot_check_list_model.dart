class EquipmentSpotCheckListModelCompletedSpotCheckList {
/*
{
  "id": "469959723872325",
  "planName": "asd444",
  "eqpName": "ceshi2",
  "line": "Fab/Area1/清洗机",
  "planExecuteTime": "2023-10-10 09:30:23",
  "earliestTime": "2023-10-09 09:30:23",
  "latestTime": "2023-10-11 09:30:23",
  "actualExecuteTime": "2023-10-10 13:27:21",
  "spotCheckEFormId": "470017801818181",
  "advanceUnit": 1,
  "advanceNumber": 1,
  "delayUnit": 1,
  "delayNumber": 1
} 
*/

  String? id;
  String? planName;
  String? eqpName;
  String? line;
  String? planExecuteTime;
  String? earliestTime;
  String? latestTime;
  String? actualExecuteTime;
  String? spotCheckEFormId;
  int? advanceUnit;
  int? advanceNumber;
  int? delayUnit;
  int? delayNumber;

  EquipmentSpotCheckListModelCompletedSpotCheckList({
    this.id,
    this.planName,
    this.eqpName,
    this.line,
    this.planExecuteTime,
    this.earliestTime,
    this.latestTime,
    this.actualExecuteTime,
    this.spotCheckEFormId,
    this.advanceUnit,
    this.advanceNumber,
    this.delayUnit,
    this.delayNumber,
  });
  EquipmentSpotCheckListModelCompletedSpotCheckList.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    planName = json['planName']?.toString();
    eqpName = json['eqpName']?.toString();
    line = json['line']?.toString();
    planExecuteTime = json['planExecuteTime']?.toString();
    earliestTime = json['earliestTime']?.toString();
    latestTime = json['latestTime']?.toString();
    actualExecuteTime = json['actualExecuteTime']?.toString();
    spotCheckEFormId = json['spotCheckEFormId']?.toString();
    advanceUnit = json['advanceUnit']?.toInt();
    advanceNumber = json['advanceNumber']?.toInt();
    delayUnit = json['delayUnit']?.toInt();
    delayNumber = json['delayNumber']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['planName'] = planName;
    data['eqpName'] = eqpName;
    data['line'] = line;
    data['planExecuteTime'] = planExecuteTime;
    data['earliestTime'] = earliestTime;
    data['latestTime'] = latestTime;
    data['actualExecuteTime'] = actualExecuteTime;
    data['spotCheckEFormId'] = spotCheckEFormId;
    data['advanceUnit'] = advanceUnit;
    data['advanceNumber'] = advanceNumber;
    data['delayUnit'] = delayUnit;
    data['delayNumber'] = delayNumber;
    return data;
  }
}

class EquipmentSpotCheckListModelCheckInList {
/*
{
  "id": "469959723876425",
  "planName": "asd444",
  "eqpName": "ceshi2",
  "line": "Fab/Area1/清洗机",
  "planExecuteTime": "2023-10-10 15:30:23",
  "earliestTime": "2023-10-09 15:30:23",
  "latestTime": "2023-10-11 15:30:23",
  "actualExecuteTime": null,
  "spotCheckEFormId": null,
  "advanceUnit": 1,
  "advanceNumber": 1,
  "delayUnit": 1,
  "delayNumber": 1
} 
*/

  String? id;
  String? planName;
  String? eqpName;
  String? line;
  String? planExecuteTime;
  String? earliestTime;
  String? latestTime;
  String? actualExecuteTime;
  String? spotCheckEFormId;
  int? advanceUnit;
  int? advanceNumber;
  int? delayUnit;
  int? delayNumber;

  EquipmentSpotCheckListModelCheckInList({
    this.id,
    this.planName,
    this.eqpName,
    this.line,
    this.planExecuteTime,
    this.earliestTime,
    this.latestTime,
    this.actualExecuteTime,
    this.spotCheckEFormId,
    this.advanceUnit,
    this.advanceNumber,
    this.delayUnit,
    this.delayNumber,
  });
  EquipmentSpotCheckListModelCheckInList.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    planName = json['planName']?.toString();
    eqpName = json['eqpName']?.toString();
    line = json['line']?.toString();
    planExecuteTime = json['planExecuteTime']?.toString();
    earliestTime = json['earliestTime']?.toString();
    latestTime = json['latestTime']?.toString();
    actualExecuteTime = json['actualExecuteTime']?.toString();
    spotCheckEFormId = json['spotCheckEFormId']?.toString();
    advanceUnit = json['advanceUnit']?.toInt();
    advanceNumber = json['advanceNumber']?.toInt();
    delayUnit = json['delayUnit']?.toInt();
    delayNumber = json['delayNumber']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['planName'] = planName;
    data['eqpName'] = eqpName;
    data['line'] = line;
    data['planExecuteTime'] = planExecuteTime;
    data['earliestTime'] = earliestTime;
    data['latestTime'] = latestTime;
    data['actualExecuteTime'] = actualExecuteTime;
    data['spotCheckEFormId'] = spotCheckEFormId;
    data['advanceUnit'] = advanceUnit;
    data['advanceNumber'] = advanceNumber;
    data['delayUnit'] = delayUnit;
    data['delayNumber'] = delayNumber;
    return data;
  }
}

class EquipmentSpotCheckListModelToBeSpotCheckList {
/*
{
  "id": "469959723884614",
  "planName": "asd444",
  "eqpName": "ceshi2",
  "line": "Fab/Area1/清洗机",
  "planExecuteTime": "2023-10-11 01:30:23",
  "earliestTime": "2023-10-10 01:30:23",
  "latestTime": "2023-10-12 01:30:23",
  "actualExecuteTime": null,
  "spotCheckEFormId": null,
  "advanceUnit": 1,
  "advanceNumber": 1,
  "delayUnit": 1,
  "delayNumber": 1
} 
*/

  String? id;
  String? planName;
  String? eqpName;
  String? line;
  String? planExecuteTime;
  String? earliestTime;
  String? latestTime;
  String? actualExecuteTime;
  String? spotCheckEFormId;
  int? advanceUnit;
  int? advanceNumber;
  int? delayUnit;
  int? delayNumber;

  EquipmentSpotCheckListModelToBeSpotCheckList({
    this.id,
    this.planName,
    this.eqpName,
    this.line,
    this.planExecuteTime,
    this.earliestTime,
    this.latestTime,
    this.actualExecuteTime,
    this.spotCheckEFormId,
    this.advanceUnit,
    this.advanceNumber,
    this.delayUnit,
    this.delayNumber,
  });
  EquipmentSpotCheckListModelToBeSpotCheckList.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    planName = json['planName']?.toString();
    eqpName = json['eqpName']?.toString();
    line = json['line']?.toString();
    planExecuteTime = json['planExecuteTime']?.toString();
    earliestTime = json['earliestTime']?.toString();
    latestTime = json['latestTime']?.toString();
    actualExecuteTime = json['actualExecuteTime']?.toString();
    spotCheckEFormId = json['spotCheckEFormId']?.toString();
    advanceUnit = json['advanceUnit']?.toInt();
    advanceNumber = json['advanceNumber']?.toInt();
    delayUnit = json['delayUnit']?.toInt();
    delayNumber = json['delayNumber']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['planName'] = planName;
    data['eqpName'] = eqpName;
    data['line'] = line;
    data['planExecuteTime'] = planExecuteTime;
    data['earliestTime'] = earliestTime;
    data['latestTime'] = latestTime;
    data['actualExecuteTime'] = actualExecuteTime;
    data['spotCheckEFormId'] = spotCheckEFormId;
    data['advanceUnit'] = advanceUnit;
    data['advanceNumber'] = advanceNumber;
    data['delayUnit'] = delayUnit;
    data['delayNumber'] = delayNumber;
    return data;
  }
}

class EquipmentSpotCheckListModel {
/*
{
  "toBeSpotCheckList": [
    {
      "id": "469959723884614",
      "planName": "asd444",
      "eqpName": "ceshi2",
      "line": "Fab/Area1/清洗机",
      "planExecuteTime": "2023-10-11 01:30:23",
      "earliestTime": "2023-10-10 01:30:23",
      "latestTime": "2023-10-12 01:30:23",
      "actualExecuteTime": null,
      "spotCheckEFormId": null,
      "advanceUnit": 1,
      "advanceNumber": 1,
      "delayUnit": 1,
      "delayNumber": 1
    }
  ],
  "toBeSpotCheckNumber": 18,
  "checkInList": [
    {
      "id": "469959723876425",
      "planName": "asd444",
      "eqpName": "ceshi2",
      "line": "Fab/Area1/清洗机",
      "planExecuteTime": "2023-10-10 15:30:23",
      "earliestTime": "2023-10-09 15:30:23",
      "latestTime": "2023-10-11 15:30:23",
      "actualExecuteTime": null,
      "spotCheckEFormId": null,
      "advanceUnit": 1,
      "advanceNumber": 1,
      "delayUnit": 1,
      "delayNumber": 1
    }
  ],
  "checkInNumber": 10,
  "completedSpotCheckList": [
    {
      "id": "469959723872325",
      "planName": "asd444",
      "eqpName": "ceshi2",
      "line": "Fab/Area1/清洗机",
      "planExecuteTime": "2023-10-10 09:30:23",
      "earliestTime": "2023-10-09 09:30:23",
      "latestTime": "2023-10-11 09:30:23",
      "actualExecuteTime": "2023-10-10 13:27:21",
      "spotCheckEFormId": "470017801818181",
      "advanceUnit": 1,
      "advanceNumber": 1,
      "delayUnit": 1,
      "delayNumber": 1
    }
  ],
  "completedSpotCheckNumber": 6
} 
*/

  List<EquipmentSpotCheckListModelToBeSpotCheckList?>? toBeSpotCheckList;
  int? toBeSpotCheckNumber;
  List<EquipmentSpotCheckListModelCheckInList?>? checkInList;
  int? checkInNumber;
  List<EquipmentSpotCheckListModelCompletedSpotCheckList?>? completedSpotCheckList;
  int? completedSpotCheckNumber;

  EquipmentSpotCheckListModel({
    this.toBeSpotCheckList,
    this.toBeSpotCheckNumber,
    this.checkInList,
    this.checkInNumber,
    this.completedSpotCheckList,
    this.completedSpotCheckNumber,
  });
  EquipmentSpotCheckListModel.fromJson(Map<String, dynamic> json) {
    if (json['toBeSpotCheckList'] != null) {
      final v = json['toBeSpotCheckList'];
      final arr0 = <EquipmentSpotCheckListModelToBeSpotCheckList>[];
      v.forEach((v) {
        arr0.add(EquipmentSpotCheckListModelToBeSpotCheckList.fromJson(v));
      });
      toBeSpotCheckList = arr0;
    }
    toBeSpotCheckNumber = json['toBeSpotCheckNumber']?.toInt();
    if (json['checkInList'] != null) {
      final v = json['checkInList'];
      final arr0 = <EquipmentSpotCheckListModelCheckInList>[];
      v.forEach((v) {
        arr0.add(EquipmentSpotCheckListModelCheckInList.fromJson(v));
      });
      checkInList = arr0;
    }
    checkInNumber = json['checkInNumber']?.toInt();
    if (json['completedSpotCheckList'] != null) {
      final v = json['completedSpotCheckList'];
      final arr0 = <EquipmentSpotCheckListModelCompletedSpotCheckList>[];
      v.forEach((v) {
        arr0.add(EquipmentSpotCheckListModelCompletedSpotCheckList.fromJson(v));
      });
      completedSpotCheckList = arr0;
    }
    completedSpotCheckNumber = json['completedSpotCheckNumber']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (toBeSpotCheckList != null) {
      final v = toBeSpotCheckList;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v!.toJson());
      }
      data['toBeSpotCheckList'] = arr0;
    }
    data['toBeSpotCheckNumber'] = toBeSpotCheckNumber;
    if (checkInList != null) {
      final v = checkInList;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v!.toJson());
      }
      data['checkInList'] = arr0;
    }
    data['checkInNumber'] = checkInNumber;
    if (completedSpotCheckList != null) {
      final v = completedSpotCheckList;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v!.toJson());
      }
      data['completedSpotCheckList'] = arr0;
    }
    data['completedSpotCheckNumber'] = completedSpotCheckNumber;
    return data;
  }
}
