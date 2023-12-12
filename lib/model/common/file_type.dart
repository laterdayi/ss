import 'package:flutter/material.dart';

class FileType {
/*
{
  "type": "type",
  "icon": "icon"
} 
*/

  late String type;
  late IconData icon;

  FileType({
    this.type = '',
    this.icon = Icons.description_outlined,
  });

  FileType.fromJson(Map<String, dynamic> json) {
    type = json['type'].toString();
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['type'] = type;
    data['icon'] = icon;
    return data;
  }
}
