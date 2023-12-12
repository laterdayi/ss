class SendCallFlowTypeModel {
/*
{
  "id": "QC",
  "name": "QC",
  "order": 1
} 
*/

  String? id;
  String? name;
  int? order;

  SendCallFlowTypeModel({
    this.id,
    this.name,
    this.order,
  });
  SendCallFlowTypeModel.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    name = json['name']?.toString();
    order = json['order']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['order'] = order;
    return data;
  }
}
