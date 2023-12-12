part of '../../index.dart';

class CustomTextButton extends CustomButtonBase {
  final Widget child;
  final bool? isSemanticButton;

  const CustomTextButton({
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
    this.isSemanticButton = true,
    // -------------------------------------------------------- > Custom
    super.size = CustomButtonSize.middle,
    super.width,
  });

  @override
  State<CustomTextButton> createState() => _CustomTextButtonState();
}

class _CustomTextButtonState extends State<CustomTextButton> {
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
      child: TextButton(
        onPressed: (widget.onPressed == null || loading) ? null : _onPressed,
        style: widget.getButtonStyle(),
        focusNode: widget.focusNode,
        statesController: widget.statesController,
        onHover: widget.onHover,
        onFocusChange: widget.onFocusChange,
        onLongPress: widget.onLongPress,
        autofocus: widget.autofocus,
        clipBehavior: widget.clipBehavior,
        isSemanticButton: widget.isSemanticButton,
        child: widget.child,
      ),
    );
  }
}

class CustomTextButtonIcon extends CustomButtonBase {
  final Widget icon;
  final Widget label;

  const CustomTextButtonIcon({
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
  State<CustomTextButtonIcon> createState() => _CustomTextButtonIconState();
}

class _CustomTextButtonIconState extends State<CustomTextButtonIcon> {
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
      child: TextButton.icon(
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
