part of 'index.dart';

enum EntryiesCheckList {
  equipmentSpotCheck('equipmentSpotCheck'),
  equipmentRepairQCConfirm('equipmentRepairQCConfirm'),
  equipmentRepairRepairConfirm('equipmentRepairRepairConfirm'),
  equipmentMaintainScanExecute('equipmentMaintainScanExecute');

  final String name;
  const EntryiesCheckList(this.name);
}

enum RepairOperateType {
  takeOver('接手', 1),
  handOver('转手', 2),
  qcConfirm('QC确认', 4),
  repairConfirm('维修确认', 8);

  const RepairOperateType(this.name, this.value);
  final String name;
  final int value;
}

class CheckListController extends GetxController {
  // -------------------------------------------------------------------------------------------- > State & Controller
  static CheckListController get to => Get.find();

  late TextEditingController? inputControllerRootCause;
  late TextEditingController? inputControllerRepairMeasure;
  late TextEditingController? inputControllerParamsModify;
  late TextEditingController? inputControllerSpareReplace;

  String? entry = Get.arguments['entry'];
  // 表单信息
  CheckListFormInfoModel formInfoData = CheckListFormInfoModel();
  // 表单项数据
  CheckListFormItemDataModel formItemData = CheckListFormItemDataModel();
  // 表单 - 维修确认
  late final GlobalKey<FormState> formKeyRepairConfirm;
  // 动态参数
  late EntryiesData entryParams;

  @override
  void onInit() {
    super.onInit();
    if (entry == EntryiesCheckList.equipmentRepairRepairConfirm.name) {
      inputControllerRootCause = TextEditingController();
      inputControllerRepairMeasure = TextEditingController();
      inputControllerParamsModify = TextEditingController();
      inputControllerSpareReplace = TextEditingController();
      formKeyRepairConfirm = GlobalKey<FormState>();
    }
    _initEntryParams();
    getFormInfoData();
  }

  @override
  void onClose() {
    if (entry == EntryiesCheckList.equipmentRepairRepairConfirm.name) {
      inputControllerRootCause?.dispose();
      inputControllerRepairMeasure?.dispose();
      inputControllerParamsModify?.dispose();
      inputControllerSpareReplace?.dispose();
    }
    super.onClose();
  }

  // -------------------------------------------------------------------------------------------- > Action
  // 初始化入口参数
  _initEntryParams() {
    switch (entry) {
      case 'equipmentSpotCheck':
        entryParams = EntryiesData(
          getFormInfoApi: EquipmentSpotCheckApis.getFormInfoApi,
          saveFormItemListApi: EquipmentSpotCheckApis.saveFormItemListApi,
          onSaveFinish: () {
            UtilGet.close(1);
            Get.find<EquipmentSpotCheckController>().refreshController.callRefresh();
          },
        );
        break;
      case 'equipmentRepairQCConfirm':
        entryParams = EntryiesData(
          getFormInfoApi: EquipmentRepairApis.getFormInfoApi,
          getFormInfoParams: {"eFormType": RepairOperateType.qcConfirm.value},
          saveFormItemListApi: EquipmentRepairApis.saveFormItemListApi,
          saveFormItemListParams: () => {"repairHandleType": RepairOperateType.qcConfirm.value},
          onSaveFinish: () {
            UtilGet.close(1);
            Get.find<EquipmentRepairController>().refreshController.callRefresh();
          },
        );
        break;
      case 'equipmentRepairRepairConfirm':
        entryParams = EntryiesData(
          beforeChild: [const EquipmentRepairConfirmPage()],
          getFormInfoApi: EquipmentRepairApis.getFormInfoApi,
          getFormInfoParams: {"eFormType": RepairOperateType.repairConfirm.value},
          saveFormItemListApi: EquipmentRepairApis.saveFormItemListApi,
          saveFormItemListParams: () => {
            "repairHandleType": RepairOperateType.repairConfirm.value,
            "reason": inputControllerRootCause?.text,
            "handleMeasures": inputControllerRepairMeasure?.text,
            "parameterModification": inputControllerParamsModify?.text,
            "sparePartChange": inputControllerSpareReplace?.text,
          },
          onSubmit: () {
            if (formKeyRepairConfirm.currentState!.validate()) {
              formKeyRepairConfirm.currentState!.save();
              saveFormItemList();
            }
          },
          onSaveFinish: () {
            UtilGet.close(1);
            Get.find<EquipmentRepairController>().refreshController.callRefresh();
          },
        );
        break;
      case 'equipmentMaintainScanExecute':
        entryParams = EntryiesData(
          getFormInfoApi: EquipmentMaintainApis.getFormInfoApi,
          saveFormItemListApi: EquipmentMaintainApis.saveFormItemListApi,
          onSaveFinish: () {
            UtilGet.close(2);
            Get.find<EquipmentMaintainController>().refreshController.callRefresh();
          },
        );
        break;
    }
  }

