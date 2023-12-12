import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pms_mobile/store/index.dart';
import 'package:pms_mobile/widgets/index.dart';

enum EnumThemeMode {
  system('followSystem', 1, ThemeMode.system),
  light('lightTheme', 2, ThemeMode.light),
  dark('darkTheme', 3, ThemeMode.dark);

  final String name;
  final int val;
  final ThemeMode mode;
  const EnumThemeMode(this.name, this.val, this.mode);

  static String getName(int? val) => EnumThemeMode.values.firstWhere((item) => item.val == val).name;
  static ThemeMode getMode(int? val) => EnumThemeMode.values.firstWhere((item) => item.val == val).mode;
}

class SettingAppearancePage extends StatelessWidget {
  const SettingAppearancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppStore>(
      builder: (configStore) {
        return CustomListTile(
          leading: const Icon(Icons.dark_mode_outlined),
          title: Text('appearance'.tr),
          trailing: CusTomListTileTrailingGroup(
            contentText: EnumThemeMode.getName(configStore.appConfig.themeMode).tr,
          ),
          onTap: () {
            CustomBottomSheet.show(
              titleText: 'appearance'.tr,
              context: context,
              showCancel: false,
              showConfirm: false,
              content: GetBuilder<AppStore>(
                builder: (configStore) {
                  return ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      CustomListTile(
                        title: Text(EnumThemeMode.system.name.tr),
                        onTap: () => AppStore.to.handleUpdateThemeMode(EnumThemeMode.system),
                        trailing: _buildTrailing(configStore.appConfig.themeMode, EnumThemeMode.system.val),
                        subtitle: Text('followSystemThemeDesc'.tr),
                      ),
                      CustomListTile(
                        title: Text(EnumThemeMode.light.name.tr),
                        onTap: () => AppStore.to.handleUpdateThemeMode(EnumThemeMode.light),
                        trailing: _buildTrailing(configStore.appConfig.themeMode, EnumThemeMode.light.val),
                      ),
                      CustomListTile(
                        title: Text(EnumThemeMode.dark.name.tr),
                        onTap: () => AppStore.to.handleUpdateThemeMode(EnumThemeMode.dark),
                        trailing: _buildTrailing(configStore.appConfig.themeMode, EnumThemeMode.dark.val),
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

  Widget? _buildTrailing(int themeMode, int val) {
    return themeMode == val ? const CustomCheckedIcon() : null;
  }
}
