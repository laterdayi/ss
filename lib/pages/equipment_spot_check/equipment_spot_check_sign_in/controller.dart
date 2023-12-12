part of 'index.dart';

class EquipmentSpotCheckSignInController extends GetxController with GetSingleTickerProviderStateMixin {
  // -------------------------------------------------------------------------------------------- > State & Controller
  static EquipmentSpotCheckSignInController get to => Get.find();

  String id = Get.arguments['id'];
  String eqpName = Get.arguments['eqpName'];
  MobileScannerController cameraController = MobileScannerController();

  @override
  void onClose() async {
    cameraController.dispose();
    super.onClose();
  }

  // -------------------------------------------------------------------------------------------- > Action
  // 扫描成功
  Future handleScanSuccess(BuildContext context) async {
    await cameraController.stop();
    if (context.mounted) {
      CustomDialog.show(
        context: context,
        content: Text('${'equipmentName'.tr} $eqpName'),
        confirm: TextButton(onPressed: signIn, child: Text('goToSignIn'.tr)),
        onCancel: () async {
          await cameraController.start();
          UtilGet.back();
        },
      );
    }
  }

  // 扫描失败
  Future handleScanError(BuildContext context) async {
    await cameraController.stop();
    if (context.mounted) {
      CustomDialog.show(
        context: context,
        content: Text('signInCodeError'.tr),
        onCancel: () async {
          await cameraController.start();
          UtilGet.back();
        },
        onConfirm: () async {
          await cameraController.start();
          UtilGet.back();
        },
      );
    }
  }

  // 签到
  Future signIn() async {
    try {
      await HttpService.to.post(EquipmentSpotCheckApis.signInApi, data: {"id": id});
      CustomToast.showText('signInSuccess'.tr);
      UtilGet.close(2);
      Get.find<EquipmentSpotCheckController>().refreshController.callRefresh();
    } catch (e) {
      CustomToast.showText('signInError'.tr);
      UtilLog.error('签到', e);
    }
  }
}
