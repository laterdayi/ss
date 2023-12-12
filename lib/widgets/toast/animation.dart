part of '../index.dart';
class CustomAnimationWidget extends StatefulWidget {
  final AnimationController controller;
  final Widget child;

  const CustomAnimationWidget({super.key, required this.controller, required this.child});

  @override
  CustomAnimationWidgetState createState() => CustomAnimationWidgetState();
}

class CustomAnimationWidgetState extends State<CustomAnimationWidget> {
  static final Tween<Offset> tweenOffset = Tween<Offset>(
    begin: const Offset(0, 40),
    end: const Offset(0, 0),
  );

  static final Tween<double> tweenScale = Tween<double>(begin: 0.7, end: 1.0);
  late Animation<double> animation;

  @override
  void initState() {
    animation = CurvedAnimation(parent: widget.controller, curve: Curves.decelerate);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) {
        return Transform.translate(
          offset: tweenOffset.evaluate(animation),
          child: Transform.scale(
            scale: tweenScale.evaluate(animation),
            child: Opacity(
              opacity: animation.value,
              child: child,
            ),
          ),
        );
      },
      child: widget.child,
    );
  }
}
