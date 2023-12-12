abstract class Identifiable {
  String? get id;
  String? get eqpId;
}

class EquipmentRepairListModelCompletedList extends Identifiable {
/*
{
  "id": "480672289353797",
  "flowNo": "C20231109160035163",
  "flowType": "QC",
  "callType": "QC",
  "eqpId": "11",
  "line": "factory1/Line-1/EqpType01",
  "state": 9,
  "creator": "ptadmin",
  "createTime": "2023-11-09 16:00:35",
  "currentHandler": "ptadmin"
} 
*/

  @override
  String? id;
  String? flowNo;
  String? flowType;
  String? callType;
  @override
  String? eqpId;
  String? line;
  int? state;
  String? creator;
  String? createTime;
  String? currentHandler;

  EquipmentRepairListModelCompletedList({
    this.id,
    this.flowNo,
    this.flowType,
    this.callType,
    this.eqpId,
    this.line,
    this.state,
    this.creator,
    this.createTime,
    this.currentHandler,
  });
  EquipmentRepairListModelCompletedList.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    flowNo = json['flowNo']?.toString();
    flowType = json['flowType']?.toString();
    callType = json['callType']?.toString();
    eqpId = json['eqpId']?.toString();
    line = json['line']?.toString();
    state = json['state']?.toInt();
    creator = json['creator']?.toString();
    createTime = json['createTime']?.toString();
    currentHandler = json['currentHandler']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['flowNo'] = flowNo;
    data['callType'] = callType;
    data['flowType'] = flowType;
    data['eqpId'] = eqpId;
    data['line'] = line;
    data['state'] = state;
    data['creator'] = creator;
    data['createTime'] = createTime;
    data['currentHandler'] = currentHandler;
    return data;
  }
}

class EquipmentRepairListModelInCheckList extends Identifiable {
/*
{
  "id": "480658596520005",
  "flowNo": "C20231109150452186",
  "flowType": "EE",
  "callType": "ED",
  "eqpId": "1",
  "line": "factory1/Line-1/EqpType01",
  "state": 3,
  "creator": "ptadmin",
  "createTime": "2023-11-09 15:04:52",
  "currentHandler": "ptadmin"
} 
*/

  @override
  String? id;
  String? flowNo;
  String? flowType;
  String? callType;
  @override
  String? eqpId;
  String? line;
  int? state;
  String? creator;
  String? createTime;
  String? currentHandler;

  EquipmentRepairListModelInCheckList({
    this.id,
    this.flowNo,
    this.flowType,
    this.callType,
    this.eqpId,
    this.line,
    this.state,
    this.creator,
    this.createTime,
    this.currentHandler,
  });
  EquipmentRepairListModelInCheckList.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    flowNo = json['flowNo']?.toString();
    flowType = json['flowType']?.toString();
    callType = json['callType']?.toString();
    eqpId = json['eqpId']?.toString();
    line = json['line']?.toString();
    state = json['state']?.toInt();
    creator = json['creator']?.toString();
    createTime = json['createTime']?.toString();
    currentHandler = json['currentHandler']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['flowNo'] = flowNo;
    data['flowType'] = flowType;
    data['callType'] = callType;
    data['eqpId'] = eqpId;
    data['line'] = line;
    data['state'] = state;
    data['creator'] = creator;
    data['createTime'] = createTime;
    data['currentHandler'] = currentHandler;
    return data;
  }
}

class EquipmentRepairListModelInRepairList extends Identifiable {
/*
{
  "id": "480960811122757",
  "flowNo": "C20231110113435048",
  "flowType": "ED",
  "callType": "ED",
  "eqpId": "33",
  "line": "factory1/Line-1/EqpType01",
  "state": 2,
  "creator": "T0001",
  "createTime": "2023-11-10 11:34:35",
  "currentHandler": "ptadmin"
} 
*/

  @override
  String? id;
  String? flowNo;
  String? flowType;
  String? callType;
  @override
  String? eqpId;
  String? line;
  int? state;
  String? creator;
  String? createTime;
  String? currentHandler;

