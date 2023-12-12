part of '../index.dart';

class CustomListTileRow extends StatelessWidget {
  final double? titleWidth;
  final String? titleText;
  final Widget? title;
  final Widget? trailing;
  final EdgeInsetsGeometry? padding;

  const CustomListTileRow({
    super.key,
    this.titleText,
    this.title,
    this.trailing,
    this.padding,
    this.titleWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: titleWidth ?? UtilScreen.width * 0.5,
            child: title ?? Text(titleText ?? '', style: Theme.of(context).textTheme.bodyLarge),
          ),
          if (trailing != null)
            Expanded(
              child: Container(
                alignment: Alignment.centerRight,
                child: trailing,
              ),
            ),
        ],
      ),
    );
  }
}
