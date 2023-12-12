part of 'index.dart';

class EquipmentSpotCheckController extends GetxController with GetSingleTickerProviderStateMixin {
  // -------------------------------------------------------------------------------------------- > State & Controller
  static EquipmentSpotCheckController get to => Get.find();
  EasyRefreshController refreshController = EasyRefreshController(controlFinishRefresh: true);
  // 点检列表
  EquipmentSpotCheckListModel spotCheckList = EquipmentSpotCheckListModel();

  @override
  void onClose() async {
    refreshController.dispose();
    super.onClose();
  }

  // -------------------------------------------------------------------------------------------- > Action
  // 获取点检列表
  Future getSpotCheckList() async {
    try {
      dynamic res = await HttpService.to.get(EquipmentSpotCheckApis.getSpotCheckListApi, showLoading: false);
      spotCheckList = EquipmentSpotCheckListModel.fromJson(res);
      update();
    } catch (e) {
      UtilLog.error('获取点检列表', e);
    }
  }
}
