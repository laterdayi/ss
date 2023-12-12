part of '../index.dart';

class CustomExpansionTile extends ExpansionTile {
  CustomExpansionTile({
    super.key,
    super.leading,
    required super.title,
    super.subtitle,
    super.onExpansionChanged,
    super.children,
    super.backgroundColor,
    super.collapsedBackgroundColor,
    super.trailing,
    super.initiallyExpanded,
    super.maintainState,
    super.expandedAlignment,
    super.expandedCrossAxisAlignment,
    super.childrenPadding,
    super.iconColor,
    super.collapsedIconColor,
    super.textColor,
    super.collapsedTextColor,
    super.clipBehavior,
    super.controlAffinity,
    super.controller,
    ShapeBorder? shape,
    ShapeBorder? collapsedShape,
    EdgeInsetsGeometry? tilePadding,
    // -------------------------------------------------------------------------------------------- > Extend
    Color? borderColor,
  }) : super(
          shape: shape ??
              RoundedRectangleBorder(
                side: borderColor != null ? BorderSide(color: borderColor, width: 1.0) : const BorderSide(),
                borderRadius: BorderRadius.circular(AppTheme.radius),
              ),
          collapsedShape: collapsedShape ??
              RoundedRectangleBorder(
                side: borderColor != null ? BorderSide(color: borderColor, width: 1.0) : const BorderSide(),
                borderRadius: BorderRadius.circular(AppTheme.radius),
              ),
          tilePadding: tilePadding ?? EdgeInsets.symmetric(horizontal: AppTheme.padding),
        );
}
