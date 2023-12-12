class LotInfoModel {
/*
{
  "lotno": "C3AH19374-05"
} 
*/

  String? lotno;

  LotInfoModel({
    this.lotno,
  });
  LotInfoModel.fromJson(Map<String, dynamic> json) {
    lotno = json['lotno']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['lotno'] = lotno;
    return data;
  }
}
