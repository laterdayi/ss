part of '../index.dart';

class CustomCard extends StatelessWidget {
  final Color? color;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final double? elevation;
  final ShapeBorder? shape;
  final bool borderOnForeground;
  final Clip? clipBehavior;
  final EdgeInsetsGeometry? margin;
  final bool semanticContainer;
  final Widget child;
  // -------------------------------------------------------- > Custom
  final EdgeInsetsGeometry? padding;

  const CustomCard({
    super.key,
    this.color,
    this.shadowColor,
    this.surfaceTintColor,
    this.elevation,
    this.shape,
    this.borderOnForeground = true,
    this.clipBehavior,
    this.margin = const EdgeInsets.all(0),
    this.semanticContainer = true,
    required this.child,
    // -------------------------------------------------------- > Custom
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      shadowColor: shadowColor,
      surfaceTintColor: surfaceTintColor,
      elevation: elevation,
      shape: shape,
      borderOnForeground: borderOnForeground,
      margin: margin,
      clipBehavior: clipBehavior,
      semanticContainer: semanticContainer,
      child: Padding(padding: padding ?? EdgeInsets.all(AppTheme.padding), child: child),
    );
  }
}
