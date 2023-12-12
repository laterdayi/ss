part of '../index.dart';

class CustomTrailingIcon extends StatelessWidget {
  final double? size;
  final Color? color;
  final IconData? icon;
  final bool? primary;

  const CustomTrailingIcon({super.key, this.size, this.color, this.icon, this.primary});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Icon(
      icon ?? Icons.chevron_right_rounded,
      size: size ?? 30,
      color: primary == true ? colorScheme.primary : color ?? colorScheme.outlineVariant,
    );
  }
}

class CustomCheckedIcon extends CustomTrailingIcon {
  const CustomCheckedIcon({super.key, super.size, super.color}) : super(icon: Icons.check_outlined, primary: true);
}
