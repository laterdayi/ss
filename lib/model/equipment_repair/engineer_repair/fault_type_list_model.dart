///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class FaultTypeListModel {
/*
{
  "id": "故障类型01",
  "name": "故障类型01",
} 
*/

  String? id;
  String? name;

  FaultTypeListModel({
    this.id,
    this.name,
  });
  FaultTypeListModel.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    name = json['name']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}