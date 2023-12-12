part of '../index.dart';

enum CustomInputSize { small, middle, large }

class CustomInput extends TextFormField {
  final CustomInputSize size;
  final InputDecoration? decoration;

  CustomInput({
    super.key,
    super.controller,
    super.initialValue,
    super.focusNode,
    super.keyboardType,
    super.textCapitalization,
    super.textInputAction,
    super.style,
    super.strutStyle,
    super.textDirection,
    super.textAlign,
    super.textAlignVertical,
    super.autofocus,
    super.readOnly,
    super.showCursor,
    super.obscuringCharacter,
    super.obscureText,
    super.autocorrect,
    super.smartDashesType,
    super.smartQuotesType,
    super.enableSuggestions,
    super.maxLines,
    super.minLines,
    super.expands,
    super.maxLength,
    super.onChanged,
    super.onTap,
    super.onTapOutside,
    super.onEditingComplete,
    super.onFieldSubmitted,
    super.onSaved,
    super.validator,
    super.enabled,
    super.cursorWidth,
    super.cursorHeight,
    super.cursorRadius,
    super.cursorColor,
    super.keyboardAppearance,
    super.scrollPadding,
    super.enableInteractiveSelection,
    super.selectionControls,
    super.buildCounter,
    super.scrollPhysics,
    super.autofillHints,
    super.scrollController,
    super.restorationId,
    super.enableIMEPersonalizedLearning,
    super.mouseCursor,
    super.spellCheckConfiguration,
    super.magnifierConfiguration,
    super.undoController,
    super.onAppPrivateCommand,
    super.cursorOpacityAnimates,
    super.contentInsertionConfiguration,
    super.clipBehavior,
    super.scribbleEnabled,
    super.canRequestFocus,
    super.dragStartBehavior,
    super.selectionWidthStyle,
    super.selectionHeightStyle,
    super.inputFormatters,
    super.maxLengthEnforcement,
    super.contextMenuBuilder,
    // -------------------------------------------------------- > Custom
    super.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.decoration,
    this.size = CustomInputSize.middle,
  }) : super(
          decoration: decoration != null
              ? decoration.copyWith(
                  contentPadding: _contentPadding(size),
                  isDense: size == CustomInputSize.small,
                )
              : InputDecoration(
                  contentPadding: _contentPadding(size),
                  isDense: size == CustomInputSize.small,
                ),
        );

  static EdgeInsetsGeometry? _contentPadding(CustomInputSize size) {
    switch (size) {
      case CustomInputSize.small:
        return const EdgeInsets.symmetric(horizontal: 12, vertical: 8);
      case CustomInputSize.middle:
        return const EdgeInsets.symmetric(horizontal: 12, vertical: 12);
      case CustomInputSize.large:
        return const EdgeInsets.symmetric(horizontal: 12, vertical: 20);
    }
  }
}
