import 'package:get/get.dart';
import 'package:pms_mobile/middleware/router_auth.dart';
import 'package:pms_mobile/pages/common/check_list/index.dart';
import 'package:pms_mobile/pages/common/check_list_detail/index.dart';
import 'package:pms_mobile/pages/debug/debug.dart';
import 'package:pms_mobile/pages/equipment_maintain/equipment_maintain/index.dart';
import 'package:pms_mobile/pages/equipment_repair/index.dart';
import 'package:pms_mobile/pages/equipment_spot_check/equipment_spot_check/index.dart';
import 'package:pms_mobile/pages/home/index.dart';
import 'package:pms_mobile/pages/login/login.dart';
import 'package:pms_mobile/pages/personal_center/personal_center.dart';
import 'package:pms_mobile/pages/send_call/index.dart';
import 'package:pms_mobile/routes/modules/index.dart';
import 'package:pms_mobile/store/index.dart';

import 'constants.dart';

class AppPages {
  AppPages._();
  // 主页
  static const initial = Routes.home;
  static final routes = [
    // 登录
    GetPage(name: Routes.login, page: () => const LoginPage(), transition: kRouteTransition),
    // 首页
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      binding: BindingsBuilder(() {
        Get.put(HomeController());
        Get.put(EquipmentSpotCheckController());
        Get.put(EquipmentRepairController());
        Get.put(EquipmentMaintainController());
        Get.put(SendCallController());
      }),
      middlewares: [RouteAuthMiddleware()],
      transition: kRouteTransition,
    ),
    // 用户中心
    GetPage(
      name: Routes.personalCenter,
      page: () => const PersonalCenterPage(),
      middlewares: [RouteAuthMiddleware()],
      transition: kRouteTransition,
    ),
    // Debug
    GetPage(
      name: Routes.debug,
      page: () => const DebugPage(),
      binding: BindingsBuilder(() {
        Get.put(AppStore());
      }),
      transition: kRouteTransition,
    ),
    // 设置
    ...settingRoutes,
    ...equipmentSpotCheckRoutes,
    ...equipmentRepairRoutes,
    ...equipmentMaintainRoutes,

    // 发起呼叫
    GetPage(
      name: Routes.sendCall,
      page: () => const SendCallPage(),
      binding: BindingsBuilder(() {
        Get.put(SendCallController());
      }),
      middlewares: [RouteAuthMiddleware()],
      transition: kRouteTransition,
    ),
    // 检查表
    GetPage(
      name: Routes.checkList,
      page: () => CheckListPage(),
      binding: BindingsBuilder(() {
        Get.put(CheckListController());
        Get.put(EquipmentRepairController());
        Get.put(EquipmentMaintainController());
      }),
      middlewares: [RouteAuthMiddleware()],
      transition: kRouteTransition,
    ),
    // 检查表详情
    GetPage(
      name: Routes.checkListDetail,
      page: () => const CheckListDetailPage(),
      binding: BindingsBuilder(() {
        Get.put(CheckListDetailController());
        Get.put(EquipmentMaintainController());
      }),
      middlewares: [RouteAuthMiddleware()],
      transition: kRouteTransition,
    ),
  ];
}
