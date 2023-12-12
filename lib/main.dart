import 'dart:async';
import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:pms_mobile/global.dart';
import 'package:pms_mobile/i18n/index.dart';
import 'package:pms_mobile/pages/not_found/index.dart';
import 'package:pms_mobile/pages/setting/appearance.dart';
import 'package:pms_mobile/pages/setting/language.dart';
import 'package:pms_mobile/store/index.dart';
import 'package:pms_mobile/theme.dart';
import 'package:pms_mobile/utils/index.dart';

import 'routes/index.dart';

final botToastBuilder = BotToastInit();

Future<void> main() async {
  // 并非所有错误都能被 Flutter 捕获。有时，错误会被 Zone 捕获
  runZonedGuarded<Future<void>>(() async {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    // 初始化
    await Global.init();
    runApp(const MyApp());
    // Android 状态栏透明沉浸，渲染后进行覆盖状态栏，在渲染前 MaterialApp 会覆盖。
    if (Platform.isAndroid) {
      SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        // 小米沉浸式白条适配
        // systemNavigationBarColor: Color.fromRGBO(53, 64, 85, 1),
      );
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
    FlutterNativeSplash.remove();
  }, (error, stack) {
    UtilLog.error('runZonedGuarded', error, stack: stack);
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // 没有找到路由
      unknownRoute: GetPage(name: '/404', page: () => const NotFoundPage()),
      translations: TranslationService(),
      // 国际化
      localizationsDelegates: const [
        // 上拉加载，下拉刷新
        // 全局国际化
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      // 设置为手机系统的语言
      locale: EnumLanguageMode.getMode(AppStore.to.appConfig.language),
      supportedLocales: const [
        Locale('zh', 'CN'),
        Locale('en', 'US'),
      ],
      fallbackLocale: const Locale('zh', 'CN'),
      // 初始路由
      initialRoute: AppPages.initial,
      // 路由页面
      getPages: AppPages.routes,
      // 主题
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: EnumThemeMode.getMode(AppStore.to.appConfig.themeMode),
      debugShowCheckedModeBanner: false,
      navigatorObservers: [BotToastNavigatorObserver()],
      builder: (context, child) {
        child = botToastBuilder(context, child);
        return child;
      },
    );
  }
}
