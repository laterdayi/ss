part of '../index.dart';

class CustomStackBottom extends StatelessWidget {
  final Widget child;

  const CustomStackBottom({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.only(bottom: AppTheme.margin),
      child: CustomBlockWidth(
        child: child,
      ),
    );
  }
}
