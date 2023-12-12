part of '../../index.dart';

class CustomFilledButton extends CustomButtonBase {
  final Widget child;
  const CustomFilledButton({
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
  State<CustomFilledButton> createState() => _CustomFilledButtonState();
}

class _CustomFilledButtonState extends State<CustomFilledButton> {
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
      child: FilledButton(
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

class CustomFilledButtonIcon extends CustomButtonBase {
  final Widget icon;
  final Widget label;

  const CustomFilledButtonIcon({
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
  State<CustomFilledButtonIcon> createState() => _CustomFilledButtonIconState();
}

class _CustomFilledButtonIconState extends State<CustomFilledButtonIcon> {
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
      child: FilledButton.icon(
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
