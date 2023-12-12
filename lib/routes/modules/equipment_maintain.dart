part of 'index.dart';

final equipmentMaintainRoutes = [
  GetPage(
    name: Routes.equipmentMaintainScanExecute,
    page: () => const EquipmentMaintainScanExecutePage(),
    binding: BindingsBuilder(() {
      Get.put(EquipmentMaintainScanExecuteController());
    }),
    middlewares: [RouteAuthMiddleware()],
    transition: kRouteTransition,
  ),
];
