class EquipmentAwaitTakeOrderListModelToBeTakeOverList {
/*
{
  "id": "489541752221765",
  "flowNo": "C20231204173031371",
  "flowType": "ED",
  "callType": "Down",
  "eqpId": "mm_test_21",
  "line": "factory1/MM/MM_2",
  "state": 1,
  "creator": "ptadmin",
  "createTime": "2023-12-05 19:02:44",
  "currentHandler": "MM_001"
} 
*/

  String? id;
  String? flowNo;
  String? flowType;
  String? callType;
  String? eqpId;
  String? line;
  int? state;
  String? creator;
  String? createTime;
  String? currentHandler;

  EquipmentAwaitTakeOrderListModelToBeTakeOverList({
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
  EquipmentAwaitTakeOrderListModelToBeTakeOverList.fromJson(Map<String, dynamic> json) {
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

class EquipmentAwaitTakeOrderListModel {
/*
{
  "toBeTakeOverList": [
    {
      "id": "489541752221765",
      "flowNo": "C20231204173031371",
      "flowType": "ED",
      "callType": "Down",
      "eqpId": "mm_test_21",
      "line": "factory1/MM/MM_2",
      "state": 1,
      "creator": "ptadmin",
      "createTime": "2023-12-05 19:02:44",
      "currentHandler": "MM_001"
    }
  ],
  "toBeTakeOverNumber": 29
} 
*/

  List<EquipmentAwaitTakeOrderListModelToBeTakeOverList?>? toBeTakeOverList;
  int? toBeTakeOverNumber;

  EquipmentAwaitTakeOrderListModel({
    this.toBeTakeOverList,
    this.toBeTakeOverNumber,
  });
  EquipmentAwaitTakeOrderListModel.fromJson(Map<String, dynamic> json) {
    if (json['toBeTakeOverList'] != null) {
      final v = json['toBeTakeOverList'];
      final arr0 = <EquipmentAwaitTakeOrderListModelToBeTakeOverList>[];
      v.forEach((v) {
        arr0.add(EquipmentAwaitTakeOrderListModelToBeTakeOverList.fromJson(v));
      });
      toBeTakeOverList = arr0;
    }
    toBeTakeOverNumber = json['toBeTakeOverNumber']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (toBeTakeOverList != null) {
      final v = toBeTakeOverList;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v!.toJson());
      }
      data['toBeTakeOverList'] = arr0;
    }
    data['toBeTakeOverNumber'] = toBeTakeOverNumber;
    return data;
  }
}
