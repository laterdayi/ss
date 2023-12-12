part of 'index.dart';

enum RepairCompleteType {
  temporaryStorage(1),
  repairComplete(2);

  final int val;
  const RepairCompleteType(this.val);
}

class EngineerRepairController extends GetxController with GetSingleTickerProviderStateMixin {
  // -------------------------------------------------------------------------------------------- > State & Controller

  static EngineerRepairController get to => Get.find();
  // 呼叫详情
  CallDetailModel callDetailData = CallDetailModel();
  // Lot Info
  LotInfoModel lotInfoData = LotInfoModel();
  // 故障类型
  List<FaultTypeListModel> faultTypeList = [];
  // 当前故障类型
  String currentFaultTypeId = '';
  // 表单基础信息
  FormBasicDataModel formBasicData = FormBasicDataModel();
  // 表单项数据
  CheckListFormItemDataModel formItemData = CheckListFormItemDataModel();
  // 故障描述
  TextEditingController inputControllerFaultDescription = TextEditingController();
  // 故障原因
  TextEditingController inputControllerFaultReason = TextEditingController();
  // 改进措施
  TextEditingController inputControllerImprovementMeasure = TextEditingController();
  // 复机条件
  List<String> selectRecoveryCondition = [];
  // 复机条件列表
  List<OptionsModel> recoveryConditionList = [];
  PdfControllerPinch? pdfController;
  String? fileType;
  IconData? fileIcon;
  String get previewFilePath => '$kOssUrl${formBasicData.sop!}';
  String? pdfPreviewFilePath;
  // 暂存数据
  TemporaryStorageDataModel temporaryStorageData = TemporaryStorageDataModel();
  bool get hasTemporaryStorageData => callDetailData.stageFlag == 1;

  @override
  void onInit() async {
    super.onInit();
    handleGetCallDetail();
    handleGetLotInfoApi();
    handleGetFaultType();
    handleGetRecoveryConditionList();
  }

  // -------------------------------------------------------------------------------------------- > Action

  // 清除暂存数据
  Future handleClearTemporaryStorageData() async {
    try {
      Map<String, dynamic> data = {'callEFormId': formBasicData.eFormId, "callId": Get.arguments['id']};
      await HttpService.to.post(EngineerRepairApis.clearTemporaryStorageDataApi, data: data);
      Get.back();
      EquipmentRepairController.to.refreshController.callRefresh();
    } catch (e) {
      UtilLog.error('清除暂存数据', e);
    }
  }

  // 获取暂存数据
  Future handleGetTemporaryStorageData() async {
    try {
      Map<String, dynamic> params = {'callId': Get.arguments['id']};
      dynamic res = await HttpService.to.get(EngineerRepairApis.getTemporaryStorageDataApi, params: params);
      temporaryStorageData = TemporaryStorageDataModel.fromJson(res);
      currentFaultTypeId = temporaryStorageData.faultName ?? '';
      inputControllerFaultDescription.text = temporaryStorageData.faultDescription ?? '';
      inputControllerFaultReason.text = temporaryStorageData.faultReason ?? '';
      inputControllerImprovementMeasure.text = temporaryStorageData.improveMeasure ?? '';
      selectRecoveryCondition = temporaryStorageData.recoveryConditions ?? [];
      if (temporaryStorageData.itemList?.isNotEmpty == true) {
        formItemData.itemList = temporaryStorageData.itemList;
      } else {
        handleGetFormItemData();
      }
      update();
    } catch (e) {
      UtilLog.error('获取暂存数据', e);
    }
  }

