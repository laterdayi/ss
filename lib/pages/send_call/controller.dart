part of 'index.dart';

class SendCallController extends GetxController with GetSingleTickerProviderStateMixin {
  // -------------------------------------------------------------------------------------------- > State & Controller
  static SendCallController get to => Get.find();
  TextEditingController inputControllerJobNumber = TextEditingController();
  TextEditingController inputControllerEqpName = TextEditingController();

  List<SendCallFlowTypeModel> flowTypeList = [];
  List<String> operateList = [];
  String currentOperate = '';
  List<OptionsModel> subFlowTypeList = [];
  String currentSubOperate = '';

  @override
  void onInit() {
    super.onInit();
    String? userID = UserStore.to.userInfo.user?.userID;
    if (userID != null) {
      inputControllerJobNumber.text = userID;
    }
  }

  @override
  void onClose() {
    inputControllerEqpName.dispose();
    inputControllerJobNumber.dispose();
    super.onClose();
  }

  // -------------------------------------------------------------------------------------------- > Action
  // 更新操作
  void handleUpdateCurrentSubOperate(String val) {
    val == currentSubOperate ? currentSubOperate = '' : currentSubOperate = val;
    update();
  }

  // 获取子流程类型
  Future handleGetSubFlowType() async {
    try {
      Map<String, dynamic> params = {'value': currentOperate};
      dynamic res = await HttpService.to.get(SendCallApis.getSubFlowTypeListApi, params: params);
      List<OptionsModel> result = res.map<OptionsModel>((e) => OptionsModel.fromJson(e)).toList();
      subFlowTypeList = result;
      update();
    } catch (e) {
      UtilLog.error('获取子流程类型', e);
    }
  }

  // 获取流程类型
  Future handleGetFlowType(String eqpName) async {
    try {
      Map<String, dynamic> params = {'eqpName': eqpName};
      dynamic res = await HttpService.to.get(SendCallApis.getFlowTypeListApi, params: params, showLoading: false);
      List<SendCallFlowTypeModel> result =
          res.map<SendCallFlowTypeModel>((e) => SendCallFlowTypeModel.fromJson(e)).toList();
      flowTypeList = result;
      update();
    } catch (e) {
      UtilLog.error('获取流程类型', e);
    }
  }

  // 获取操作状态
  Future<void> handleGetOperateState(String eqpName) async {
    try {
      if (eqpName.isEmpty) {
        CustomToast.showNotificationError(title: 'pleaseInput'.tr + 'equipmentNumber'.tr);
        return;
      }
      operateList = [];
      flowTypeList = [];
      subFlowTypeList = [];
      currentOperate = '';
      currentSubOperate = '';
      update();
      Map<String, dynamic> params = {'eqpName': eqpName};
      List<dynamic> res = await HttpService.to.get(SendCallApis.getOperateStateApi, params: params);
      operateList = [...res];
      handleGetFlowType(eqpName);
      update();
    } catch (e) {
      UtilLog.error('获取操作状态', e);
    }
  }

  // 更新操作
  void handleUpdateCurrentOperate(String val) {
    val == currentOperate ? currentOperate = '' : currentOperate = val;
    currentOperate.isNotEmpty ? handleGetSubFlowType() : subFlowTypeList = [];
    update();
  }

  // 发起呼叫
  Future handldSubmitSendCall() async {
    try {
      Map<String, dynamic> params = {'userId': inputControllerJobNumber.text};
      bool isVerifyPassJobNumber = false;
      dynamic res = await HttpService.to.get(SendCallApis.verifyJobNumberApi, params: params);
      isVerifyPassJobNumber = (res == kResponseSuccess);
      if (isVerifyPassJobNumber) {
        Map<String, dynamic> data = {
          'flowType': currentOperate,
          'eqpName': inputControllerEqpName.text,
          'userId': inputControllerJobNumber.text
        };
        if (currentSubOperate.isNotEmpty) data.addAll({"callType": currentSubOperate});
        await HttpService.to.post(SendCallApis.sendCallApi, data: data);
        reset();
      }
    } catch (e) {
      UtilLog.error('获取操作状态', e);
    }
  }

  void reset() {
    operateList = [];
    inputControllerEqpName.clear();
    handleUpdateCurrentOperate('');
    handleUpdateCurrentSubOperate('');
    update();
  }
}
