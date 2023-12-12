import 'package:pms_mobile/model/common/options_model.dart';

class TakeOrderDataModel {
/*
{
  "transferItem": {
    "id": "1",
    "name": "2"
  },
  "description": "2"
} 
*/

  OptionsModel? transferItem;
  String? description;

  TakeOrderDataModel({
    this.transferItem,
    this.description,
  });
  TakeOrderDataModel.fromJson(Map<String, dynamic> json) {
    transferItem = (json['transferItem'] != null) ? OptionsModel.fromJson(json['transferItem']) : null;
    description = json['description']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (transferItem != null) {
      data['transferItem'] = transferItem!.toJson();
    }
    data['description'] = description;
    return data;
  }
}
