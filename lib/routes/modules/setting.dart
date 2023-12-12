part of 'index.dart';

final settingRoutes = [
  // 设置
  GetPage(
    name: Routes.setting,
    page: () => const SettingPage(),
    middlewares: [RouteAuthMiddleware()],
    transition: kRouteTransition,
  ),
  // 关于
  GetPage(
    name: Routes.about,
    page: () => const SettingAboutPage(),
    middlewares: [RouteAuthMiddleware()],
    transition: kRouteTransition,
  ),
  // 储存空间
  GetPage(
    name: Routes.settingStorageSpace,
    page: () => const SettingStorageSpacePage(),
    middlewares: [RouteAuthMiddleware()],
    transition: kRouteTransition,
  ),
];
