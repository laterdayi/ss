part of 'index.dart';

class EngineerRepairPage extends StatefulWidget {
  const EngineerRepairPage({super.key});

  @override
  State<EngineerRepairPage> createState() => _EngineerRepairPageState();
}

class _EngineerRepairPageState extends State<EngineerRepairPage> {
  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return CustomScaffold(
      appBar: CustomAppBar(title: Text('engineerRepair'.tr)),
      body: GetBuilder<EngineerRepairController>(
        builder: (controller) {
          return Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    const CustomSpaceHeightSmall(),
                    CustomCard(
                      child: Column(
                        children: [
                          _listItemInfo('Lot ID', controller.lotInfoData.lotno ?? ''),
                          _listItemInfo('callOrderNumbr'.tr, controller.callDetailData.flowNo ?? ''),
                          _listItemInfo('caller'.tr, controller.callDetailData.creator ?? ''),
                          _listItemInfo('callTime'.tr, controller.callDetailData.systemTime ?? ''),
                          _listItemInfo('productionLineLevel'.tr, controller.callDetailData.line ?? ''),
                          _listItemInfo('equipmentNumber'.tr, controller.callDetailData.eqpId ?? ''),
                          _listItemInfo('exceptionType'.tr, controller.callDetailData.flowType ?? ''),
                          _listItemInfo('callType'.tr, controller.callDetailData.callType ?? ''),
                        ],
                      ),
                    ),
                    const CustomSpaceHeight(),
                    CustomCard(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: AppTheme.padding),
                        child: Column(
                          children: [
                            CustomListTile(
                              contentPadding: const EdgeInsets.all(0),
                              title: Text('faultType'.tr),
                              trailing: CusTomListTileTrailingGroup(
                                contentText: controller.currentFaultTypeId,
                                showTrailing: !(controller.hasTemporaryStorageData &&
                                    controller.currentFaultTypeId.isNotEmpty == true),
                              ),
                              onTap:
                                  controller.hasTemporaryStorageData && controller.currentFaultTypeId.isNotEmpty == true
                                      ? null
                                      : () {
                                          CustomBottomSheet.show(
                                            context: context,
                                            showCancel: false,
                                            showConfirm: false,
                                            content: controller.faultTypeList.isNotEmpty
                                                ? ListView(
                                                    children: controller.faultTypeList
                                                        .map(
                                                          (e) => CustomListTile(
                                                            title: Text(e.name ?? ''),
                                                            trailing: e.id == controller.currentFaultTypeId
                                                                ? const CustomTrailingIcon(
                                                                    icon: Icons.check_outlined, primary: true)
                                                                : null,
                                                            onTap: () {
                                                              controller.handleSwitchFaultType(e.id ?? '');
                                                              Get.back();
                                                            },
                                                          ),
                                                        )
                                                        .toList(),
                                                  )
                                                : const CustomEmpty(),
                                          );
                                        },
                            ),
                            if (controller.formBasicData.sopName != null)
                              CustomListTile(
                                title: const Text('SOP'),
                                contentPadding: const EdgeInsets.all(0),
                                trailing: IconButton(
                                  onPressed: controller.formBasicData.sopName != null
                                      ? () => controller.handlePreviewGuideFile(context)
                                      : null,
                                  icon: Icon(controller.fileIcon),
                                ),
                              ),
                            // 动态表单
                            ..._buildFormItemList(context, controller, controller.formItemData.itemList, colorScheme),
                          ],
                        ),
                      ),
                    ),
                    const CustomSpaceHeight(),
                    CustomCard(
                      child: Column(
                        children: [
                          _inputItem(
                            const ValueKey('faultDescription'),
                            'faultDescription'.tr,
                            controller.inputControllerFaultDescription,
                          ),
                          const CustomSpaceHeightSmall(),
                          _inputItem(
                            const ValueKey('faultReason'),
                            'faultReason'.tr,
                            controller.inputControllerFaultReason,
                          ),
                          const CustomSpaceHeightSmall(),
                          _inputItem(
                            const ValueKey('improvementMeasure'),
                            'improvementMeasure'.tr,
                            controller.inputControllerImprovementMeasure,
                          ),
                          const CustomSpaceHeightSmall(),
                          CustomListTileRow(
                            titleText: 'recoveryCondition'.tr,
                            trailing: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.start,
                              children: controller.recoveryConditionList
                                  .map<Widget>(
                                    (e) => Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        CustomCheckbox(
                                          value: controller.selectRecoveryCondition.contains(e.name),
                                          onChanged: (v) => controller.handleUpdateSelectRecoveryCondition(v!, e.name!),
                                        ),
                                        Text(e.name ?? ''),
                                      ],
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const CustomSpaceHeight(),
                  ],
                ),
              ),
              const CustomSpaceHeight(),
              Row(
                children: [
                  if (controller.hasTemporaryStorageData)
                    Expanded(
                      child: CustomFilledButton(
                        onPressed: controller.handleClearTemporaryStorageData,
                        child: Text('clearTemporaryStorage'.tr),
                      ),
                    ),
                  if (controller.hasTemporaryStorageData) const CustomSpaceWidth(),
                  Expanded(
                    child: CustomFilledButton(
                      onPressed: () => controller.handleSubmitRepairComplete(RepairCompleteType.temporaryStorage.val),
                      child: Text('temporaryStorage'.tr),
                    ),
                  ),
                  const CustomSpaceWidth(),
                  Expanded(
                    child: CustomFilledButton(
                      onPressed: () => controller.handleSubmitRepairComplete(RepairCompleteType.repairComplete.val),
                      child: Text('repairComplete'.tr),
                    ),
                  ),
                ],
              ),
              const CustomSpaceHeightSmall(),
            ],
          );
        },
      ),
    );
  }

  List _buildFormItemList(context, controller, itemList, colorScheme) {
    List widgets = [];
    if (itemList == null) return [];
    for (int i = 0; i < itemList!.length; i++) {
      widgets.add(
        CustomListTileRow(
          titleText: itemList?[i]?.itemName ?? '',
          trailing: handleGenerateFormItem(
            itemList?[i]?.dataType,
            context,
            controller,
            itemList![i]!,
            i,
            colorScheme,
          ),
        ),
      );
    }
    return widgets;
  }

  Widget _listItemInfo(String title, String trailing) {
    return CustomListTile(
      title: Text(title),
      trailing: CusTomListTileTrailingGroup(
        contentText: trailing,
        showTrailing: false,
      ),
    );
  }

  Widget _inputItem(
    Key key,
    String title,
    TextEditingController controller, {
    void Function(String)? onFieldSubmitted,
  }) {
    return CustomListTileRow(
      key: key,
      titleText: title,
      trailing: CustomInput(
        controller: controller,
        maxLines: 3,
        textInputAction: TextInputAction.done,
        onFieldSubmitted: onFieldSubmitted,
      ),
    );
  }

  Widget handleGenerateFormItem(
    int? dataType,
    BuildContext context,
    EngineerRepairController controller,
    CheckListFormItemDataModelItemList item,
    int index,
    ColorScheme colorScheme,
  ) {
    switch (dataType) {
      // 数字
      case 1:
        return CustomInput(
          initialValue: item.itemValue,
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
          initialValue: item.itemValue,
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
        String controllerIdListTile = 'radioListItemController';
        String controllerIdListItem = 'radioListTileController';
        dynamic itemValue = item.itemValue;
        return _buildSingleSelect(
          context,
          controller,
          item,
          colorScheme,
          controllerIdListItem,
          controllerIdListTile,
          itemValue,
        );
      // 多选列表
      case 5:
        String controllerIdListTile = 'multiSelectListTileController';
        String controllerIdListItem = 'multiSelectListItemController';
        return _buildMutilSelectList(
          context,
          controller,
          item,
          colorScheme,
          controllerIdListItem,
          controllerIdListTile,
        );
      // 单选勾选
      case 6:
        String controllerIdListTile = 'radioCheckListItemController';
        String controllerIdListItem = 'radioCheckListTileController';
        dynamic itemValue = item.itemValue;
        return _buildSingleSelect(
          context,
          controller,
          item,
          colorScheme,
          controllerIdListItem,
          controllerIdListTile,
          itemValue,
        );
      // 多选勾选
      case 7:
        String controllerIdListTile = 'multiSelectCheckListTileController';
        String controllerIdListItem = 'multiSelectCheckListItemController';
        return _buildMutilSelectList(
          context,
          controller,
          item,
          colorScheme,
          controllerIdListItem,
          controllerIdListTile,
        );
      // 系统带入
      case 8:
        return CustomInput(initialValue: item.itemValue, onFieldSubmitted: (String val) {});
      // 附件
      case 9:
        return Container(
          margin: EdgeInsets.symmetric(vertical: AppTheme.margin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () => controller.handleUploadFile(item),
                icon: const Icon(Icons.cloud_upload_outlined),
              ),
              GetBuilder<EngineerRepairController>(
                id: 'uploadController',
                builder: (controller) => item.attachmentName != null
                    ? Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              child: Text(item.attachmentName ?? '', style: TextStyle(color: colorScheme.primary)),
                              onPressed: () => controller.handlePreviewAttachment(context,item),
                            ),
                          ),
                          const CustomSpaceWidthSmall(),
                          GestureDetector(
                            onTap: () => controller.handleDeleteUploadFile(item),
                            child: Icon(Icons.close_outlined, color: AppTheme.errorColor),
                          )
                        ],
                      )
                    : const SizedBox.shrink(),
              ),
            ],
          ),
        );
      // 小数
      case 10:
        return CustomInput(
          initialValue: item.itemValue,
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

  Widget _buildBottomSheetFormItem({
    required BuildContext context,
    required ColorScheme colorScheme,
    required item,
    required String controllerId,
    required void Function()? onPressed,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: GetBuilder<EngineerRepairController>(
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
        IconButton(onPressed: onPressed, icon: Icon(Icons.expand_more_rounded, color: colorScheme.outline, size: 30)),
      ],
    );
  }

  Widget _buildSingleSelect(
    BuildContext context,
    EngineerRepairController controller,
    CheckListFormItemDataModelItemList item,
    ColorScheme colorScheme,
    String controllerIdListItem,
    String controllerIdListTile,
    dynamic itemValue,
  ) {
    return _buildBottomSheetFormItem(
      context: context,
      item: item,
      colorScheme: colorScheme,
      controllerId: controllerIdListTile,
      onPressed: () {
        CustomBottomSheet.show(
          showCancel: false,
          showConfirm: false,
          titleText: item.itemName,
          context: context,
          content: ListView(
            children: item.dataSourceList!
                .asMap()
                .keys
                .map<Widget>(
                  (i) => GetBuilder<EngineerRepairController>(
                    id: controllerIdListItem,
                    builder: (c) => CustomRadioListTile(
                      dense: true,
                      contentPadding: const EdgeInsets.all(0),
                      title: Text(item.dataSourceList?[i] ?? ''),
                      value: item.dataSourceList?[i] ?? '',
                      groupValue: itemValue,
                      onChanged: (val) async {
                        try {
                          itemValue = val;
                          item.itemValue = itemValue;
                          controller.update([controllerIdListItem, controllerIdListTile]);
                          await controller.getFormItemCheckResult(item);
                          UtilGet.back();
                        } catch (e) {
                          UtilLog.error('单选列表', e);
                        }
                      },
                    ),
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }

  Widget _buildMutilSelectList(
    BuildContext context,
    EngineerRepairController controller,
    CheckListFormItemDataModelItemList item,
    ColorScheme colorScheme,
    String controllerIdListItem,
    String controllerIdListTile,
  ) {
    return _buildBottomSheetFormItem(
      context: context,
      controllerId: controllerIdListTile,
      item: item,
      onPressed: () {
        dynamic itemValue = item.itemValue;
        CustomBottomSheet.show(
          titleText: item.itemName,
          context: context,
          onConfirm: () async {
            item.itemValue = itemValue;
            controller.update([controllerIdListTile]);
            await controller.getFormItemCheckResult(item);
            UtilGet.back();
          },
          content: ListView(
            children: item.dataSourceList!
                .asMap()
                .keys
                .map<Widget>(
                  (i) => GetBuilder<EngineerRepairController>(
                    id: controllerIdListItem,
                    builder: (c) => CustomCheckboxListTile(
                      title: Text(item.dataSourceList?[i] ?? ''),
                      value: itemValue?.contains(item.dataSourceList?[i]),
                      onChanged: (val) {
                        List values = Utils.isNullOrBlank((itemValue)) ? [] : itemValue?.split(',');
                        val == true ? values.add(item.dataSourceList?[i]) : values.remove(item.dataSourceList?[i]);
                        itemValue = values.join(',');
                        controller.update([controllerIdListItem]);
                      },
                    ),
                  ),
                )
                .toList(),
          ),
        );
      },
      colorScheme: colorScheme,
    );
  }
}