  // 上传文件
  void handleUploadFile(CheckListFormItemDataModelItemList item) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      if (result != null) {
        File file = File(result.files.single.path!);
        final formData = FormData.fromMap({
          "file": await MultipartFile.fromFile(file.path),
        });
        String res = await HttpService.to.post(CommonApis.uploadFileApi, data: formData);
        String fileName = result.files.single.name;
        item.attachmentFile = res;
        item.attachmentName = fileName;
        item.itemValue = fileName;
        item.result = OpenState.open.val;
        update(['uploadController']);
      }
    } catch (e) {
      UtilLog.error('上传文件', e);
    }
  }

  // 取消上传
  void handleDeleteUploadFile(CheckListFormItemDataModelItemList item) {
    item.attachmentFile = null;
    item.attachmentName = null;
    item.result = OpenState.close.val;
    item.itemValue = '';
    update(['uploadController']);
  }

  // 获取呼叫详情
  Future handleGetCallDetail() async {
    try {
      Map<String, dynamic> params = {'id': Get.arguments['id']};
      dynamic res = await HttpService.to.get(EngineerRepairApis.getCallDetailDataApi, params: params);
      callDetailData = CallDetailModel.fromJson(res);
      update();
      if (hasTemporaryStorageData) handleGetTemporaryStorageData();
    } catch (e) {
      UtilLog.error('获取呼叫详情', e);
    }
  }

  // 获取 Lot Info
  Future handleGetLotInfoApi() async {
    try {
      Map<String, dynamic> params = {'eqpId': Get.arguments['eqpId']};
      dynamic res = await HttpService.to.get(EngineerRepairApis.getLotInfoApi, params: params);
      lotInfoData = LotInfoModel.fromJson(res);
      update();
    } catch (e) {
      UtilLog.error('获取Lot Info', e);
    }
  }

  // 获取故障类型
  Future handleGetFaultType() async {
    try {
      Map<String, dynamic> params = {"eqpId": Get.arguments['eqpId']};
      dynamic res = await HttpService.to.get(EngineerRepairApis.getFaultTypeListApi, params: params);
      faultTypeList = res.map<FaultTypeListModel>((e) => FaultTypeListModel.fromJson(e)).toList();
      update();
    } catch (e) {
      UtilLog.error('获取故障类型', e);
    }
  }

  // 切换故障类型
  Future<void> handleSwitchFaultType(String val) async {
    try {
      currentFaultTypeId = val;
      await handleSubmitGetFormBasicData();
      formBasicData.eFormId != null ? handleGetFormItemData() : formItemData = CheckListFormItemDataModel();
      inputControllerFaultDescription.text = formBasicData.faultDescription ?? '';
      update();
    } catch (e) {
      UtilLog.error('获取指导书 & 表单信息', e);
    }
  }

  // 获取基础信息
  Future<void> handleSubmitGetFormBasicData() async {
    try {
      Map<String, dynamic> params = {"eqpType": callDetailData.eqpType, 'faultName': currentFaultTypeId};
      Map<String, dynamic> res = await HttpService.to.get(EngineerRepairApis.getFormBasicDataApi, params: params);
      formBasicData = FormBasicDataModel.fromJson(res);
      if (formBasicData.sop != null) {
        fileIcon = null;
        fileType = null;
        final fileTypeRes = UtilFile.getFileType(fileName: formBasicData.sopName!);
        fileType = fileTypeRes.type;
        fileIcon = fileTypeRes.icon;
        update();
      }
    } catch (e) {
      UtilLog.error('获取表单', e);
    }
  }

  // 获取表单列表
  Future<void> handleGetFormItemData() async {
    try {
      Map<String, dynamic> data = {
        "formId": hasTemporaryStorageData ? temporaryStorageData.eFormId : formBasicData.eFormId
      };
      Map<String, dynamic> res = await HttpService.to.post(EngineerRepairApis.getFormItemListApi, data: data);
      formItemData = CheckListFormItemDataModel.fromJson(res);
      update();
    } catch (e) {
      UtilLog.error('获取表单信息', e);
    }
  }

  // 获取校验结果
  Future<void> getFormItemCheckResult(CheckListFormItemDataModelItemList item) async {
    try {
      Map<String, dynamic> data = {"itemId": item.id, "itemValue": item.itemValue};
      Map<String, dynamic> res = await HttpService.to.get(CheckListApis.getFormItemCheckResultApi, params: data);
      CheckListCheckResultModel result = CheckListCheckResultModel.fromJson(res);
      item.result = result.result;
      if (result.result == 0) {
        CustomToast.showNotificationError(title: '${item.itemName}${'validateFail'.tr}');
      }
    } catch (e) {
      UtilLog.error('获取校验结果', e);
    }
  }

  // 获取复机条件列表
  Future handleGetRecoveryConditionList() async {
    try {
      dynamic res = await HttpService.to.get(EngineerRepairApis.getRecoveryConditionListApi);
      recoveryConditionList = res.map<OptionsModel>((e) => OptionsModel.fromJson(e)).toList();
    } catch (e) {
      UtilLog.error('获取复机条件', e);
    }
  }

  // 更新选中复机条件
  void handleUpdateSelectRecoveryCondition(bool val, String field) {
    val ? selectRecoveryCondition.add(field) : selectRecoveryCondition.remove(field);
    update();
  }

  // 提交维修完成 & 暂存
  Future handleSubmitRepairComplete(int type) async {
    try {
      bool checkPass =
          type == RepairCompleteType.temporaryStorage.val ? _checkTemporaryStorageFormItemList() : _checkFormItemList();
      if (checkPass) {
        Map<String, dynamic> data = {
          "id": Get.arguments['id'],
          "faultName": currentFaultTypeId,
          "eFormId": hasTemporaryStorageData ? temporaryStorageData.eFormId : formBasicData.eFormId,
          "eFormItemList": formItemData.itemList,
          "faultDescription": inputControllerFaultDescription.text,
          "faultReason": inputControllerFaultReason.text,
          "improveMeasure": inputControllerImprovementMeasure.text,
          "recoveryConditions": selectRecoveryCondition,
          "completeFlag": type,
          "prefix": hasTemporaryStorageData ? temporaryStorageData.prefix : formBasicData.prefix
        };
        if (hasTemporaryStorageData) data['callEFormHistoryId'] = callDetailData.callEFormHistoryId;
        await HttpService.to.post(EngineerRepairApis.submitRepairCompleteApi, data: data);
        Get.back();
        EquipmentRepairController.to.refreshController.callRefresh();
      }
    } catch (e) {
      UtilLog.error('提交维修完成', e);
    }
  }

  // 校验表单项
  bool _checkFormItemList() {
    bool isOk = true;
    String msg = '';
    if (currentFaultTypeId.isEmpty) {
      CustomToast.showNotificationError(title: 'faultType'.tr + 'notEmpty'.tr);
      return false;
    }
    if (inputControllerFaultDescription.text.isEmpty) {
      CustomToast.showNotificationError(title: 'faultDescription'.tr + 'notEmpty'.tr);
      return false;
    }
    if (formItemData.itemList != null) {
      for (int i = 0; i < formItemData.itemList!.length; i++) {
        final item = formItemData.itemList?[i];
        if (Utils.isNullOrBlank(item?.itemValue)) {
          msg += '${msg.isNotEmpty ? '\n' : ''}${item?.itemName} ${'notEmpty'.tr}';
          isOk = false;
        }
        if (item?.result == 0 && item?.dataType != 9) {
          msg += '${msg.isNotEmpty ? '\n' : ''}${item?.itemName}${'validateFail'.tr}';
          isOk = false;
        }
      }
      if (msg != '') {
        CustomToast.showNotificationError(title: msg);
      }
    }
    return isOk;
  }

  // 校验暂存表单项
  bool _checkTemporaryStorageFormItemList() {
    bool isOk = true;
    String msg = '';
    if (formItemData.itemList != null) {
      for (int i = 0; i < formItemData.itemList!.length; i++) {
        final item = formItemData.itemList?[i];
        if (item?.dataType == 3) continue;
        if (item?.itemValue.isNotEmpty && item?.result == 0) {
          msg += '${msg.isNotEmpty ? '\n' : ''}${item?.itemName}${'validateFail'.tr}';
          isOk = false;
        }
      }
      if (msg != '') {
        CustomToast.showNotificationError(title: msg);
      }
    }
    return isOk;
  }

  // -------------------------------------------------------------------------------------------- > 预览

  // 预览附件
  void handlePreviewAttachment(BuildContext context, CheckListFormItemDataModelItemList item) {
    if (item.attachmentName?.isEmpty == true) return;
    final fileType = UtilFile.getFileType(fileName: item.attachmentFile!);
    UtilFile.openDocument(
      context: context,
      fileType: fileType.type,
      fileName: item.attachmentFile!,
      fileUrl: '$kOssUrl${item.attachmentFile}',
    );
  }

  void handlePreviewGuideFile(
    BuildContext context,
  ) {
    final handlers = {
      "img": handleOpenDocument,
      'video': handleOpenDocument,
      'pdf': handlePreviewPDF,
      'svg': handlePreviewSVG,
      'document': handleOpenDocument,
    };
    if (handlers[fileType] != null) {
      handlers[fileType]!(context);
    } else {
      handleOpenDocument(context);
    }
  }

  void handleOpenDocument(BuildContext context) async {
    UtilFile.openDocument(
      context: context,
      fileType: fileType ?? '',
      fileName: formBasicData.sop!,
      fileUrl: previewFilePath,
    );
  }

  void handlePreviewSVG(BuildContext context) {
    CustomDialog.show(
      showConfirm: false,
      title: Text('preview'.tr),
      width: UtilScreen.width * 0.8,
      height: UtilScreen.height * 0.4,
      context: context,
      content: SvgPicture.network(
        previewFilePath,
        placeholderBuilder: (BuildContext context) => const Center(child: CustomCircularProgressIndicator()),
      ),
    );
  }

  Future createFileOfPdfUrl() async {
    try {
      FileDownloader fileDownloader = FileDownloader();
      Response res = await fileDownloader.download(
        previewFilePath,
        await UtilFile.getTempFileDirectory(TemporaryDirectoryType.file, '${formBasicData.sop}'),
      );
      if (res.statusCode == 200) {
        String path = await UtilFile.getTempFileDirectory(TemporaryDirectoryType.file, '${formBasicData.sop}');
        pdfPreviewFilePath = path;
        pdfController = PdfControllerPinch(document: PdfDocument.openFile(pdfPreviewFilePath ?? ''));
        update(['pdfController']);
      }
    } catch (e) {
      UtilLog.error('创建 PDF 文件', e);
    }
  }

  void handlePreviewPDF(BuildContext context) async {
    try {
      createFileOfPdfUrl();
      if (context.mounted) {
        CustomDialog.show(
          showConfirm: false,
          title: Text('preview'.tr),
          width: UtilScreen.width * 0.8,
          height: UtilScreen.height * 0.4,
          context: context,
          content: GetBuilder<EngineerRepairController>(
            id: 'pdfController',
            builder: (controller) => controller.pdfController != null
                ? PdfViewPinch(
                    controller: pdfController!,
                  )
                : const Center(child: CustomCircularProgressIndicator()),
          ),
        ).whenComplete(() {
          UtilLog.info('dispose ->pdfController');
          pdfController?.dispose();
          pdfController = null;
        });
      }
    } catch (e) {
      UtilLog.error('handlePreviewPDF', e);
    }
  }
}
