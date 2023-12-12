import 'package:pms_mobile/service/http/constants.dart';

class EquipmentSpotCheckApis {
  // 获取点检列表
  static String getSpotCheckListApi = "${kApiPrefix.pms}/Mobile/GetUserSpotCheck";

  // 扫描签到
  static String signInApi = "${kApiPrefix.pms}/Mobile/SpotCheckSignIn";

  // 获取表单信息
  static String getFormInfoApi = "${kApiPrefix.pms}/Mobile/GetSpotCheckEFormInfo";
  // 保存检查表列表
  static String saveFormItemListApi = "${kApiPrefix.pms}/Mobile/SaveSpotCheckHandlerForm";
  // 获取检查表列表详情
  static String getFormItemDetailApi = "${kApiPrefix.pms}/SpotCheckRecord/GetSpotCheckHistory";
}
