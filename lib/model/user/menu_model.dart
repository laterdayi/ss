class MenuModelChildren {
/*
{
  "name": "equipmentMaintain",
  "path": "/equipmentMaintain",
  "remark": "设备保养",
  "icon": "ss32",
  "link": 0
} 
*/

  String? name;
  String? path;
  String? remark;
  String? icon;
  int? link;

  MenuModelChildren({
    this.name,
    this.path,
    this.remark,
    this.icon,
    this.link,
  });
  MenuModelChildren.fromJson(Map<String, dynamic> json) {
    name = json['name']?.toString();
    path = json['path']?.toString();
    remark = json['remark']?.toString();
    icon = json['icon']?.toString();
    link = json['link']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['path'] = path;
    data['remark'] = remark;
    data['icon'] = icon;
    data['link'] = link;
    return data;
  }
}

class MenuModel {
/*
{
  "name": "equipmentMaintain",
  "path": "/equipmentMaintain",
  "remark": "设备保养",
  "icon": "ss32",
  "link": 0,
  "children": [
    {
      "name": "equipmentMaintain",
      "path": "/equipmentMaintain",
      "remark": "设备保养",
      "icon": "ss32",
      "link": 0
    }
  ]
} 
*/

  String? name;
  String? path;
  String? remark;
  String? icon;
  int? link;
  List<MenuModelChildren?>? children;

  MenuModel({
    this.name,
    this.path,
    this.remark,
    this.icon,
    this.link,
    this.children,
  });
  MenuModel.fromJson(Map<String, dynamic> json) {
    name = json['name']?.toString();
    path = json['path']?.toString();
    remark = json['remark']?.toString();
    icon = json['icon']?.toString();
    link = json['link']?.toInt();
    if (json['children'] != null) {
      final v = json['children'];
      final arr0 = <MenuModelChildren>[];
      v.forEach((v) {
        arr0.add(MenuModelChildren.fromJson(v));
      });
      children = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['path'] = path;
    data['remark'] = remark;
    data['icon'] = icon;
    data['link'] = link;
    if (children != null) {
      final v = children;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v!.toJson());
      }
      data['children'] = arr0;
    }
    return data;
  }
}
