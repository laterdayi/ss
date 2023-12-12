part of 'index.dart';

enum RepairOperateType {
  takeOrder('takeOrder', 1),
  transferOrder('transferOrder', 2),
  qcConfirm('qcConfirm', 4),
  repairConfirm('repairConfirm', 8);

  const RepairOperateType(this.name, this.value);
  final String name;
  final int value;
}

class EquipmentRepairController extends GetxController with GetSingleTickerProviderStateMixin {
  // -------------------------------------------------------------------------------------------- > State & Controller
  static EquipmentRepairController get to => Get.find();

  final GlobalKey<FormState> formKeyTakeOrder = GlobalKey<FormState>();
  TextEditingController inputControllerJobNumber = TextEditingController();
  TextEditingController inputControllerRemark = TextEditingController();
  EasyRefreshController refreshController = EasyRefreshController(controlFinishRefresh: true);

  // 待接单列表
  EquipmentAwaitTakeOrderListModel awaitTakeOrderList = EquipmentAwaitTakeOrderListModel();
  // 维修列表
  EquipmentRepairListModel repairList = EquipmentRepairListModel();
  // 接单人
  List<OptionsModel> orderTakerList = [];
  // 接单数据
  TakeOrderDataModel takeOrderData = TakeOrderDataModel();

  late Timer? timer;

  @override
  void onInit() async {
    super.onInit();
    timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      handleGetAwaitTakeOrderList();
    });
  }

  @override
  void onClose() async {
    refreshController.dispose();
    inputControllerJobNumber.dispose();
    timer?.cancel();
    super.onClose();
  }

  // 重置转单数据
  void handleResetTakeOrderData() {
    takeOrderData = TakeOrderDataModel();
    inputControllerRemark.clear();
  }

  // -------------------------------------------------------------------------------------------- > Action

  // 更新接单数据
  void handleUpdateTakeOrderData(OptionsModel item) {
    takeOrderData.transferItem = item;
    update(['takeOrderData']);
  }

  // 获取待接单列表
  Future handleGetAwaitTakeOrderList() async {
    try {
      dynamic res = await HttpService.to.get(EquipmentRepairApis.getAwaitTakeOrderListApi, showLoading: false);
      EquipmentAwaitTakeOrderListModel data = EquipmentAwaitTakeOrderListModel.fromJson(res);
      if (data.toBeTakeOverList!.isNotEmpty) {
        final firstItem = awaitTakeOrderList.toBeTakeOverList?.first;
        String? currentCreateTime = firstItem?.createTime;
        String? newCreateTime = data.toBeTakeOverList?.first?.createTime;
        if (newCreateTime != null && currentCreateTime != null) {
          DateTime currentTime = DateTime.parse(currentCreateTime);
          DateTime newTime = DateTime.parse(newCreateTime);
          if (newTime.isAfter(currentTime)) {
            NotificationService.to.show(
              id: DateTime.now().millisecondsSinceEpoch ~/ 1000,
              androidNotificationDetails: kAndroidDetailsNewMessage,
              title: 'newOrderNotify'.tr,
            );
          }
        }
      }
      awaitTakeOrderList = EquipmentAwaitTakeOrderListModel.fromJson(res);
      update(['awaitTakeOrderList']);
    } catch (e) {
      UtilLog.error('获取待接单列表', e);
    }
  }

  // 设备接收
  Future handleEquipmentReceive(String id) async {
    try {
      Map data = {'id': id};
      await HttpService.to.post(EquipmentRepairApis.equipmentReceiveApi, showLoading: false, data: data);
      UtilGet.back();
      refreshController.callRefresh();
    } catch (e) {
      UtilLog.error('设备接收', e);
    }
  }

  // 接单
  Future handleSubmitTakeOrder({EquipmentAwaitTakeOrderListModelToBeTakeOverList? item}) async {
    try {
      if (EquipmentRepairController.to.formKeyTakeOrder.currentState!.validate()) {
        Map<String, dynamic> params = {'userId': inputControllerJobNumber.text};
        bool isVerifyPassJobNumber = false;
        dynamic res = await HttpService.to.get(EquipmentRepairApis.verifyJobNumberApi, params: params);
        isVerifyPassJobNumber = (res == kResponseSuccess);
        if (isVerifyPassJobNumber) {
          Map data = {
            'id': item?.id,
            'userId': inputControllerJobNumber.text,
            "type": RepairOperateType.takeOrder.value
          };
          await HttpService.to.post(EquipmentRepairApis.takeOrderApi, data: data);
          Get.back();
          if (item?.flowType != 'QC' && item?.callType == 'Down') {
            Map arguments = {"id": item!.id, "eqpId": item.eqpId};
            UtilGet.toNamed(Routes.engineerRepair, arguments: arguments);
          }
          refreshController.callRefresh();
        }
      }
    } catch (e) {
      UtilLog.error('接单', e);
    }
  }

  // 转单
  Future handleSubmitTransferOrder({EquipmentRepairListModelInRepairList? item}) async {
    try {
      if (takeOrderData.transferItem?.id == null) {
        CustomToast.showNotificationError(title: 'orderTaker'.tr + 'notEmpty'.tr);
        return;
      }
      if (inputControllerRemark.text.isEmpty) {
        CustomToast.showNotificationError(title: 'remark'.tr + 'notEmpty'.tr);
        return;
      }
      Map<String, dynamic> data = {
        "id": item?.id,
        "transferee": [takeOrderData.transferItem?.id],
        "flowType": item?.flowType,
        "description": inputControllerRemark.text
      };
      await HttpService.to.post(EquipmentRepairApis.transferOrderApi, data: data);
      Get.back();
      takeOrderData = TakeOrderDataModel();
      inputControllerRemark.clear();
      refreshController.callRefresh();
    } catch (e) {
      UtilLog.error('转单', e);
    }
  }

  // 获取接单人
  Future handleGetOrderTaker(EquipmentRepairListModelInRepairList? item) async {
    try {
      Map<String, dynamic> params = {'flowType': item?.flowType};
      dynamic res = await HttpService.to.get(EquipmentRepairApis.getOrderTakerApi, params: params);
      orderTakerList = res.map<OptionsModel>((e) => OptionsModel.fromJson(e)).toList();
      update(['orderTakerList']);
    } catch (e) {
      UtilLog.error('获取接单人', e);
    }
  }

  // 获取维修列表
  Future handleGetRepairList() async {
    try {
      dynamic res = await HttpService.to.get(EquipmentRepairApis.getRepairListApi, showLoading: false);
      repairList = EquipmentRepairListModel.fromJson(res);
      update(['repairList']);
    } catch (e) {
      UtilLog.error('获取点检列表', e);
    }
  }
}
