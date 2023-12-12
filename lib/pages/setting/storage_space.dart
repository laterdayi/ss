import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pms_mobile/constants/enum.dart';
import 'package:pms_mobile/utils/index.dart';
import 'package:pms_mobile/widgets/index.dart';

class SettingStorageSpacePage extends StatefulWidget {
  const SettingStorageSpacePage({super.key});

  @override
  State<SettingStorageSpacePage> createState() => _SettingStorageSpacePageState();
}

class _SettingStorageSpacePageState extends State<SettingStorageSpacePage> {
  String fileSpaceSize = '';
  String imgSpaceSize = '';
  String avSpaceSize = '';

  @override
  void initState() {
    super.initState();
    handleGetCacheSize();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(title: Text('storageSpace'.tr)),
      body: ListView(
        children: [
          const CustomSpaceHeightSmall(),
          _listItem(
            context: context,
            title: 'fileStorage'.tr,
            description: 'fileStorageDesc'.tr,
            spaceSize: fileSpaceSize,
            onPressed: () => handleClearFileCache('file'),
          ),
          const CustomSpaceHeight(),
          _listItem(
            context: context,
            title: 'imgStorage'.tr,
            description: 'imgStorageDesc'.tr,
            spaceSize: imgSpaceSize,
            onPressed: () => handleClearFileCache('img'),
          ),
          const CustomSpaceHeight(),
          _listItem(
            context: context,
            title: 'avStorage'.tr,
            description: 'avStorageDesc'.tr,
            spaceSize: avSpaceSize,
            onPressed: () => handleClearFileCache('av'),
          ),
          const CustomSpaceHeightSmall(),
        ],
      ),
    );
  }

  // 获取分类缓存
  void handleGetCacheSize() async {
    Directory tempDir = await getTemporaryDirectory();
    double fileSpace = await UtilFile.getStorageSize(Directory('${tempDir.path}/${TemporaryDirectoryType.file.name}'));
    double imgSpace = await UtilFile.getStorageSize(Directory('${tempDir.path}/${TemporaryDirectoryType.img.name}'));
    double avSpace = await UtilFile.getStorageSize(Directory('${tempDir.path}/${TemporaryDirectoryType.av.name}'));
    setState(() {
      fileSpaceSize = UtilFile.normalizeFileSize(fileSpace);
      imgSpaceSize = UtilFile.normalizeFileSize(imgSpace);
      avSpaceSize = UtilFile.normalizeFileSize(avSpace);
    });
  }

// 清理缓存
  Future handleClearFileCache(String subPath) async {
    CustomToast.showLoading();
    Directory tempDir = await getTemporaryDirectory();
    await UtilFile.clearStorage(Directory('${tempDir.path}/$subPath'));
    handleGetCacheSize();
    CustomToast.closeAllLoading();
  }

  Widget _listItem({
    required BuildContext context,
    required String title,
    required String description,
    required String spaceSize,
    void Function()? onPressed,
  }) {
    return CustomCard(
      padding: const EdgeInsets.all(0),
      child: CustomListTile(
        title: Text(title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomSpaceHeightSmall(),
            Text(spaceSize, style: Theme.of(context).textTheme.headlineLarge),
            const CustomSpaceHeightSmall(),
            Text(description),
          ],
        ),
        trailing: spaceSize != '0.0B' ? CustomFilledButton(onPressed: onPressed, child: Text('clear'.tr)) : const Nil(),
      ),
    );
  }
}
