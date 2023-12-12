class OptionsModel {
/*
{
  "id": "LOCATION_ID_TEST0",
  "name": "LOCATION_DESC_TEST0"
} 
*/

  String? id;
  String? name;

  OptionsModel({
    this.id,
    this.name,
  });
  OptionsModel.fromJson(Map<String, dynamic> json) {
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
