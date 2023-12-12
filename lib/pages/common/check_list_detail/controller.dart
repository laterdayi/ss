part of 'index.dart';

enum EntryiesCheckListDetail {
  equipmentSpotCheck('equipmentSpotCheck'),
  equipmentRepairQCConfirm('equipmentRepairQCConfirm'),
  equipmentRepairComplate('equipmentRepairComplate'),
  equipmentMaintainScanExecute('equipmentMaintainScanExecute');

  final String name;
  const EntryiesCheckListDetail(this.name);
}

class CheckListDetailController extends GetxController {
  // -------------------------------------------------------------------------------------------- > State & Controller
  String? entry = Get.arguments['entry'];
  // 表单详情
  CheckListFormItemDetailModel formItemDetailData = CheckListFormItemDetailModel();
  // 动态参数
  late EntryiesData entryParams;

  Map<String, EntryiesData> entryies = {
    EntryiesCheckListDetail.equipmentSpotCheck.name: EntryiesData(
      getFormItemDetailApi: EquipmentSpotCheckApis.getFormItemDetailApi,
      nestField: 'eformHistory',
    ),
    EntryiesCheckListDetail.equipmentRepairQCConfirm.name: EntryiesData(
      getFormItemDetailApi: EquipmentRepairApis.getFormItemDetailApi,
      idField: 'formId',
      child: [
        CustomStackBottom(
          child: CustomFilledButton(
            onPressed: () => Get.find<EquipmentRepairController>().handleEquipmentReceive(Get.arguments['id']),
            child: Text('equipmentReceive'.tr),
          ),
        )
      ],
    ),
    EntryiesCheckListDetail.equipmentRepairComplate.name: EntryiesData(
      getFormItemDetailApi: EquipmentRepairApis.getFormItemDetailApi,
      idField: 'formId',
    ),
    EntryiesCheckListDetail.equipmentMaintainScanExecute.name: EntryiesData(
      getFormItemDetailApi: EquipmentMaintainApis.getFormItemDetailApi,
    ),
  };

  @override
  void onInit() {
    super.onInit();
    _initEntryParams();
    getFormItemDetail();
  }

  // -------------------------------------------------------------------------------------------- > Action
  // 获取检查表列表详情
  Future<void> getFormItemDetail() async {
    try {
      String entry = Get.arguments['entry'];
      String? nestField = entryies[entry]?.nestField;
      String? idField = entryies[entry]?.idField;
      Map<String, dynamic> params = {"id": Get.arguments[idField ?? 'id']};
      Map<String, dynamic> res = await HttpService.to.get(entryies[entry]!.getFormItemDetailApi, params: params);
      formItemDetailData = CheckListFormItemDetailModel.fromJson(nestField != null ? res[nestField] : res);
      update();
    } catch (e) {
      UtilLog.error('获取表单详情', e);
    }
  }

  // 初始化入口参数
  _initEntryParams() {
    switch (entry) {
      case 'equipmentSpotCheck':
        entryParams = EntryiesData(
          getFormItemDetailApi: EquipmentSpotCheckApis.getFormItemDetailApi,
          nestField: 'eformHistory',
        );
        break;
      case 'equipmentRepairQCConfirm':
        entryParams = EntryiesData(
          getFormItemDetailApi: EquipmentRepairApis.getFormItemDetailApi,
          idField: 'formId',
          child: [
            CustomStackBottom(
              child: CustomFilledButton(
                onPressed: () => Get.find<EquipmentRepairController>().handleEquipmentReceive(Get.arguments['id']),
                child: Text('equipmentReceive'.tr),
              ),
            )
          ],
        );
        break;
      case 'equipmentRepairComplate':
        EntryiesData(
          getFormItemDetailApi: EquipmentRepairApis.getFormItemDetailApi,
          idField: 'formId',
        );
        break;
      case 'equipmentMaintainScanExecute':
        entryParams = EntryiesData(
          getFormItemDetailApi: EquipmentMaintainApis.getMaintainPlanDetailApi,
        );
        break;
    }
  }
}

class EntryiesData {
  String getFormItemDetailApi;
  String? nestField;
  String? idField;
  List<Widget>? child;
  EntryiesData({
    required this.getFormItemDetailApi,
    this.nestField,
    this.child,
    this.idField,
  });
}
