import 'package:pms_mobile/service/http/constants.dart';

class EquipmentRepairApis {
  // 获取待接单列表
  static String getAwaitTakeOrderListApi = "${kApiPrefix.ams}/Call/GetMoblieToBeTakeOverList";
  // 获取维修列表
  static String getRepairListApi = "${kApiPrefix.ams}/Call/GetMoblieCallList";
  // 校验工号
  static String verifyJobNumberApi = "${kApiPrefix.config}/User/CheckUser";
  // 接单
  static String takeOrderApi = "${kApiPrefix.ams}/Call/TakeOverCall";
  // 获取表单信息
  static String getFormInfoApi = "${kApiPrefix.ams}/Repair/GetEFormInfo";
  // 保存检查表列表
  static String saveFormItemListApi = "${kApiPrefix.pms}/Repair/SaveRepairHandlerForm";
  // 获取检查表列表详情
  static String getFormItemDetailApi = "${kApiPrefix.pms}/Repair/GetEFormHis";
  // 设备接收
  static String equipmentReceiveApi = "${kApiPrefix.pms}/Repair/SaveEqpReceiveForm";
  // 获取接单人
  static String getOrderTakerApi = "${kApiPrefix.config}/UserGroup/GetNotifyUsersByFlowType";
  // 转单
  static String transferOrderApi = "${kApiPrefix.ams}/Call/TransferCall";
}
