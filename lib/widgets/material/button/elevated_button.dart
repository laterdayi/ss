part of '../../index.dart';

class CustomElevatedButton extends CustomButtonBase {
  final Widget child;
  const CustomElevatedButton({
    super.key,
    required super.onPressed,
    required this.child,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus = false,
    super.clipBehavior = Clip.none,
    super.statesController,
    // -------------------------------------------------------- > Custom
    super.size = CustomButtonSize.middle,
    super.width,
  });

  @override
  State<CustomElevatedButton> createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  bool loading = false;

  _onPressed() async {
    try {
      setState(() {
        loading = true;
      });
      await widget.onPressed!();
    } catch (e) {
      UtilLog.error('onPressed', e);
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height ?? CustomButton.getButtonSize(widget.size),
      child: ElevatedButton(
        onPressed: (widget.onPressed == null || loading) ? null : _onPressed,
        style: widget.getButtonStyle(),
        focusNode: widget.focusNode,
        statesController: widget.statesController,
        onHover: widget.onHover,
        onFocusChange: widget.onFocusChange,
        onLongPress: widget.onLongPress,
        autofocus: widget.autofocus,
        clipBehavior: widget.clipBehavior,
        child: widget.child,
      ),
    );
  }
}

class CustomElevatedButtonIcon extends CustomButtonBase {
  final Widget icon;
  final Widget label;

  const CustomElevatedButtonIcon({
    super.key,
    required super.onPressed,
    required this.icon,
    required this.label,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus = false,
    super.clipBehavior = Clip.none,
    super.statesController,
    // -------------------------------------------------------- > Custom
    super.size = CustomButtonSize.middle,
    super.width,
  });

  @override
  State<CustomElevatedButtonIcon> createState() => _CustomElevatedButtonIconState();
}

class _CustomElevatedButtonIconState extends State<CustomElevatedButtonIcon> {
  bool loading = false;

  _onPressed() async {
    try {
      setState(() {
        loading = true;
      });
      await widget.onPressed!();
    } catch (e) {
      UtilLog.error('onPressed', e);
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height ?? CustomButton.getButtonSize(widget.size),
      child: ElevatedButton.icon(
        icon: widget.icon,
        label: widget.label,
        onPressed: (widget.onPressed == null || loading) ? null : _onPressed,
        style: widget.getButtonStyle(),
        focusNode: widget.focusNode,
        statesController: widget.statesController,
        onHover: widget.onHover,
        onFocusChange: widget.onFocusChange,
        onLongPress: widget.onLongPress,
        autofocus: widget.autofocus,
        clipBehavior: widget.clipBehavior,
      ),
    );
  }
}
