import 'package:pms_mobile/service/http/constants.dart';

class UserApis {
  // 登录
  static String loginApi = "${kApiPrefix.config}/login/login";
  // 退出登录
  static String logoutApi = "${kApiPrefix.config}/login/Logout";
  // 获取用户信息
  static String getUserInfoApi = "${kApiPrefix.config}/user/info";
  // 获取菜单
  static String getMenuApi = "${kApiPrefix.config}/Menu/GetAppRoutes";
}