  // 获取表单信息
  Future<void> getFormInfoData() async {
    try {
      Map<String, dynamic> params = {"id": Get.arguments['id'], ...(entryParams.getFormInfoParams ?? {})};
      Map<String, dynamic> res = await HttpService.to.get(entryParams.getFormInfoApi, params: params);
      formInfoData = CheckListFormInfoModel.fromJson(res);
      getFormItemList();
    } catch (e) {
      UtilLog.error('获取表单信息', e);
    }
  }

  // 获取表单项列表
  Future<void> getFormItemList() async {
    try {
      Map<String, dynamic> data = {"formId": formInfoData.eFormId};
      Map<String, dynamic> res = await HttpService.to.post(CheckListApis.getFormItemListApi, data: data);
      formItemData = CheckListFormItemDataModel.fromJson(res);
      update();
    } catch (e) {
      UtilLog.error('获取表单项列表', e);
    }
  }

  // 获取校验结果
  Future<void> getFormItemCheckResult(CheckListFormItemDataModelItemList item) async {
    try {
      Map<String, dynamic> data = {"itemId": item.id, "itemValue": item.itemValue};
      Map<String, dynamic> res = await HttpService.to.get(CheckListApis.getFormItemCheckResultApi, params: data);
      CheckListCheckResultModel result = CheckListCheckResultModel.fromJson(res);
      item.result = result.result;
    } catch (e) {
      UtilLog.error('获取校验结果', e);
    }
  }

  // 保存表单
  Future<void> saveFormItemList() async {
    try {
      if (_checkFormItemList()) {
        Map<String, dynamic> data = {
          "id": Get.arguments['id'],
          "eFormId": formInfoData.eFormId,
          "eFormItemList": formItemData.itemList,
          "prefix": formInfoData.prefix,
          ...(entryParams.saveFormItemListParams() ?? {})
        };
        if (entry == EntryiesCheckList.equipmentMaintainScanExecute.name) {
          data = {
            'pMForms': [data],
            'eqpName': Get.arguments['eqpName'],
          };
        }
        await HttpService.to.post(entryParams.saveFormItemListApi, data: data);
        entryParams.onSaveFinish();
      }
    } catch (e) {
      UtilLog.error('保存表单', e);
    }
  }

  // 校验表单项
  bool _checkFormItemList() {
    bool isOk = true;
    String msg = '';
    for (int i = 0; i < formItemData.itemList!.length; i++) {
      final item = formItemData.itemList?[i];
      if (Utils.isNullOrBlank(item?.itemValue)) {
        msg += '${msg.isNotEmpty ? '\n' : ''}${item?.itemName} 不能为空';
        isOk = false;
      }
    }
    if (msg != '') {
      CustomToast.showText(msg);
    }
    return isOk;
  }
}

class EntryiesData {
  String getFormInfoApi;
  String saveFormItemListApi;
  Function onSaveFinish;
  Map<String, dynamic>? getFormInfoParams;
  dynamic saveFormItemListParams;
  List<Widget>? beforeChild;
  List<Widget>? afterChild;
  Function()? onSubmit;
  EntryiesData({
    required this.getFormInfoApi,
    required this.saveFormItemListApi,
    required this.onSaveFinish,
    this.getFormInfoParams,
    this.saveFormItemListParams,
    this.afterChild,
    this.beforeChild,
    this.onSubmit,
  });
}
