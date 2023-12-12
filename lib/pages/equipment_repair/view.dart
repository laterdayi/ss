part of 'index.dart';

class EquipmentRepairPage extends StatefulWidget {
  const EquipmentRepairPage({super.key});

  @override
  State<EquipmentRepairPage> createState() => _EquipmentRepairPageState();
}

class _EquipmentRepairPageState extends State<EquipmentRepairPage> {
  // 接单
  handleTakeOrder(BuildContext context, EquipmentAwaitTakeOrderListModelToBeTakeOverList? item) {
    EquipmentRepairController.to.inputControllerJobNumber.text = UserStore.to.userInfo.user?.userID ?? '';
    CustomBottomSheet.show(
      height: UtilScreen.height * 0.4,
      context: context,
      titleText: RepairOperateType.takeOrder.name.tr,
      content: Form(
        key: EquipmentRepairController.to.formKeyTakeOrder,
        child: CustomInput(
          controller: EquipmentRepairController.to.inputControllerJobNumber,
          autofocus: true,
          decoration: InputDecoration(
            labelText: 'jobNumber'.tr,
            hintText: 'jobNumber'.tr,
          ),
          validator: ValidatorRequired(errText: 'jobNumber'.tr).call,
        ),
      ),
      onConfirm: () => EquipmentRepairController.to.handleSubmitTakeOrder(item: item),
    );
  }

