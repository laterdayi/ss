class AppConfigModel {
/*
{
  "themeMode": 1,
  "language": 1,
} 
*/

  late int themeMode;
  late int language;

  AppConfigModel({
    required this.themeMode,
    required this.language,
  });
  AppConfigModel.fromJson(Map<String, dynamic> json) {
    themeMode = json['themeMode']?.toInt();
    language = json['language']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['themeMode'] = themeMode;
    data['language'] = language;
    return data;
  }
}
