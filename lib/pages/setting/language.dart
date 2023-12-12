import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pms_mobile/store/index.dart';
import 'package:pms_mobile/widgets/index.dart';

enum EnumLanguageMode {
  system('followSystem', 1, null),
  cn('cn', 2, Locale('zh', 'CN')),
  en('en', 3, Locale('en', 'US'));

  final String name;
  final int val;
  final Locale? mode;
  const EnumLanguageMode(this.name, this.val, this.mode);

  static String getName(int? val) => EnumLanguageMode.values.firstWhere((item) => item.val == val).name;
  static Locale getMode(int? val) =>
      EnumLanguageMode.values.firstWhere((item) => item.val == val).mode ?? PlatformDispatcher.instance.locale;
}

class SettingLanguagePage extends StatelessWidget {
  const SettingLanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppStore>(
      builder: (configStore) {
        return CustomListTile(
          leading: const Icon(Icons.language_outlined),
          title: Text('language'.tr),
          trailing: CusTomListTileTrailingGroup(
            contentText: EnumLanguageMode.getName(configStore.appConfig.language).tr,
          ),
          onTap: () {
            CustomBottomSheet.show(
              titleText: 'language'.tr,
              context: context,
              showCancel: false,
              showConfirm: false,
              content: GetBuilder<AppStore>(
                builder: (configStore) {
                  return ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      CustomListTile(
                        title: Text(EnumLanguageMode.system.name.tr),
                        onTap: () => AppStore.to.handleUpdateLanguage(EnumLanguageMode.system),
                        trailing: _buildTrailing(configStore.appConfig.language, EnumLanguageMode.system.val),
                        subtitle: Text('followSystemLanguageDesc'.tr),
                      ),
                      CustomListTile(
                        title: Text(EnumLanguageMode.cn.name.tr),
                        onTap: () => AppStore.to.handleUpdateLanguage(EnumLanguageMode.cn),
                        trailing: _buildTrailing(configStore.appConfig.language, EnumLanguageMode.cn.val),
                      ),
                      CustomListTile(
                        title: Text(EnumLanguageMode.en.name.tr),
                        onTap: () => AppStore.to.handleUpdateLanguage(EnumLanguageMode.en),
                        trailing: _buildTrailing(configStore.appConfig.language, EnumLanguageMode.en.val),
                      ),
                    ],
                  );
                },
              ),
            );
          },
        );
      },
    );
  }

  Widget? _buildTrailing(int language, int val) {
    return language == val ? const CustomCheckedIcon() : null;
  }
}
