import 'package:pms_mobile/apis/user.dart';

// Url, 优先级低于 Debug Config BaseApi
// String kBaseApi = 'http://10.100.10.85:8100';
String kBaseApi = 'http://10.16.7.189:9004/apis';

// API Auth 白名单
List<String> kApiAuthWhiteList = [UserApis.loginApi];

// 返回失败
const int kResponseSingleError = 0;
// 返回成功
const int kResponseSuccess = 1;
// 返回 Format 的错误代码
const int kResponseFormatError = 2;
// 直接抛异常
const int kResponseThrowError = 4;

// Token 过期
List<int> kAuthError = [1011, 1012];
// 超时时间
Duration kTimeOut = const Duration(seconds: 15);

// 接口前缀
ApiPrefix kApiPrefix = ApiPrefix();

class ApiPrefix {
  final String ams = '/ams';
  final String pms = '/pms';
  final String config = '/config';
}
