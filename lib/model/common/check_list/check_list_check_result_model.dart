class CheckListCheckResultModel {
/*
{
  "result": 1,
  "judgeReason": "4"
} 
*/

  int? result;
  String? judgeReason;

  CheckListCheckResultModel({
    this.result,
    this.judgeReason,
  });
  CheckListCheckResultModel.fromJson(Map<String, dynamic> json) {
    result = json['result']?.toInt();
    judgeReason = json['judgeReason']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['result'] = result;
    data['judgeReason'] = judgeReason;
    return data;
  }
}
