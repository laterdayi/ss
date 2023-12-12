part of '../index.dart';

class CustomBlockWidth extends StatelessWidget {
  final Widget child;
  final double? height;
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const CustomBlockWidth({
    super.key,
    required this.child,
    this.height,
    this.alignment,
    this.padding,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      margin: margin,
      padding: padding,
      alignment: alignment,
      child: child,
    );
  }
}
