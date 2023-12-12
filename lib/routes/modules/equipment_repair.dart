part of 'index.dart';

final equipmentRepairRoutes = [
  GetPage(
    name: Routes.equipmentRepairConfirm,
    page: () => const EquipmentRepairConfirmPage(),
    middlewares: [RouteAuthMiddleware()],
    transition: kRouteTransition,
  ),
  GetPage(
    name: Routes.engineerRepair,
    page: () => const EngineerRepairPage(),
    binding: BindingsBuilder(() {
      Get.put(EngineerRepairController());
    }),
    middlewares: [RouteAuthMiddleware()],
    transition: kRouteTransition,
  ),
];
