class MaintainPlanDetailModel {
/*
{
  "id": "436413724713030",
  "scheduleName": "aaa",
  "eqpName": "222",
  "line": "s",
  "planHours": 2,
  "planExecuteTime": "2023-07-09 14:31:32",
  "pmeFormId": "s",
  "guideFile": "s"
} 
*/

  String? id;
  String? scheduleName;
  String? eqpName;
  String? line;
  int? planHours;
  String? planExecuteTime;
  String? pmeFormId;
  String? guideFile;

  MaintainPlanDetailModel({
    this.id,
    this.scheduleName,
    this.eqpName,
    this.line,
    this.planHours,
    this.planExecuteTime,
    this.pmeFormId,
    this.guideFile,
  });
  MaintainPlanDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    scheduleName = json['scheduleName']?.toString();
    eqpName = json['eqpName']?.toString();
    line = json['line']?.toString();
    planHours = json['planHours']?.toInt();
    planExecuteTime = json['planExecuteTime']?.toString();
    pmeFormId = json['pmeFormId']?.toString();
    guideFile = json['guideFile']?.toString();
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
    data['guideFile'] = guideFile;
    return data;
  }
}
