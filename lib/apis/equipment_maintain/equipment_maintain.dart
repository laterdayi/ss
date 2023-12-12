import 'package:pms_mobile/service/http/constants.dart';

class EquipmentMaintainApis {
  // 获取保养计划列表
  static String getMaintainPlanApi = "${kApiPrefix.pms}/Mobile/GetUserPM";
  // 获取保养计划详情信息
  static String getMaintainPlanDetailApi = "${kApiPrefix.pms}/Mobile/GetUserPMDetail";
  // 获取表单信息
  static String getFormInfoApi = "${kApiPrefix.pms}/Mobile/GetEFormInfo";
  // 获取表单列表信息
  static String getFormItemListApi = '${kApiPrefix.config}/GenerateForm/GetFormItems';
  // 保存检查表列表
  static String saveFormItemListApi = "${kApiPrefix.pms}/PM/SavePMHandlerForm";
  // 获取检查表列表
  static String getFormItemDetailApi = "${kApiPrefix.pms}/PM/GetPMHistory";
}
