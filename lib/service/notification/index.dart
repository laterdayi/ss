part of '../index.dart';

class NotificationService extends GetxService {
  // -------------------------------------------------------------------------------------------- > State & Controller
  static NotificationService get to => Get.find();

  late final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  @override
  void onInit() {
    super.onInit();
    const initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
    const initializationSettings = InitializationSettings(android: initializationSettingsAndroid);
    _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  // 创建通知渠道
  Future<void> createNotificationChannel(AndroidNotificationChannel notificationChannel) async {
    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(notificationChannel);
  }

  // 展示
  Future<void> show({
    required int id,
    String? title,
    String? body,
    required AndroidNotificationDetails androidNotificationDetails,
    DarwinNotificationDetails? iosNotificationDetails,
    String? payload,
  }) async {
    final platformChannelSpecifics = NotificationDetails(
      android: androidNotificationDetails,
      iOS: iosNotificationDetails,
    );
    await _flutterLocalNotificationsPlugin.show(id, title, body, platformChannelSpecifics, payload: payload);
  }
}
