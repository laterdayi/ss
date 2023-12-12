import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:pms_mobile/constants/enum.dart';
import 'package:pms_mobile/service/http/download.dart';
import 'package:pms_mobile/store/index.dart';
import 'package:pms_mobile/utils/index.dart';
import 'package:pms_mobile/widgets/index.dart';

class SettingAboutPage extends StatefulWidget {
  const SettingAboutPage({super.key});

  @override
  State<SettingAboutPage> createState() => _SettingAboutPageState();
}

class _SettingAboutPageState extends State<SettingAboutPage> {
  double processing = 0;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(title: Text('about'.tr)),
      body: GetBuilder<AppStore>(
        builder: (controller) {
          return Column(
            children: [
              const CustomSpaceHeight(size: CustomSpaceSize.huge),
              Image.asset('assets/images/logo.png', height: 60),
              const CustomSpaceHeight(size: CustomSpaceSize.huge),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('V ${controller.appInfo.version ?? ''} ( ${controller.appInfo.buildNumber ?? ''} )'),
                ],
              ),
              if (controller.versionInfo.isUpdate == 0) Text('noNeedUpdateDesc'.tr),
              const Spacer(),
              if (controller.versionInfo.isUpdate == 1)
                CustomBlockWidth(
                  child: CustomFilledButton(
                    onPressed: processing == 0
                        ? () async {
                            FileDownloader fileDownloader = FileDownloader();
                            Response res = await fileDownloader.download(
                              'http://10.16.7.190:9000/${controller.versionInfo.fileUrl}',
                              await UtilFile.getTempFileDirectory(
                                TemporaryDirectoryType.file,
                                '${controller.versionInfo.fileUrl}',
                              ),
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
                                '${controller.versionInfo.fileUrl}',
                              );
                              UtilFile.openFile(path);
                            }
                          }
                        : null,
                    child: processing == 0
                        ? Text('update_now'.tr)
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
                ),
              const CustomSpaceHeightSmall(),
            ],
          );
        },
      ),
    );
  }
}
