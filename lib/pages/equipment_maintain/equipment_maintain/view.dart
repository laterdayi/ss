part of 'index.dart';

class EquipmentMaintainPage extends StatefulWidget {
  const EquipmentMaintainPage({super.key});

  @override
  State<EquipmentMaintainPage> createState() => _EquipmentMaintainPageState();
}

class _EquipmentMaintainPageState extends State<EquipmentMaintainPage> {
  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return GetBuilder<EquipmentMaintainController>(
      initState: (_) {
        Utils.addPostFrameCallback((_) => EquipmentMaintainController.to.refreshController.callRefresh());
      },
      builder: (controller) {
        return CustomScaffold(
          body: CustomRefresh(
            controller: controller.refreshController,
            onRefresh: () => UtilRefresh.onRefresh(controller.refreshController, controller.getMaintainPlanList),
            child: ListView(
              children: [
                const CustomSpaceHeightSmall(),
                // -------------------------------------------------------------------------------------------- > 待执行
                _planListTileWidget(
                  title: 'awaitExecute'.tr,
                  total: controller.maintainPlanList.toBePMNumber,
                  color: AppTheme.errorColor,
                  children: Utils.isNotNullOrBlank(controller.maintainPlanList.toBePMList)
                      ? controller.maintainPlanList.toBePMList!
                          .map<Widget>(
                            (item) => _planItemCardWidget(
                              colorScheme: colorScheme,
                              item: item,
                              iconSize: 24,
                              onTap: () {
                                UtilGet.toNamed(Routes.equipmentMaintainScanExecute, arguments: item?.id);
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('${'productionLineName'.tr}: ${item?.line}'),
                                  Text('${'planExecuteTime'.tr}: ${item?.planExecuteTime}'),
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
                  total: controller.maintainPlanList.completedPMNumber,
                  color: AppTheme.successColor,
                  children: Utils.isNotNullOrBlank(controller.maintainPlanList.completedPMList)
                      ? controller.maintainPlanList.completedPMList!
                          .map<Widget>(
                            (item) => _planItemCardWidget(
                              colorScheme: colorScheme,
                              item: item,
                              onTap: () {
                                Map arguments = {
                                  "id": item?.pmeFormId,
                                  "entry": EntryiesCheckListDetail.equipmentMaintainScanExecute.name
                                };
                                UtilGet.toNamed(Routes.checkListDetail, arguments: arguments);
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('${'productionLineName'.tr}: ${item?.line}'),
                                  Text('${'planExecuteTime'.tr}: ${item?.planExecuteTime}'),
                                ],
                              ),
                            ),
                          )
                          .toList()
                      : _emptyWidget,
                ),
                const CustomSpaceHeightSmall()
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
    double? iconSize,
    IconData? icon,
    required ColorScheme colorScheme,
    required item,
    required Function() onTap,
    required Widget child,
  }) {
    return CustomListTile(
      title: Text('${item?.eqpName} - ${item?.scheduleName}'),
      onTap: onTap,
      trailing: icon != null
          ? Icon(icon, color: colorScheme.outlineVariant, size: iconSize ?? kTrailingIconSize)
          : const CustomTrailingIcon(),
      subtitle: DefaultTextStyle(
        style: TextStyle(color: colorScheme.outlineVariant),
        child: child,
      ),
    );
  }
}
