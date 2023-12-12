part of '../index.dart';

enum CustomSpaceSize { large, normal, small, huge, stack }

class CustomSpaceHeight extends StatelessWidget {
  final CustomSpaceSize size;
  final double? height;
  const CustomSpaceHeight({super.key, this.height, this.size = CustomSpaceSize.normal});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height ?? _height);
  }

  double? get _height {
    switch (size) {
      case CustomSpaceSize.normal:
        return 20;
      case CustomSpaceSize.small:
        return AppTheme.margin;
      case CustomSpaceSize.large:
        return 30;
      case CustomSpaceSize.huge:
        return 40;
      case CustomSpaceSize.stack:
        return 50;
      default:
        return 20;
    }
  }
}

class CustomSpaceWidth extends StatelessWidget {
  final CustomSpaceSize size;
  final double? width;
  const CustomSpaceWidth({super.key, this.width, this.size = CustomSpaceSize.normal});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width ?? _width);
  }

  double? get _width {
    switch (size) {
      case CustomSpaceSize.normal:
        return 20;
      case CustomSpaceSize.small:
        return AppTheme.margin;
      case CustomSpaceSize.large:
        return 30;
      case CustomSpaceSize.huge:
        return 40;
      default:
        return 20;
    }
  }
}

class CustomSpaceHeightSmall extends CustomSpaceHeight {
  const CustomSpaceHeightSmall({super.key}) : super(size: CustomSpaceSize.small);
}

class CustomSpaceWidthSmall extends CustomSpaceWidth {
  const CustomSpaceWidthSmall({super.key}) : super(size: CustomSpaceSize.small);
}

class CustomSpaceHeightStack extends CustomSpaceHeight {
  const CustomSpaceHeightStack({super.key}) : super(size: CustomSpaceSize.stack);
}
