part of 'index.dart';

class UtilGet {
  // -------------------------------------------------------------------------------------------- > 路由
  static void to(dynamic page) => Get.to(page);

  static void toNamed(
    String page, {
    dynamic arguments,
    int? id,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
  }) {
    Get.toNamed(page, arguments: arguments, id: id, preventDuplicates: preventDuplicates, parameters: parameters);
  }

  static void back<T>({T? result}) => Get.back(result: result);

  static void off(dynamic page) => Get.off(page);

  static void offAllNamed(String newRouteName, {dynamic arguments}) {
    Get.offAllNamed(newRouteName, arguments: arguments);
  }

  static void offAll(dynamic page) => Get.offAll(page);

  static void close(int times) => Get.close(times);

  // -------------------------------------------------------------------------------------------- > 主题
  static void changeThemeMode(ThemeMode themeMode) => Get.changeThemeMode(themeMode);
}
