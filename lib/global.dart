import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pms_mobile/service/index.dart';
import 'package:pms_mobile/store/index.dart';
import 'package:pms_mobile/utils/index.dart';

class Global {
  static Future<void> init() async {
    try {
      await Get.putAsync(() => StorageService().init());
      Get.put<AppStore>(AppStore());
      Get.put<HttpService>(HttpService());
      Get.put<UserStore>(UserStore());
      await _initNotificationService();
      // 锁定屏幕
      await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
      checkAppVersion();
    } catch (e) {
      UtilLog.error('初始化', e);
    }
  }
}

// 初始化 Notification Service
_initNotificationService() async {
  try {
    Get.put<NotificationService>(NotificationService());
    await NotificationService.to.createNotificationChannel(kAndroidChannelNewMessage);
  } catch (e) {
    UtilLog.error('初始化 Notification Service', e);
  }
}
