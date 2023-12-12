part of 'index.dart';

class EquipmentMaintainScanExecuteController extends GetxController {
  // -------------------------------------------------------------------------------------------- > State & Controller

  MaintainPlanDetailModel maintainPlanDetail = MaintainPlanDetailModel();
  String? fileType = '';
  IconData? fileIcon = Icons.close_rounded;

  @override
  void onInit() async {
    super.onInit();
    getMaintainPlanList();
  }

  // -------------------------------------------------------------------------------------------- > Action
  // 获取保养计划详情
  Future getMaintainPlanList() async {
    try {
      dynamic res =
          await HttpService.to.get(EquipmentMaintainApis.getMaintainPlanDetailApi, params: {"id": Get.arguments});
      maintainPlanDetail = MaintainPlanDetailModel.fromJson(res);
      handleFileType();
      update();
    } catch (e) {
      UtilLog.error('获取保养计划详情', e);
    }
  }

  // -------------------------------------------------------------------------------------------- > 预览

  void handleFileType() {
    if (maintainPlanDetail.guideFile == null) return;
    Map<String, Map<String, dynamic>> handlers = {
      'data:image': {"type": 'img', "icon": Icons.image_outlined},
      'data:video': {"type": 'video', "icon": Icons.movie_outlined},
      'data:application': {"type": 'pdf', "icon": Icons.picture_as_pdf_outlined}
    };
    for (String key in handlers.keys) {
      if (maintainPlanDetail.guideFile!.startsWith(key)) {
        fileType = handlers[key]?['type'];
        fileIcon = handlers[key]?['icon'];
      }
    }
  }

  void handlePreviewGuideFile(BuildContext context) {
    final handlers = {"img": handlePreviewImg, 'pdf': handlePreviewPDF};
    if (handlers[fileType] != null) {
      handlers[fileType]!(context);
    }
  }

  void handlePreviewImg(BuildContext context) {
    CustomDialog.show(
      showConfirm: false,
      title: Text('${maintainPlanDetail.scheduleName} ${'preview'.tr}'),
      width: UtilScreen.width * 0.8,
      height: UtilScreen.height * 0.4,
      context: context,
      content: Image.network('$kOssUrl${maintainPlanDetail.guideFile}'),
    );
  }

  void handlePreviewPDF(BuildContext context) async {
    try {} catch (e) {
      UtilLog.error('handlePreviewPDF', e);
    }
  }
}
