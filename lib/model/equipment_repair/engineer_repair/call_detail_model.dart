class CallDetailModel {
/*
{
  "id": 490969694855237,
  "flowNo": "C20231208182050178",
  "line": "factory1/wss测试/wssEqpType04",
  "eqpId": "wsseqp304",
  "eqpType": 489913344131141,
  "flowType": "EE",
  "callType": "Down",
  "creator": "wssee01",
  "systemTime": "2023-12-10 15:20:09",
  "state": 2,
  "stageFlag": 1,
  "callEFormHistoryId": "491921765474373"
} 
*/

  int? id;
  String? flowNo;
  String? line;
  String? eqpId;
  int? eqpType;
  String? flowType;
  String? callType;
  String? creator;
  String? systemTime;
  int? state;
  int? stageFlag;
  String? callEFormHistoryId;

  CallDetailModel({
    this.id,
    this.flowNo,
    this.line,
    this.eqpId,
    this.eqpType,
    this.flowType,
    this.callType,
    this.creator,
    this.systemTime,
    this.state,
    this.stageFlag,
    this.callEFormHistoryId,
  });
  CallDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    flowNo = json['flowNo']?.toString();
    line = json['line']?.toString();
    eqpId = json['eqpId']?.toString();
    eqpType = json['eqpType']?.toInt();
    flowType = json['flowType']?.toString();
    callType = json['callType']?.toString();
    creator = json['creator']?.toString();
    systemTime = json['systemTime']?.toString();
    state = json['state']?.toInt();
    stageFlag = json['stageFlag']?.toInt();
    callEFormHistoryId = json['callEFormHistoryId']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['flowNo'] = flowNo;
    data['line'] = line;
    data['eqpId'] = eqpId;
    data['eqpType'] = eqpType;
    data['flowType'] = flowType;
    data['callType'] = callType;
    data['creator'] = creator;
    data['systemTime'] = systemTime;
    data['state'] = state;
    data['stageFlag'] = stageFlag;
    data['callEFormHistoryId'] = callEFormHistoryId;
    return data;
  }
}
