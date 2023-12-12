part of '../index.dart';

class CustomCupertinoPicker extends StatelessWidget {
  final FixedExtentScrollController? scrollController;
  final double? itemExtent;
  final void Function(int)? onSelectedItemChanged;
  final Widget? Function(BuildContext, int) itemBuilder;
  final Color? backgroundColor;
  final int childCount;

  const CustomCupertinoPicker({
    super.key,
    this.scrollController,
    this.backgroundColor,
    this.itemExtent,
    this.onSelectedItemChanged,
    required this.childCount,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoPicker.builder(
      backgroundColor: backgroundColor,
      scrollController: scrollController,
      itemExtent: itemExtent ?? 40,
      childCount: childCount,
      onSelectedItemChanged: onSelectedItemChanged,
      itemBuilder: itemBuilder,
    );
  }
}
