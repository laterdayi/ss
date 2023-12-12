class DebugConfigModel {
/*
{
  "baseApi": "baseApi",
  "proxyApi": "proxyApi"
} 
*/

  String? baseApi;
  String? proxyApi;

  DebugConfigModel({
    this.baseApi,
    this.proxyApi,
  });
  DebugConfigModel.fromJson(Map<String, dynamic> json) {
    baseApi = json['baseApi']?.toString();
    proxyApi = json['proxyApi']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['baseApi'] = baseApi;
    data['proxyApi'] = proxyApi;
    return data;
  }
}
