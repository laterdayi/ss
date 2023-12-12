part of '../index.dart';

enum CustomEmptySize { large, normal, small }

class CustomEmpty extends StatelessWidget {
  final String? description;
  final CustomEmptySize size;

  const CustomEmpty({super.key, this.description, this.size = CustomEmptySize.normal});

  double? get _iconSize {
    switch (size) {
      case CustomEmptySize.small:
        return 28;
      case CustomEmptySize.normal:
        return 34;
      case CustomEmptySize.large:
        return 44;
    }
  }

  double? get _textSize {
    switch (size) {
      case CustomEmptySize.small:
        return 18;
      case CustomEmptySize.normal:
        return 20;
      case CustomEmptySize.large:
        return 22;
    }
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.search_outlined, size: _iconSize, color: colorScheme.outlineVariant),
          const CustomSpaceHeight(),
          Text(
            'none'.trParams({"val": description ?? 'data'.tr}),
            style: TextStyle(fontSize: _textSize, color: colorScheme.outlineVariant),
          ),
        ],
      ),
    );
  }
}
