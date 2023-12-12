part of '../index.dart';

class CustomToast {
  // Text
  static void showText(String text, {Duration? duration = const Duration(seconds: 2)}) {
    BotToast.showText(
      text: text,
      align: Alignment.center,
      borderRadius: BorderRadius.circular(AppTheme.radius),
      wrapToastAnimation: (controller, cancel, Widget child) => CustomAnimationWidget(
        controller: controller,
        child: child,
      ),
      duration: duration,
    );
  }

  // Notification
  static void showNotification({
    ToastBuilder? leading,
    ToastBuilder? title,
    ToastBuilder? subtitle,
    ToastBuilder? trailing,
    WrapAnimation? wrapAnimation,
    WrapAnimation? wrapToastAnimation,
    GestureTapCallback? onTap,
    Color? backgroundColor,
    double? borderRadius,
    GestureLongPressCallback? onLongPress,
    Alignment? align,
    BackButtonBehavior? backButtonBehavior,
    Duration? duration,
    Duration? animationDuration,
    Duration? animationReverseDuration,
    EdgeInsetsGeometry? contentPadding,
    EdgeInsetsGeometry? margin,
    VoidCallback? onClose,
    bool crossPage = true,
    bool onlyOne = true,
    bool enableSlideOff = true,
  }) {
    BotToast.showNotification(
      leading: leading,
      title: title,
      subtitle: subtitle,
      trailing: trailing,
      wrapAnimation: wrapAnimation,
      wrapToastAnimation: (controller, cancel, Widget child) => CustomAnimationWidget(
        controller: controller,
        child: child,
      ),
      onTap: onTap,
      backgroundColor: backgroundColor,
      borderRadius: borderRadius ?? AppTheme.radius,
      onLongPress: onLongPress,
      align: align ?? const Alignment(0, 0.96),
      backButtonBehavior: backButtonBehavior,
      duration: duration ?? const Duration(seconds: 3),
      animationDuration: animationDuration,
      animationReverseDuration: animationReverseDuration,
      contentPadding: contentPadding ?? EdgeInsets.symmetric(horizontal: AppTheme.padding),
      margin: margin ?? EdgeInsets.symmetric(horizontal: AppTheme.margin),
      onClose: onClose,
      crossPage: crossPage,
      onlyOne: onlyOne,
      enableSlideOff: enableSlideOff,
    );
  }

  // Notification Success
  static void showNotificationSuccess({required String title, String? subtitle, GestureTapCallback? onTap}) {
    _showNotification(
      title: title,
      color: AppTheme.successColor,
      backgroundColor: AppTheme.successColorSecondary,
      subtitle: subtitle,
      onTap: onTap,
      icon: Icons.check_outlined,
    );
  }

  // Notification Warn
  static void showNotificationWarn({required String title, String? subtitle, GestureTapCallback? onTap}) {
    _showNotification(
      title: title,
      color: AppTheme.warnColor,
      backgroundColor: AppTheme.warnColorSecondary,
      subtitle: subtitle,
      onTap: onTap,
      icon: Icons.error_outline,
    );
  }

  // Notification Error
  static void showNotificationError({required String title, String? subtitle, GestureTapCallback? onTap}) {
    _showNotification(
      title: title,
      color: AppTheme.errorColor,
      backgroundColor: AppTheme.errorColorSecondary,
      subtitle: subtitle,
      onTap: onTap,
      icon: Icons.cancel_outlined,
    );
  }

  static _showNotification({
    required IconData icon,
    required String title,
    required Color color,
    required Color backgroundColor,
    String? subtitle,
    GestureTapCallback? onTap,
  }) {
    showNotification(
      leading: (cancel) => Icon(icon, color: color),
      title: (cancel) => Text(title, style: TextStyle(color: color)),
      subtitle: subtitle != null ? (cancel) => Text(subtitle, style: TextStyle(color: backgroundColor)) : null,
      trailing: (cancel) => GestureDetector(onTap: cancel, child: Icon(Icons.close, color: color)),
      onTap: onTap,
      backgroundColor: backgroundColor,
    );
  }

  // Loading
  static void showLoading({String? description}) {
    BotToast.showCustomLoading(
      backgroundColor: Colors.transparent,
      duration: kTimeOut,
      toastBuilder: (cancelFunc) {
        return CustomLoading(
          description: description,
        );
      },
    );
  }

  // 关闭全部 Loading
  static void closeAllLoading() => BotToast.closeAllLoading();
}
