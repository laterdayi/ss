part of 'index.dart';

class EquipmentSpotCheckPage extends StatefulWidget {
  const EquipmentSpotCheckPage({super.key});

  @override
  State<EquipmentSpotCheckPage> createState() => _EquipmentSpotCheckPageState();
}

class _EquipmentSpotCheckPageState extends State<EquipmentSpotCheckPage> {
  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return GetBuilder<EquipmentSpotCheckController>(
      initState: (_) {
        Utils.addPostFrameCallback((_) => EquipmentSpotCheckController.to.refreshController.callRefresh());
      },
      builder: (controller) {
        return CustomScaffold(
          body: CustomRefresh(
            controller: controller.refreshController,
            onRefresh: () => UtilRefresh.onRefresh(controller.refreshController, controller.getSpotCheckList),
            child: ListView(
              children: [
                const CustomSpaceHeightSmall(),
                // -------------------------------------------------------------------------------------------- > 待签到
                _planListTileWidget(
                  title: 'awaitSignIn'.tr,
                  total: controller.spotCheckList.toBeSpotCheckNumber,
                  color: AppTheme.errorColor,
                  children: Utils.isNotNullOrBlank(controller.spotCheckList.toBeSpotCheckList)
                      ? controller.spotCheckList.toBeSpotCheckList!
                          .map<Widget>(
                            (item) => _planItemCardWidget(
                              colorScheme: colorScheme,
                              item: item,
                              iconSize: 24,
                              icon: Icons.qr_code_scanner,
                              onTap: () {
                                Map arguments = {"id": item!.id, "eqpName": item.eqpName};
                                UtilGet.toNamed(Routes.equipmentSpotCheckSignIn, arguments: arguments);
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('${'productionLineName'.tr}: ${item?.line}'),
                                  Text('${'planSpotCheckTime'.tr}: ${item?.planExecuteTime}'),
                                  Text('${'earliestSpotCheckTime'.tr}: ${item?.earliestTime}'),
                                  Text('${'latestSpotCheckTime'.tr}: ${item?.latestTime}'),
                                ],
                              ),
                            ),
                          )
                          .toList()
                      : _emptyWidget,
                ),
                const CustomSpaceHeight(),
                // -------------------------------------------------------------------------------------------- > 已签到
                _planListTileWidget(
                  title: 'signedIn'.tr,
                  total: controller.spotCheckList.checkInNumber,
                  color: colorScheme.primary,
                  children: Utils.isNotNullOrBlank(controller.spotCheckList.checkInList)
                      ? controller.spotCheckList.checkInList!
                          .map<Widget>(
                            (item) => _planItemCardWidget(
                              colorScheme: colorScheme,
                              item: item,
                              onTap: () {
                                Map arguments = {"id": item!.id, 'entry': EntryiesCheckList.equipmentSpotCheck.name};
                                UtilGet.toNamed(Routes.checkList, arguments: arguments);
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('${'productionLineName'.tr}: ${item?.line}'),
                                  Text('${'planSpotCheckTime'.tr}: ${item?.planExecuteTime}'),
                                  Text('${'earliestSpotCheckTime'.tr}: ${item?.earliestTime}'),
                                  Text('${'latestSpotCheckTime'.tr}: ${item?.latestTime}'),
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
                  total: controller.spotCheckList.completedSpotCheckNumber,
                  color: AppTheme.successColor,
                  children: Utils.isNotNullOrBlank(controller.spotCheckList.completedSpotCheckList)
                      ? controller.spotCheckList.completedSpotCheckList!
                          .map<Widget>(
                            (item) => _planItemCardWidget(
                              colorScheme: colorScheme,
                              item: item,
                              onTap: () {
                                Map arguments = {
                                  "id": item!.id,
                                  "editMode": false,
                                  'entry': EntryiesCheckListDetail.equipmentSpotCheck.name
                                };
                                UtilGet.toNamed(Routes.checkListDetail, arguments: arguments);
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('${'productionLineName'.tr}: ${item?.line}'),
                                  Text('${'spotCheckExecuteTime'.tr}: ${item?.actualExecuteTime}'),
                                  Text('${'planSpotCheckTime'.tr}: ${item?.planExecuteTime}'),
                                  Text('${'earliestSpotCheckTime'.tr}: ${item?.earliestTime}'),
                                  Text('${'latestSpotCheckTime'.tr}: ${item?.latestTime}'),
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
      title: Text('${item?.eqpName} - ${item?.planName}'),
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
