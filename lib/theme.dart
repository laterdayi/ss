import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  // 主题色
  static Color successColor = const Color(0xFF23A757);
  static Color successColorSecondary = const Color(0xFFEAF8EA);
  static Color errorColor = const Color(0xFFF56C6C);
  static Color errorColorSecondary = const Color(0xFFFFEBEA);
  static Color warnColor = Colors.orange;
  static Color warnColorSecondary = const Color(0xFFFFF8E5);
  // Scaffold & Placeholder Color
  static Color placeholderColor = const Color(0xFFF4F5F7);

  // 圆角
  static double radius = 14;
  // Padding
  static double padding = 10;
  // Margin
  static double margin = 10;

  static FlexScheme scheme = FlexScheme.indigoM3;

  static final ThemeData _lightTheme = FlexThemeData.light(
    useMaterial3: true,
    // 主题
    scheme: scheme,
    // 表面混合水平
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    // 混合级别
    blendLevel: 7,
    // 混合模式下是使用白色背景色
    lightIsWhite: true,
    // 组件紧凑度
    visualDensity: VisualDensity.comfortable,
    subThemesData: _widgetTheme.copyWith(
      // 水平混合
      blendOnLevel: 10,
      // 混合颜色
      blendOnColors: false,
      // App Bar
      appBarBackgroundSchemeColor: SchemeColor.primary,
      // Tab Bar
      tabBarItemSchemeColor: SchemeColor.onPrimary,
      tabBarUnselectedItemSchemeColor: SchemeColor.outlineVariant,
    ),
  );

  static final ThemeData _darkTheme = FlexThemeData.dark(
    useMaterial3: true,
    // 主题
    scheme: scheme,
    // 表面混合水平
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    // 混合级别
    blendLevel: 14,
    // 组件紧凑度
    visualDensity: VisualDensity.comfortable,
    // 全黑模式
    darkIsTrueBlack: true,
    // 交换主要和次要颜色
    // swapColors: true,
    subThemesData: _widgetTheme.copyWith(
      // 水平混合
      blendOnLevel: 20,
    ),
  );

  static const FlexSubThemesData _widgetTheme = FlexSubThemesData(
    // 默认圆角
    defaultRadius: 14,
    // 墨水飞溅效果
    splashType: FlexSplashType.noSplash,
    // Material 3 中是否使用 M2 样式基于不透明度的分隔线
    useM2StyleDividerInM3: true,
    // 在选择对话框中使用 InputDecoratorTheme
    useInputDecoratorThemeInDialogs: true,
    // -------------------------------------------------------- > 组件
    // Button
    elevatedButtonRadius: 30,
    filledButtonRadius: 30,
    outlinedButtonRadius: 30,
    // Float Action Button
    fabSchemeColor: SchemeColor.primary,
    // Input
    inputDecoratorIsFilled: false,
    inputDecoratorRadius: 30,

    // Navigation Bar
    navigationBarElevation: 0,
    navigationBarIndicatorOpacity: 0.06,
    // Dialog
    dialogRadius: 16,
    dialogElevation: 0,
    // Drawer
    drawerElevation: 0,
    // Date Picker
    datePickerHeaderBackgroundSchemeColor: SchemeColor.primary,
    // Modal Bottom Sheet
    bottomSheetModalElevation: 0,
    // Snack Bar
    snackBarRadius: 30,
    snackBarBackgroundSchemeColor: SchemeColor.primary,
    snackBarActionSchemeColor: SchemeColor.onPrimary,
    // Card
    cardElevation: 0,
    // Popup Menu
    popupMenuRadius: 12,
    popupMenuElevation: 0,
    // Menu
    menuElevation: 0.0,
  );

  static ThemeData _mergedTheme({required ThemeData theme}) {
    return theme.copyWith(
      dropdownMenuTheme: theme.dropdownMenuTheme.copyWith(
        inputDecorationTheme: FlexSubThemes.inputDecorationTheme(
          colorScheme: theme.colorScheme,
          filled: false,
        ),
      ),
      timePickerTheme: theme.timePickerTheme.copyWith(
        inputDecorationTheme: theme.inputDecorationTheme.copyWith(
          enabledBorder: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
          focusedBorder: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
      ),
      datePickerTheme: theme.datePickerTheme.copyWith(elevation: 0),
      listTileTheme: theme.listTileTheme.copyWith(
        leadingAndTrailingTextStyle: TextStyle(fontSize: 16, color: theme.colorScheme.outline),
        subtitleTextStyle: TextStyle(
          fontSize: 14,
          color: theme.colorScheme.outlineVariant,
        ),
      ),
    );
  }

  static ThemeData light() => _mergedTheme(theme: _lightTheme);

  static ThemeData dark() => _mergedTheme(theme: _darkTheme);
}