  EquipmentRepairListModelInRepairList({
    this.id,
    this.flowNo,
    this.flowType,
    this.callType,
    this.eqpId,
    this.line,
    this.state,
    this.creator,
    this.createTime,
    this.currentHandler,
  });
  EquipmentRepairListModelInRepairList.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    flowNo = json['flowNo']?.toString();
    callType = json['callType']?.toString();
    flowType = json['flowType']?.toString();
    eqpId = json['eqpId']?.toString();
    line = json['line']?.toString();
    state = json['state']?.toInt();
    creator = json['creator']?.toString();
    createTime = json['createTime']?.toString();
    currentHandler = json['currentHandler']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['flowNo'] = flowNo;
    data['flowType'] = flowType;
    data['callType'] = callType;
    data['eqpId'] = eqpId;
    data['line'] = line;
    data['state'] = state;
    data['creator'] = creator;
    data['createTime'] = createTime;
    data['currentHandler'] = currentHandler;
    return data;
  }
}

class EquipmentRepairListModel {
/*
{
  "inRepairList": [
    {
      "id": "480960811122757",
      "flowNo": "C20231110113435048",
      "flowType": "ED",
      "eqpId": "33",
      "line": "factory1/Line-1/EqpType01",
      "state": 2,
      "creator": "T0001",
      "createTime": "2023-11-10 11:34:35",
      "currentHandler": "ptadmin"
    }
  ],
  "inRepairNumber": 3,
  "inCheckList": [
    {
      "id": "480658596520005",
      "flowNo": "C20231109150452186",
      "flowType": "EE",
      "eqpId": "1",
      "line": "factory1/Line-1/EqpType01",
      "state": 3,
      "creator": "ptadmin",
      "createTime": "2023-11-09 15:04:52",
      "currentHandler": "ptadmin"
    }
  ],
  "inCheckNumber": 1,
  "completedList": [
    {
      "id": "480672289353797",
      "flowNo": "C20231109160035163",
      "flowType": "QC",
      "eqpId": "11",
      "line": "factory1/Line-1/EqpType01",
      "state": 9,
      "creator": "ptadmin",
      "createTime": "2023-11-09 16:00:35",
      "currentHandler": "ptadmin"
    }
  ],
  "completedNumber": 4
} 
*/

  List<EquipmentRepairListModelInRepairList?>? inRepairList;
  int? inRepairNumber;
  List<EquipmentRepairListModelInCheckList?>? inCheckList;
  int? inCheckNumber;
  List<EquipmentRepairListModelCompletedList?>? completedList;
  int? completedNumber;

  EquipmentRepairListModel({
    this.inRepairList,
    this.inRepairNumber,
    this.inCheckList,
    this.inCheckNumber,
    this.completedList,
    this.completedNumber,
  });
  EquipmentRepairListModel.fromJson(Map<String, dynamic> json) {
    if (json['inRepairList'] != null) {
      final v = json['inRepairList'];
      final arr0 = <EquipmentRepairListModelInRepairList>[];
      v.forEach((v) {
        arr0.add(EquipmentRepairListModelInRepairList.fromJson(v));
      });
      inRepairList = arr0;
    }
    inRepairNumber = json['inRepairNumber']?.toInt();
    if (json['inCheckList'] != null) {
      final v = json['inCheckList'];
      final arr0 = <EquipmentRepairListModelInCheckList>[];
      v.forEach((v) {
        arr0.add(EquipmentRepairListModelInCheckList.fromJson(v));
      });
      inCheckList = arr0;
    }
    inCheckNumber = json['inCheckNumber']?.toInt();
    if (json['completedList'] != null) {
      final v = json['completedList'];
      final arr0 = <EquipmentRepairListModelCompletedList>[];
      v.forEach((v) {
        arr0.add(EquipmentRepairListModelCompletedList.fromJson(v));
      });
      completedList = arr0;
    }
    completedNumber = json['completedNumber']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (inRepairList != null) {
      final v = inRepairList;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v!.toJson());
      }
      data['inRepairList'] = arr0;
    }
    data['inRepairNumber'] = inRepairNumber;
    if (inCheckList != null) {
      final v = inCheckList;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v!.toJson());
      }
      data['inCheckList'] = arr0;
    }
    data['inCheckNumber'] = inCheckNumber;
    if (completedList != null) {
      final v = completedList;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v!.toJson());
      }
      data['completedList'] = arr0;
    }
    data['completedNumber'] = completedNumber;
    return data;
  }
}
