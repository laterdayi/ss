import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pms_mobile/pages/home/index.dart';
import 'package:pms_mobile/pages/setting/about.dart';
import 'package:pms_mobile/pages/setting/appearance.dart';
import 'package:pms_mobile/pages/setting/language.dart';
import 'package:pms_mobile/pages/setting/storage_space.dart';
import 'package:pms_mobile/store/index.dart';
import 'package:pms_mobile/theme.dart';
import 'package:pms_mobile/utils/index.dart';
import 'package:pms_mobile/widgets/index.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => CustomScaffold(
        appBar: CustomAppBar(title: Text('setting'.tr)),
        body: ListView(
          children: [
            const CustomSpaceHeightSmall(),
            CustomCard(
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  const SettingLanguagePage(),
                  const SettingAppearancePage(),
                  settingItem(
                    icon: Icons.sd_storage_outlined,
                    title: 'storageSpace'.tr,
                    trailing: const CusTomListTileTrailingGroup(),
                    onTap: () => UtilGet.to(() => const SettingStorageSpacePage()),
                  ),
                  settingItem(
                    icon: Icons.info_outline,
                    title: 'about'.tr,
                    trailing: GetBuilder<AppStore>(
                      builder: (controller) {
                        return CusTomListTileTrailingGroup(
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(controller.appInfo.version ?? ''),
                              if (controller.versionInfo.isUpdate == 1) const CustomSpaceWidthSmall(),
                              if (controller.versionInfo.isUpdate == 1)
                                Icon(Icons.circle, size: 12, color: AppTheme.errorColor)
                            ],
                          ),
                        );
                      },
                    ),
                    onTap: () => UtilGet.to(() => const SettingAboutPage()),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget settingItem(
      {required String title, required IconData icon, Widget? trailing, String? subtitle, void Function()? onTap}) {
    return CustomListTile(
      onTap: onTap,
      leading: Icon(icon),
      title: Text(title),
      trailing: trailing,
      subtitle: subtitle != null ? Text(subtitle) : null,
    );
  }
}
