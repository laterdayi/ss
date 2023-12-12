part of '../index.dart';

class CustomBottomSheet {
  static Future<T?> show<T>({
    required context,
    required Widget content,
    bool isDismissible = true,
    // -------------------------------------------------------- > Custom
    bool isExpanded = true,
    double? contentPadding,
    Widget? confirm,
    Widget? cancel,
    Widget? title,
    Widget? action,
    String? titleText,
    bool? showConfirm = true,
    bool? showCancel = true,
    void Function()? onConfirm,
    void Function()? onCancel,
    AlignmentGeometry? contentAlignment,
    double? height,
  }) {
    return showModalBottomSheet<T>(
      isDismissible: isDismissible,
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        assert(title == null || titleText == null, '不能同时传入 title 和 titleText');
        assert(
            action == null ||
                (showConfirm == null &&
                    showCancel == null &&
                    onConfirm == null &&
                    onCancel == null &&
                    confirm == null &&
                    cancel == null),
            '不能同时传入 action 和其他参数');
        assert(confirm == null || onConfirm == null, '不能同时传入 confirm 和 onConfirm');
        assert(cancel == null || onCancel == null, '不能同时传入 cancel 和 onCancel');
        ColorScheme colorScheme = Theme.of(context).colorScheme;
        return AnimatedPadding(
          duration: const Duration(milliseconds: 10),
          curve: Curves.linear,
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: AppTheme.padding,
            right: AppTheme.padding,
          ),
          child: SizedBox(
            height: height ?? UtilScreen.height * .5,
            child: Column(
              children: [
                Container(
                  width: 32,
                  height: 4,
                  margin: EdgeInsets.only(top: AppTheme.margin),
                  decoration: BoxDecoration(color: colorScheme.outlineVariant, borderRadius: BorderRadius.circular(2)),
                ),
                const CustomSpaceHeight(),
                // 标题栏
                if (title != null) title,
                if (titleText != null)
                  Align(
                    alignment: Alignment.center,
                    child: DefaultTextStyle(
                      style: TextStyle(fontSize: 16, color: colorScheme.onSurface),
                      child: Text(titleText),
                    ),
                  ),
                if (title != null || titleText != null) const CustomSpaceHeight(),
                // 内容
                isExpanded
                    ? Expanded(child: content)
                    : Container(
                        margin: EdgeInsets.only(top: AppTheme.margin),
                        padding: EdgeInsets.symmetric(horizontal: contentPadding ?? AppTheme.padding),
                        child: content,
                      ),
                const CustomSpaceHeightSmall(),
                // 按钮
                action ??
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (showCancel == true)
                          cancel ??
                              Expanded(
                                child: CustomOutlinedButton(
                                  color: Theme.of(context).colorScheme.outline,
                                  onPressed: onCancel ?? () => UtilGet.back(),
                                  child: Text('cancel'.tr),
                                ),
                              ),
                        const CustomSpaceWidth(size: CustomSpaceSize.large),
                        if (showConfirm == true)
                          confirm ??
                              Expanded(
                                child: CustomFilledButton(
                                  onPressed: onConfirm,
                                  child: Text('confirm'.tr),
                                ),
                              )
                      ],
                    ),
                const CustomSpaceHeightSmall(),
              ],
            ),
          ),
        );
      },
    );
  }
}
