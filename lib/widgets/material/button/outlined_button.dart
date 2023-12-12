part of '../../index.dart';

class CustomOutlinedButton extends CustomOutlinedButtonBase {
  final Widget child;
  final ValueChanged<bool>? onHover;
  final ValueChanged<bool>? onFocusChange;

  const CustomOutlinedButton({
    super.key,
    required super.onPressed,
    required this.child,
    super.onLongPress,
    this.onHover,
    this.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus = false,
    super.clipBehavior = Clip.none,
    super.statesController,
    // -------------------------------------------------------- > Custom
    super.size = CustomButtonSize.middle,
    super.width,
    super.height,
    super.fontSize,
    super.color,
  });

  @override
  State<CustomOutlinedButton> createState() => _CustomOutlinedButtonState();
}

class _CustomOutlinedButtonState extends State<CustomOutlinedButton> {
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
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return SizedBox(
      width: widget.width,
      height: widget.height ?? CustomButton.getButtonSize(widget.size),
      child: OutlinedButton(
        onPressed: (widget.onPressed == null || loading) ? null : _onPressed,
        style: loading
            ? ButtonStyle(
                textStyle: MaterialStatePropertyAll(TextStyle(fontSize: CustomButton.getButtonFontSize(widget.size))),
                padding: MaterialStatePropertyAll(CustomButton.getPadding()),
              )
            : widget.getButtonStyle(colorScheme),
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

class CustomOutlinedButtonIcon extends CustomOutlinedButtonBase {
  final Widget icon;
  final Widget label;

  const CustomOutlinedButtonIcon({
    super.key,
    required super.onPressed,
    required this.icon,
    required this.label,
    super.onLongPress,
    super.style,
    super.focusNode,
    super.autofocus = false,
    super.clipBehavior = Clip.none,
    super.statesController,
    // -------------------------------------------------------- > Custom
    super.size = CustomButtonSize.middle,
    super.width,
    super.height,
    super.fontSize,
    super.color,
  });

  @override
  State<CustomOutlinedButtonIcon> createState() => _CustomOutlinedButtonIconState();
}

class _CustomOutlinedButtonIconState extends State<CustomOutlinedButtonIcon> {
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
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return SizedBox(
      width: widget.width,
      height: CustomButton.getButtonSize(widget.size),
      child: OutlinedButton.icon(
        icon: widget.icon,
        label: widget.label,
        onPressed: (widget.onPressed == null || loading) ? null : _onPressed,
        style: loading
            ? ButtonStyle(
                textStyle: MaterialStatePropertyAll(TextStyle(fontSize: CustomButton.getButtonFontSize(widget.size))),
                padding: MaterialStatePropertyAll(CustomButton.getPadding()),
              )
            : widget.getButtonStyle(colorScheme),
        focusNode: widget.focusNode,
        statesController: widget.statesController,
        onLongPress: widget.onLongPress,
        autofocus: widget.autofocus,
        clipBehavior: widget.clipBehavior,
      ),
    );
  }
}