  // 转单
  handleTransferOrder(BuildContext context, EquipmentRepairListModelInRepairList? item) {
    CustomBottomSheet.show(
      context: context,
      titleText: RepairOperateType.transferOrder.name.tr,
      content: GetBuilder<EquipmentRepairController>(
        id: 'takeOrderData',
        builder: (controller) {
          return Column(
            children: [
              CustomListTile(
                title: Text('orderTaker'.tr),
                trailing: CusTomListTileTrailingGroup(
                  contentText: EquipmentRepairController.to.takeOrderData.transferItem?.name,
                ),
                onTap: () {
                  EquipmentRepairController.to.handleGetOrderTaker(item);
                  CustomBottomSheet.show(
                    titleText: 'orderTaker'.tr,
                    context: context,
                    showCancel: false,
                    showConfirm: false,
                    content: GetBuilder<EquipmentRepairController>(
                      id: 'orderTakerList',
                      builder: (controller) {
                        return ListView.builder(
                          itemBuilder: (BuildContext context, int i) {
                            return CustomListTile(
                              title: Text(controller.orderTakerList[i].name ?? ''),
                              trailing: controller.takeOrderData.transferItem?.id == controller.orderTakerList[i].id
                                  ? const CustomCheckedIcon()
                                  : null,
                              onTap: () {
                                controller.handleUpdateTakeOrderData(controller.orderTakerList[i]);
                                UtilGet.back();
                              },
                            );
                          },
                          itemCount: controller.orderTakerList.length,
                        );
                      },
                    ),
                  );
                },
              ),
              const CustomSpaceHeight(),
              CustomListTileRow(
                padding: EdgeInsets.symmetric(horizontal: AppTheme.padding),
                titleText: 'remark'.tr,
                trailing: CusTomListTileTrailingGroup(
                  showTrailing: false,
                  content: CustomInput(
                    size: CustomInputSize.large,
                    controller: EquipmentRepairController.to.inputControllerRemark,
                    textInputAction: TextInputAction.done,
                    maxLines: 3,
                  ),
                ),
              )
            ],
          );
        },
      ),
      onConfirm: () => EquipmentRepairController.to.handleSubmitTransferOrder(item: item),
    ).whenComplete(EquipmentRepairController.to.handleResetTakeOrderData);
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return GetBuilder<EquipmentRepairController>(
      initState: (_) {
        Utils.addPostFrameCallback((_) => EquipmentRepairController.to.refreshController.callRefresh());
      },
      builder: (controller) {
        return CustomScaffold(
          body: CustomRefresh(
            controller: controller.refreshController,
            onRefresh: () => UtilRefresh.onRefresh(controller.refreshController, () {
              controller.handleGetAwaitTakeOrderList();
              controller.handleGetRepairList();
            }),
            child: ListView(
              children: [
                const CustomSpaceHeightSmall(),
                // -------------------------------------------------------------------------------------------- > 待接单
                GetBuilder<EquipmentRepairController>(
                  id: 'awaitTakeOrderList',
                  builder: (controller) {
                    return _planListTileWidget(
                      title: 'awaitTakeOrder'.tr,
                      total: controller.awaitTakeOrderList.toBeTakeOverNumber,
                      color: AppTheme.errorColor,
                      children: controller.awaitTakeOrderList.toBeTakeOverNumber != null
                          ? controller.awaitTakeOrderList.toBeTakeOverList!
                              .map<Widget>(
                                (item) => _planItemCardWidget(
                                  colorScheme: colorScheme,
                                  item: item,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('${'callOrderNumbr'.tr}: ${item?.flowNo}'),
                                      Text('${'productionLineName'.tr}: ${item?.line}'),
                                      Text('${'equipmentNumber'.tr}: ${item?.eqpId}'),
                                      Text('${'exceptionType'.tr}: ${item?.flowType}'),
                                      Text('${'callType'.tr}: ${item?.callType}'),
                                      Text('${'caller'.tr}: ${item?.creator}'),
                                      Text('${'callTime'.tr}: ${item?.createTime}'),
                                      const CustomSpaceHeightSmall(),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          CustomOutlinedButton(
                                            onPressed: () => handleTakeOrder(context, item),
                                            size: CustomButtonSize.small,
                                            child: Text('takeOrder'.tr),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                              .toList()
                          : _emptyWidget,
                    );
                  },
                ),
                const CustomSpaceHeight(),
                GetBuilder<EquipmentRepairController>(
                  id: 'repairList',
                  builder: (controller) {
                    return ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        // -------------------------------------------------------------------------------------------- > 待维修
                        _planListTileWidget(
                          title: 'awaitRepair'.tr,
                          total: controller.repairList.inRepairNumber,
                          color: AppTheme.errorColor,
                          children: Utils.isNotNullOrBlank(controller.repairList.inRepairList)
                              ? controller.repairList.inRepairList!
                                  .map<Widget>(
                                    (item) => _planItemCardWidget(
                                      colorScheme: colorScheme,
                                      item: item,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('${'callOrderNumbr'.tr}: ${item?.flowNo}'),
                                          Text('${'productionLineName'.tr}: ${item?.line}'),
                                          Text('${'equipmentNumber'.tr}: ${item?.eqpId}'),
                                          Text('${'exceptionType'.tr}: ${item?.flowType}'),
                                          Text('${'callType'.tr}: ${item?.callType}'),
                                          Text('${'caller'.tr}: ${item?.creator}'),
                                          Text('${'callTime'.tr}: ${item?.createTime}'),
                                          const CustomSpaceHeightSmall(),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              CustomOutlinedButton(
                                                onPressed: () => handleTransferOrder(context, item),
                                                size: CustomButtonSize.small,
                                                child: Text('transferOrder'.tr),
                                              ),
                                              const CustomSpaceWidthSmall(),
                                              CustomOutlinedButton(
                                                onPressed: () {
                                                  Map arguments = {"id": item!.id, "eqpId": item.eqpId};
                                                  UtilGet.toNamed(Routes.engineerRepair, arguments: arguments);
                                                },
                                                size: CustomButtonSize.small,
                                                child: Text('engineerRepair'.tr),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                  .toList()
                              : _emptyWidget,
                        ),
                        const CustomSpaceHeight(),
                        //  -------------------------------------------------------------------------------------------- > 检查中
                        _planListTileWidget(
                          title: 'inInspection'.tr,
                          total: controller.repairList.inCheckNumber,
                          color: colorScheme.primary,
                          children: Utils.isNotNullOrBlank(controller.repairList.inCheckList)
                              ? controller.repairList.inCheckList!
                                  .map<Widget>(
                                    (item) => _planItemCardWidget(
                                      colorScheme: colorScheme,
                                      item: item,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('${'callOrderNumbr'.tr}: ${item?.flowNo}'),
                                          Text('${'productionLineName'.tr}: ${item?.line}'),
                                          Text('${'equipmentNumber'.tr}: ${item?.eqpId}'),
                                          Text('${'exceptionType'.tr}: ${item?.flowType}'),
                                          Text('${'callType'.tr}: ${item?.callType}'),
                                          Text('${'caller'.tr}: ${item?.creator}'),
                                          Text('${'callTime'.tr}: ${item?.createTime}'),
                                        ],
                                      ),
                                    ),
                                  )
                                  .toList()
                              : _emptyWidget,
                        ),
                        const CustomSpaceHeight(),
                        // -------------------------------------------------------------------------------------------- > 已完成
                        _planListTileWidget(
                          title: 'completed'.tr,
                          total: controller.repairList.completedNumber,
                          color: AppTheme.successColor,
                          children: Utils.isNotNullOrBlank(controller.repairList.completedList)
                              ? controller.repairList.completedList!
                                  .map<Widget>(
                                    (item) => _planItemCardWidget(
                                      colorScheme: colorScheme,
                                      item: item,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('${'callOrderNumbr'.tr}: ${item?.flowNo}'),
                                          Text('${'productionLineName'.tr}: ${item?.line}'),
                                          Text('${'equipmentNumber'.tr}: ${item?.eqpId}'),
                                          Text('${'exceptionType'.tr}: ${item?.flowType}'),
                                          Text('${'callType'.tr}: ${item?.callType}'),
                                          Text('${'caller'.tr}: ${item?.creator}'),
                                          Text('${'callTime'.tr}: ${item?.createTime}'),
                                        ],
                                      ),
                                    ),
                                  )
                                  .toList()
                              : _emptyWidget,
                        ),
                        const CustomSpaceHeightSmall()
                      ],
                    );
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }

  final List<Widget> _emptyWidget = const [CustomEmpty(size: CustomEmptySize.small), CustomSpaceHeight()];

  Widget _planListTileWidget({
    required String? title,
    required int? total,
    required Color color,
    required List<Widget> children,
  }) {
    return CustomCard(
      child: CustomExpansionTile(
        textColor: color,
        iconColor: color,
        borderColor: color,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('$title '),
            Text('${total ?? ''}', style: TextStyle(color: color)),
          ],
        ),
        children: children,
      ),
    );
  }

  Widget _planItemCardWidget({
    required ColorScheme colorScheme,
    required item,
    required Widget child,
    IconData? icon,
    Function()? onTap,
  }) {
    return CustomListTile(
      onTap: onTap,
      trailing: icon != null ? Icon(icon, color: colorScheme.outlineVariant, size: kTrailingIconSize) : null,
      subtitle: DefaultTextStyle(
        style: TextStyle(color: colorScheme.outlineVariant),
        child: child,
      ),
    );
  }
}
