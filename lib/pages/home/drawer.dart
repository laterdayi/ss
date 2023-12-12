import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pms_mobile/constants/constants.dart';
import 'package:pms_mobile/routes/constants.dart';
import 'package:pms_mobile/store/index.dart';
import 'package:pms_mobile/theme.dart';
import 'package:pms_mobile/utils/index.dart';
import 'package:pms_mobile/widgets/index.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark,
      child: SizedBox(
        width: UtilScreen.width * .7,
        child: NavigationDrawer(
          backgroundColor:
              Utils.isDarkMode(context) ? Theme.of(context).scaffoldBackgroundColor : AppTheme.placeholderColor,
          children: <Widget>[
            GestureDetector(
              onTap: () => UtilGet.toNamed(Routes.personalCenter),
              child: UserAccountsDrawerHeader(
                decoration: const BoxDecoration(),
                currentAccountPicture: Container(
                  alignment: Alignment.centerLeft,
                  child: UserStore.to.userInfo.user?.avatar != null
                      ? Hero(
                          tag: 'avatar',
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.network('$kOssUrl${UserStore.to.userInfo.user?.avatar}')),
                        )
                      : Hero(
                          tag: 'avatar',
                          child: Icon(Icons.account_circle_outlined, size: 40, color: Theme.of(context).primaryColor),
                        ),
                ),
                accountName: Text(
                  UserStore.to.userInfo.user?.userName ?? '',
                  style: TextStyle(color: colorScheme.onSurface),
                ),
                accountEmail: Text(
                  UserStore.to.userInfo.user?.email ?? '',
                  style: TextStyle(color: colorScheme.outline),
                ),
              ),
            ),
            CustomCard(
              color: colorScheme.background,
              padding: const EdgeInsets.all(0),
              margin: EdgeInsets.all(AppTheme.margin),
              child: Column(
                children: [
                  CustomListTile(
                    title: Text('account'.tr),
                    leading: Icon(Icons.person_outline, color: Theme.of(context).primaryColor),
                    onTap: () => UtilGet.toNamed(Routes.personalCenter),
                  ),
                  CustomListTile(
                    title: Text('setting'.tr),
                    leading: Icon(Icons.settings_outlined, color: Theme.of(context).primaryColor),
                    onTap: () => UtilGet.toNamed(Routes.setting),
                  ),
                ],
              ),
            ),
            const CustomSpaceHeight(height: 40),
          ],
        ),
      ),
    );
  }
}
