import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pms_mobile/routes/constants.dart';
import 'package:pms_mobile/store/index.dart';

class RouteAuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (UserStore.to.isLogged) {
      return null;
    } else {
      return const RouteSettings(name: Routes.login);
    }
  }
}
