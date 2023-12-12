part of '../index.dart';

// 版本检查
Future checkAppVersion() async {
  try {
    Map<String, dynamic> data = {"buildNumber": int.parse(AppStore.to.appInfo.buildNumber ?? '1')};
    dynamic res = await HttpService.to.get(CommonApis.checkAppVersionApi, params: data, showLoading: false);
    VersionInfoModel result = VersionInfoModel.fromJson(res);
    if (result.isUpdate == 1) {
      _showUpdateVersionDialog(
        serverVersionName: result.versionName,
        serverBuildNumber: result.buildNumber,
        fileUrl: result.fileUrl,
        updateDescription: result.updateDescription,
        needForceUpdate: result.needForceUpdate,
      );
      AppStore.to.setterVersionInfo = result;
    }
  } catch (e) {
    UtilLog.error('检查版本', e);
  }
}

// 显示版本更新
_showUpdateVersionDialog({
  String? serverVersionName,
  int? serverBuildNumber,
  String? fileUrl,
  String? updateDescription,
  bool? needForceUpdate,
}) {
  double processing = 0;
  CustomDialog.show(
    barrierDismissible: kDebugMode,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('newVersion'.tr, style: TextStyle(color: AppTheme.warnColor)),
        Text(
          '$serverVersionName ( $serverBuildNumber )',
          style: TextStyle(fontSize: 16, color: Theme.of(Get.context!).colorScheme.outline),
        ),
      ],
    ),
    context: Get.context!,
    height: UtilScreen.height * .25,
    content: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (needForceUpdate == true)
          Text(
            'forceUpdateDesc'.tr,
            style: TextStyle(color: Theme.of(Get.context!).colorScheme.outline),
          ),
        if (needForceUpdate == true) const CustomSpaceHeightSmall(),
        Expanded(
          child: SingleChildScrollView(
            child: CustomBlockWidth(
              child: Text(
                updateDescription ?? '',
                style: TextStyle(color: Theme.of(Get.context!).colorScheme.outline),
              ),
            ),
          ),
        )
      ],
    ),
    actions: [
      Row(
        children: [
          if (needForceUpdate == false)
            Expanded(
              child: CustomOutlinedButton(
                color: Theme.of(Get.context!).colorScheme.outline,
                child: Text('theIgnore'.tr),
                onPressed: () => UtilGet.back(),
              ),
            ),
          if (needForceUpdate == false) const CustomSpaceWidth(),
          Expanded(
            child: StatefulBuilder(
              builder: (context, setState) {
                return CustomBlockWidth(
                  child: CustomFilledButton(
                    onPressed: processing == 0
                        ? () async {
                            FileDownloader fileDownloader = FileDownloader();
                            Response res = await fileDownloader.download(
                              'http://10.16.7.190:9000/$fileUrl',
                              await UtilFile.getTempFileDirectory(TemporaryDirectoryType.file, '$fileUrl'),
                              onReceiveProgress: (double process) {
                                setState(() {
                                  processing = process;
                                });
                              },
                            );
                            if (res.statusCode == 200) {
                              setState(() {
                                processing = 0;
                              });
                              String path = await UtilFile.getTempFileDirectory(
                                TemporaryDirectoryType.file,
                                '$fileUrl',
                              );
                              UtilFile.openFile(path);
                            }
                          }
                        : null,
                    child: processing == 0
                        ? Text('updateNow'.tr)
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Transform.scale(
                                scale: .6,
                                child: CustomCircularProgressIndicator(value: processing),
                              ),
                              const CustomSpaceWidth(),
                              Text('updating'.tr),
                            ],
                          ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    ],
  );
}

// 跳转应用升级
void skipUpdateApplication(String? downloadURL) async {
  try {
    if (downloadURL == null) return;
    Uri url = Uri.parse(downloadURL);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  } catch (e) {
    UtilLog.error('跳转应用升级', e);
  }
}
