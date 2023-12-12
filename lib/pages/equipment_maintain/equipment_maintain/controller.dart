part of 'index.dart';

class EquipmentMaintainController extends GetxController with GetSingleTickerProviderStateMixin {
  static EquipmentMaintainController get to => Get.find();

  // -------------------------------------------------------------------------------------------- > State & Controller
  EasyRefreshController refreshController = EasyRefreshController(controlFinishRefresh: true);

  // 保养计划列表
  EquipmentMaintainPlanListModel maintainPlanList = EquipmentMaintainPlanListModel();

  @override
  void onClose() async {
    refreshController.dispose();
    super.onClose();
  }

  // -------------------------------------------------------------------------------------------- > Action

  // 获取保养计划列表
  Future getMaintainPlanList() async {
    try {
      dynamic res = await HttpService.to.get(EquipmentMaintainApis.getMaintainPlanApi, showLoading: false);
      maintainPlanList = EquipmentMaintainPlanListModel.fromJson(res);
      update();
    } catch (e) {
      UtilLog.error('获取保养计划列表', e);
    }
  }
}
