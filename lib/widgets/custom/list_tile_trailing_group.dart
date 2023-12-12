part of '../index.dart';

class CusTomListTileTrailingGroup extends StatelessWidget {
  final double? width;
  final Widget? content;
  final String? contentText;
  final bool? showTrailing;
  final Widget? trailing;
  final double? iconSize;
  final Color? iconColor;
  final IconData? icon;

  const CusTomListTileTrailingGroup({
    super.key,
    this.content,
    this.contentText,
    this.width,
    this.showTrailing = true,
    this.trailing,
    this.iconSize,
    this.iconColor,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? UtilScreen.width * .5,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: content ??
                Text(
                  contentText ?? '',
                  textAlign: TextAlign.right,
                ),
          ),
          if (showTrailing == true)
            trailing ??
                CustomTrailingIcon(
                  icon: icon,
                  size: iconSize,
                  color: iconColor,
                ),
        ],
      ),
    );
  }
}
