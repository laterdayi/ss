import 'package:pms_mobile/service/http/constants.dart';

class CheckListApis {
  // 获取表单信息
  static String getFormInfoApi = "${kApiPrefix.pms}/Mobile/GetEFormInfo";
  // 获取表单列表信息
  static String getFormItemListApi = '${kApiPrefix.config}/GenerateForm/GetFormItems';
  // 提交检查表列表
  static String submitFormItemListApi = "${kApiPrefix.pms}/PM/SavePMHandlerForm";
  // 获取检查表列表
  static String getFormItemDetailApi = "${kApiPrefix.pms}/PM/GetPMHistory";
  // 获取校验结果
  static String getFormItemCheckResultApi = "${kApiPrefix.config}/GenerateForm/JudgeFormItemResult";
}
