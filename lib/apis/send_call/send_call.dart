import 'package:pms_mobile/service/http/constants.dart';

class SendCallApis {
  // 获取执行状态
  static String getOperateStateApi = "${kApiPrefix.config}/EquipmentBase/CheckCallEqp";
  // 发起呼叫
  static String sendCallApi = "${kApiPrefix.ams}/Call/Call";
  // 获取流程类型
  static String getFlowTypeListApi = '${kApiPrefix.config}/Attributes/GetSelectItemList?type=PMS_FlowType';
  // 获取子流程类型
  static String getSubFlowTypeListApi = '${kApiPrefix.config}/Attributes/GetSelectItemList?type=AMS_FlowType';
  // 校验工号
  static String verifyJobNumberApi = "${kApiPrefix.config}/User/CheckUser";
}
