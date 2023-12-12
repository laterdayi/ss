part of 'index.dart';

class EquipmentMaintainScanExecutePage extends StatefulWidget {
  const EquipmentMaintainScanExecutePage({super.key});

  @override
  State<EquipmentMaintainScanExecutePage> createState() => _EquipmentMaintainScanExecutePageState();
}

class _EquipmentMaintainScanExecutePageState extends State<EquipmentMaintainScanExecutePage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(title: Text('scanCodeExecute'.tr)),
      body: GetBuilder<EquipmentMaintainScanExecuteController>(
        builder: (controller) => controller.maintainPlanDetail.id != null
            ? ListView(
                children: [
                  const CustomSpaceHeight(),
                  CustomCard(
                    child: Column(
                      children: [
                        CustomListTile(
                          title:
                              Text('${controller.maintainPlanDetail.eqpName} - ${controller.maintainPlanDetail.line}'),
                        ),
                        CustomListTile(
                          title: Text('planName'.tr),
                          trailing: Text(controller.maintainPlanDetail.scheduleName ?? ''),
                        ),
                        CustomListTile(
                          title: Text('planTime'.tr),
                          trailing: Text('${controller.maintainPlanDetail.planHours}'),
                        ),
                        CustomListTile(
                          title: Text('planExecuteTime'.tr),
                          trailing: Text(controller.maintainPlanDetail.planExecuteTime ?? ''),
                        ),
                      ],
                    ),
                  ),
                  const CustomSpaceHeight(),
                  CustomCard(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          onPressed: null,
                          child: Column(
                            children: [
                              const Icon(Icons.image_outlined),
                              const CustomSpaceHeightSmall(),
                              Text('maintenanceSpare'.tr)
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: controller.maintainPlanDetail.guideFile != null
                              ? () => controller.handlePreviewGuideFile(context)
                              : null,
                          child: Column(
                            children: [
                              Icon(controller.fileIcon),
                              const CustomSpaceHeightSmall(),
                              Text('guideBook'.tr),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const CustomSpaceHeight(),
                  CustomFilledButton(
                    onPressed: () {
                      Map arguments = {
                        "id": controller.maintainPlanDetail.id,
                        'entry': EntryiesCheckList.equipmentMaintainScanExecute.name,
                        "eqpName": controller.maintainPlanDetail.eqpName
                      };
                      UtilGet.toNamed(Routes.checkList, arguments: arguments);
                    },
                    child: Text('scanCodeExecute'.tr),
                  )
                ],
              )
            : const CustomEmpty(),
      ),
    );
  }
}
