part of '../../index.dart';

enum CustomButtonSize { mini, small, middle, large }

// 基类 - 按钮
abstract class CustomButtonBase extends StatefulWidget {
  final Function? onPressed;
  final VoidCallback? onLongPress;
  final ValueChanged<bool>? onHover;
  final ValueChanged<bool>? onFocusChange;
  final ButtonStyle? style;
  final FocusNode? focusNode;
  final bool autofocus;
  final Clip clipBehavior;
  final MaterialStatesController? statesController;
  // -------------------------------------------------------- > Custom
  final CustomButtonSize size;
  final double? width;
  final double? height;

  const CustomButtonBase({
    super.key,
    required this.onPressed,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.style,
    this.focusNode,
    this.statesController,
    this.clipBehavior = Clip.none,
    this.autofocus = false,
    // -------------------------------------------------------- > Custom
    this.size = CustomButtonSize.middle,
    this.width,
    this.height,
  });

  ButtonStyle getButtonStyle() {
    return style != null
        ? style!.copyWith(
            textStyle: MaterialStatePropertyAll(TextStyle(fontSize: CustomButton.getButtonFontSize(size))),
            padding: MaterialStatePropertyAll(CustomButton.getPadding()),
          )
        : ButtonStyle(
            textStyle: MaterialStatePropertyAll(TextStyle(fontSize: CustomButton.getButtonFontSize(size))),
            padding: MaterialStatePropertyAll(CustomButton.getPadding()),
          );
  }
}

abstract class CustomOutlinedButtonBase extends StatefulWidget {
  final Function? onPressed;
  final VoidCallback? onLongPress;
  final ButtonStyle? style;
  final FocusNode? focusNode;
  final bool autofocus;
  final Clip clipBehavior;
  final MaterialStatesController? statesController;
  // -------------------------------------------------------- > Custom
  final CustomButtonSize size;
  final double? width;
  final double? height;
  final double? fontSize;
  final Color? color;

  const CustomOutlinedButtonBase({
    super.key,
    required this.onPressed,
    this.onLongPress,
    this.style,
    this.focusNode,
    this.statesController,
    this.clipBehavior = Clip.none,
    this.autofocus = false,
    // -------------------------------------------------------- > Custom
    this.size = CustomButtonSize.middle,
    this.width,
    this.height,
    this.fontSize,
    this.color,
  });

  ButtonStyle? getButtonStyle(ColorScheme colorScheme) {
    return style != null
        ? style?.copyWith(
            foregroundColor: MaterialStatePropertyAll(color ?? colorScheme.primary),
            overlayColor: const MaterialStatePropertyAll(Colors.transparent),
            side: MaterialStatePropertyAll(BorderSide(width: 1, color: color ?? colorScheme.primary)),
            textStyle: MaterialStatePropertyAll(
              TextStyle(fontSize: fontSize ?? CustomButton.getButtonFontSize(size)),
            ),
            padding: MaterialStatePropertyAll(CustomButton.getPadding()),
          )
        : ButtonStyle(
            foregroundColor: MaterialStatePropertyAll(color ?? colorScheme.primary),
            overlayColor: const MaterialStatePropertyAll(Colors.transparent),
            side: MaterialStatePropertyAll(BorderSide(width: 1, color: color ?? colorScheme.primary)),
            textStyle: MaterialStatePropertyAll(
              TextStyle(fontSize: fontSize ?? CustomButton.getButtonFontSize(size)),
            ),
            padding: MaterialStatePropertyAll(CustomButton.getPadding()),
          );
  }
}

class CustomButton {
  // Padding
  static EdgeInsetsGeometry getPadding() => const EdgeInsets.symmetric(horizontal: 14, vertical: 0);

  // 按钮大小
  static double? getButtonSize(CustomButtonSize size) {
    switch (size) {
      case CustomButtonSize.mini:
        return 26;
      case CustomButtonSize.small:
        return 28;
      case CustomButtonSize.middle:
        return null;
      case CustomButtonSize.large:
        return 34;
    }
  }

  // 按钮文字
  static double? getButtonFontSize(CustomButtonSize size) {
    switch (size) {
      case CustomButtonSize.mini:
        return 12;
      case CustomButtonSize.small:
        return 13;
      case CustomButtonSize.middle:
        return null;
      case CustomButtonSize.large:
        return null;
    }
  }
}
