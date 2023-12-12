import 'package:get/get.dart';

Transition kRouteTransition = Transition.cupertino;

abstract class Routes {
  Routes._();

  // 登录
  static const login = '/login';
  // 首页
  static const home = '/home';
  // 检查表
  static const checkList = '/checkList';
  // 检查表详情
  static const checkListDetail = '/checkListDetail';

  // -------------------------------------------------------------------------------------------- > 设备点检
  static const equipmentSpotCheckSignIn = '/equipmentSpotCheckSignIn';

  // -------------------------------------------------------------------------------------------- > 设备维修
  // 维修确认
  static const equipmentRepairConfirm = '/equipmentRepairConfirm';
  // 工程师维修
  static const engineerRepair = '/engineerRepair';

  // -------------------------------------------------------------------------------------------- > 设备保养
  // 扫码执行
  static const equipmentMaintainScanExecute = '/equipmentMaintainScanExecute';

  // -------------------------------------------------------------------------------------------- > 发起呼叫
  static const sendCall = '/sendCall';

  // -------------------------------------------------------------------------------------------- >
  // Debug
  static const debug = '/debug';
  // 个人中心
  static const personalCenter = '/personalCenter';
  // 设置
  static const setting = '/setting';
  // 设置 - 储存空间
  static const settingStorageSpace = '/settingStorageSpace';
  // 关于
  static const about = '/about';
}
