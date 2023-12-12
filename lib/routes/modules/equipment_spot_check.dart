part of 'index.dart';

final equipmentSpotCheckRoutes = [
  GetPage(
    name: Routes.equipmentSpotCheckSignIn,
    page: () => const EquipmentSpotCheckSignInPage(),
    binding: BindingsBuilder(() {
      Get.put(EquipmentSpotCheckSignInController());
      Get.put(EquipmentSpotCheckController());
    }),
    middlewares: [RouteAuthMiddleware()],
    transition: kRouteTransition,
  ),
];
