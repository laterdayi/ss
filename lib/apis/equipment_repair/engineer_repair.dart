import 'package:pms_mobile/service/http/constants.dart';

class EngineerRepairApis {
  // 接单
  static String takeOrderApi = "${kApiPrefix.ams}/Call/TakeOverCall";
  // 获取呼叫详情
  static String getCallDetailDataApi = "${kApiPrefix.ams}/Call/GetMobileCallDetail";
  // 获取故障类型
  static String getFaultTypeListApi = '${kApiPrefix.ams}/CallFaultConfig/GetFaultNameList';
  // 获取基础信息
  static String getFormBasicDataApi = "${kApiPrefix.ams}/Call/GetMaintenanceInformation";
  // 获取表单列表信息
  static String getFormItemListApi = '${kApiPrefix.config}/GenerateForm/GetFormItems';
  // 获取复机条件列表
  static String getRecoveryConditionListApi =
      '${kApiPrefix.config}/Attributes/GetSelectItemList?type=PMS_RecoveryCondition';
  // 提交维修完成
  static String submitRepairCompleteApi = "${kApiPrefix.ams}/Call/RepairComplete";
  // 获取 Lot info 信息
  static String getLotInfoApi = "${kApiPrefix.ams}/Call/GetEqpLotInfo";
  // 获取暂存数据
  static String getTemporaryStorageDataApi = "${kApiPrefix.ams}/Call/GetRepairStage";
  // 清除暂存数据
  static String clearTemporaryStorageDataApi = "${kApiPrefix.ams}/Call/ClearStageEForm";
}
