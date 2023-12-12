part of '../index.dart';

class CustomDialog {
  // 基础
  static Future<T?> show<T>({
    required BuildContext context,
    Widget? icon,
    Color? iconColor,
    EdgeInsetsGeometry? iconPadding,
    Widget? title,
    EdgeInsetsGeometry? titlePadding,
    TextStyle? titleTextStyle,
    required Widget content,
    EdgeInsetsGeometry? contentPadding,
    TextStyle? contentTextStyle,
    List<Widget>? actions,
    EdgeInsetsGeometry? actionsPadding,
    MainAxisAlignment? actionsAlignment,
    OverflowBarAlignment? actionsOverflowAlignment,
    VerticalDirection? actionsOverflowDirection,
    double? actionsOverflowButtonSpacing,
    EdgeInsetsGeometry? buttonPadding,
    Color? backgroundColor,
    double? elevation,
    Color? shadowColor,
    Color? surfaceTintColor,
    String? semanticLabel,
    EdgeInsets insetPadding = const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
    Clip clipBehavior = Clip.none,
    ShapeBorder? shape,
    AlignmentGeometry? alignment,
    bool scrollable = true,
    // -------------------------------------------------------------------------------------------- > showDialog
    bool barrierDismissible = true,
    Color? barrierColor = Colors.black54,
    String? barrierLabel,
    bool useSafeArea = true,
    bool useRootNavigator = true,
    RouteSettings? routeSettings,
    Offset? anchorPoint,
    TraversalEdgeBehavior? traversalEdgeBehavior,
    // -------------------------------------------------------- > Custom
    double? width,
    double? height,
    Widget? cancel,
    Widget? confirm,
    bool? showConfirm = true,
    bool? showCancel = true,
    void Function()? onConfirm,
    void Function()? onCancel,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      barrierLabel: barrierLabel,
      useSafeArea: useSafeArea,
      useRootNavigator: useRootNavigator,
      routeSettings: routeSettings,
      anchorPoint: anchorPoint,
      traversalEdgeBehavior: traversalEdgeBehavior,
      builder: (context) => AlertDialog(
        icon: icon,
        iconPadding: iconPadding ?? const EdgeInsets.fromLTRB(14, 16, 14, 16),
        titlePadding: titlePadding ?? EdgeInsets.fromLTRB(14, icon == null ? 18 : 0, 14, 14),
        contentPadding: contentPadding ?? const EdgeInsets.fromLTRB(14, 0, 14, 0),
        actionsPadding: actionsPadding ?? const EdgeInsets.fromLTRB(14, 7, 14, 7),
        title: title ?? Text('hint'.tr),
        content: SizedBox(
          width: width,
          height: height,
          child: content,
        ),
        actions: actions ??
            <Widget>[
              if (showCancel == true)
                cancel ??
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.outline),
                      ),
                      onPressed: onCancel ?? () => UtilGet.back(),
                      child: Text('cancel'.tr),
                    ),
              if (showConfirm == true)
                confirm ??
                    TextButton(
                      onPressed: onConfirm,
                      child: Text('confirm'.tr),
                    ),
            ],
        iconColor: iconColor,
        titleTextStyle: titleTextStyle,
        contentTextStyle: contentTextStyle ?? Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 16),
        actionsAlignment: actionsAlignment,
        actionsOverflowAlignment: actionsOverflowAlignment,
        actionsOverflowDirection: actionsOverflowDirection,
        actionsOverflowButtonSpacing: actionsOverflowButtonSpacing,
        buttonPadding: buttonPadding,
        backgroundColor: backgroundColor,
        elevation: elevation,
        shadowColor: shadowColor,
        surfaceTintColor: surfaceTintColor,
        semanticLabel: semanticLabel,
        insetPadding: insetPadding,
        clipBehavior: clipBehavior,
        shape: shape,
        alignment: alignment,
        scrollable: scrollable,
      ),
    );
  }

  // 简单
  static Future<T?> showSimple<T>({
    required BuildContext context,
    required List<Widget> children,
    Widget? title,
    EdgeInsetsGeometry titlePadding = const EdgeInsets.fromLTRB(14, 18, 14, 0),
    TextStyle? titleTextStyle,
    EdgeInsetsGeometry contentPadding = const EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 16.0),
    Color? backgroundColor,
    double? elevation,
    Color? shadowColor,
    Color? surfaceTintColor,
    String? semanticLabel,
    EdgeInsets insetPadding = const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
    Clip clipBehavior = Clip.none,
    ShapeBorder? shape,
    AlignmentGeometry? alignment,
  }) {
    return showDialog<T>(
      context: context,
      builder: (context) => SimpleDialog(
        title: title,
        titlePadding: titlePadding,
        titleTextStyle: titleTextStyle,
        contentPadding: contentPadding,
        backgroundColor: backgroundColor,
        elevation: elevation,
        shadowColor: shadowColor,
        surfaceTintColor: surfaceTintColor,
        semanticLabel: semanticLabel,
        insetPadding: insetPadding,
        clipBehavior: clipBehavior,
        shape: shape,
        alignment: alignment,
        children: children,
      ),
    );
  }
}
