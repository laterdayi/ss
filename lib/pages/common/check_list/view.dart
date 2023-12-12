part of 'index.dart';

class CheckListPage extends StatelessWidget {
  CheckListPage({super.key});

  final CheckListController checkListController = Get.find<CheckListController>();

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return GetBuilder<CheckListController>(
      builder: (controller) {
        final itemCount = controller.formItemData.itemList?.length;
        final isNull = controller.formItemData.itemList == null;
        return CustomScaffold(
          appBar: CustomAppBar(title: Text('checkList'.tr)),
          body: !isNull
              ? Column(
                  children: [
                    const CustomSpaceHeightSmall(),
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(AppTheme.radius),
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            const CustomSpaceHeightSmall(),
                            if (controller.entryParams.beforeChild != null) ...controller.entryParams.beforeChild!,
                            CustomCard(
                              child: ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(), //
                                itemCount: itemCount ?? 0,
                                itemBuilder: (c, index) {
                                  final item = controller.formItemData.itemList?[index];
                                  return Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(width: UtilScreen.width * 0.4, child: Text(item?.itemName ?? '')),
                                      const CustomSpaceWidthSmall(),
                                      Expanded(
                                        child: Container(
                                          alignment: Alignment.centerRight,
                                          child: _generateFormItem(
                                              item?.dataType, context, controller, item!, index, colorScheme),
                                        ),
                                      )
                                    ],
                                  );
                                },
                                separatorBuilder: (context, index) => const CustomDivider(),
                              ),
                            ),
                            if (controller.entryParams.afterChild != null) ...controller.entryParams.afterChild!,
                          ],
                        ),
                      ),
                    ),
                    const CustomSpaceHeightSmall(),
                    CustomBlockWidth(
                      child: CustomFilledButton(
                        onPressed: () {
                          controller.entryParams.onSubmit != null
                              ? controller.entryParams.onSubmit!()
                              : checkListController.saveFormItemList();
                        },
                        child: Text('confirm'.tr),
                      ),
                    ),
                    const CustomSpaceHeightSmall(),
                  ],
                )
              : const CustomEmpty(),
        );
      },
    );
  }

  Widget _generateFormItem(
    int? dataType,
    BuildContext context,
    CheckListController controller,
    CheckListFormItemDataModelItemList item,
    int index,
    ColorScheme colorScheme,
  ) {
    switch (dataType) {
      // 数字
      case 1:
        return CustomInput(
          onFieldSubmitted: (val) {
            item.itemValue = val;
            controller.getFormItemCheckResult(item);
          },
          keyboardType: TextInputType.number,
          size: CustomInputSize.small,
          maxLength: item.maxItemValue,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        );
      // 字符串
      case 2:
        return CustomInput(
          onFieldSubmitted: (String val) {
            item.itemValue = val;
            controller.getFormItemCheckResult(item);
          },
          textInputAction: TextInputAction.done,
          maxLength: item.maxItemValue,
          maxLines: 3,
        );
      // 布尔
      case 3:
        return CustomSwitch(
          value: item.itemValue == '1' ? true : false,
          onChanged: (bool val) {
            item.itemValue = val ? '1' : '0';
            controller.update();
            controller.getFormItemCheckResult(item);
          },
        );
      // 单选列表
      case 4:
        String controllId = 'radioListController';
        dynamic itemValue = item.itemValue;
        return _buttomSheetFormItem(
          context: context,
          item: item,
          colorScheme: colorScheme,
          controllerId: controllId,
          builder: (i, c) {
            return CustomRadioListTile(
              dense: true,
              contentPadding: const EdgeInsets.all(0),
              title: Text(item.dataSourceList?[i] ?? ''),
              value: item.dataSourceList?[i] ?? '',
              groupValue: itemValue,
              onChanged: (val) {
                itemValue = val;
                controller.update([controllId]);
              },
            );
          },
          onConfirm: () async {
            item.itemValue = itemValue;
            controller.update([controllId]);
            await controller.getFormItemCheckResult(item);
            UtilGet.back();
          },
        );
      // 多选列表
      case 5:
        String controllId = 'multiSelectListController';
        dynamic itemValue = '';
        return _buttomSheetFormItem(
          context: context,
          item: item,
          colorScheme: colorScheme,
          controllerId: controllId,
          builder: (i, c) {
            return CustomCheckboxListTile(
              title: Text(item.dataSourceList?[i] ?? ''),
              value: itemValue?.contains(item.dataSourceList?[i]),
              onChanged: (val) {
                List values = Utils.isNullOrBlank((itemValue)) ? [] : itemValue?.split(',');
                val == true ? values.add(item.dataSourceList?[i]) : values.remove(item.dataSourceList?[i]);
                itemValue = values.join(',');
                controller.update([controllId]);
              },
            );
          },
          onConfirm: () async {
            item.itemValue = itemValue;
            controller.update([controllId]);
            await controller.getFormItemCheckResult(item);
            UtilGet.back();
          },
        );
      // 单选勾选
      case 6:
        String controllId = 'radioCheckController';
        dynamic itemValue;
        return _buttomSheetFormItem(
          context: context,
          item: item,
          colorScheme: colorScheme,
          controllerId: controllId,
          builder: (i, c) {
            return CustomRadioListTile(
              dense: true,
              contentPadding: const EdgeInsets.all(0),
              title: Text(item.dataSourceList?[i] ?? ''),
              value: item.dataSourceList?[i] ?? '',
              groupValue: itemValue,
              onChanged: (val) {
                itemValue = val;
                controller.update([controllId]);
              },
            );
          },
          onConfirm: () async {
            item.itemValue = itemValue;
            controller.update([controllId]);
            await controller.getFormItemCheckResult(item);
            UtilGet.back();
          },
        );
      // 多选勾选
      case 7:
        String controllId = 'multiSelectCheckController';
        dynamic itemValue = '';
        return _buttomSheetFormItem(
          context: context,
          item: item,
          colorScheme: colorScheme,
          controllerId: controllId,
          builder: (i, c) {
            return CustomCheckboxListTile(
              dense: true,
              contentPadding: const EdgeInsets.all(0),
              controlAffinity: ListTileControlAffinity.leading,
              title: Text(item.dataSourceList?[i] ?? ''),
              value: itemValue?.contains(item.dataSourceList?[i]),
              onChanged: (val) {
                List values = Utils.isNullOrBlank((itemValue)) ? [] : itemValue?.split(',');
                val == true ? values.add(item.dataSourceList?[i]) : values.remove(item.dataSourceList?[i]);
                itemValue = values.join(',');
                controller.update([controllId]);
              },
            );
          },
          onConfirm: () async {
            item.itemValue = itemValue;
            controller.update([controllId]);
            await controller.getFormItemCheckResult(item);
            UtilGet.back();
          },
        );
      // 系统带入
      case 8:
        return CustomInput(onFieldSubmitted: (String val) {});
      // 附件
      case 9:
        return const Nil();
      // 小数
      case 10:
        return CustomInput(
          onFieldSubmitted: (val) {
            item.itemValue = val;
            controller.getFormItemCheckResult(item);
          },
          keyboardType: TextInputType.number,
          size: CustomInputSize.small,
          maxLength: item.maxItemValue,
          inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9.]"))],
        );
      default:
        return const Nil();
    }
  }

  Widget _buttomSheetFormItem({
    required BuildContext context,
    required ColorScheme colorScheme,
    required item,
    required String controllerId,
    required Function() onConfirm,
    required Widget Function(int, CheckListController) builder,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: GetBuilder<CheckListController>(
            id: controllerId,
            builder: (v) {
              List values = item.itemValue?.split(',');
              return Wrap(
                spacing: 12,
                children: [
                  for (int i = 0; i < values.length; i++)
                    if (Utils.isNotNullOrBlank(values[i]))
                      Chip(
                        label: Text(values[i] ?? ''),
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 0),
                      )
                ],
              );
            },
          ),
        ),
        IconButton(
          onPressed: () {
            CustomBottomSheet.show(
              titleText: item.itemName,
              context: context,
              onConfirm: onConfirm,
              content: ListView(
                children: item.dataSourceList!
                    .asMap()
                    .keys
                    .map<Widget>(
                      (i) => GetBuilder<CheckListController>(
                        id: controllerId,
                        builder: (c) => builder(i, c),
                      ),
                    )
                    .toList(),
              ),
            );
          },
          icon: Icon(Icons.expand_more_rounded, color: colorScheme.outline, size: 30),
        ),
      ],
    );
  }
}
