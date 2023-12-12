part of 'index.dart';

abstract class UtilScreen {
  static MediaQueryData get mediaQuery => MediaQueryData.fromView(PlatformDispatcher.instance.views.first);

  // 屏幕宽度
  static double get width => mediaQuery.size.width;

  // 屏幕高度
  static double get height => mediaQuery.size.height;

  // 屏幕dp比例
  static double get scale => mediaQuery.devicePixelRatio;

  // 顶部安全区域
  static double get statusBar => mediaQuery.padding.top;

  // 底部安全区域
  static double get bottomBar => mediaQuery.padding.bottom;
}
