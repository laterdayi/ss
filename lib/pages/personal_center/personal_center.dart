import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pms_mobile/constants/constants.dart';
import 'package:pms_mobile/pages/home/index.dart';
import 'package:pms_mobile/store/index.dart';
import 'package:pms_mobile/utils/index.dart';
import 'package:pms_mobile/widgets/index.dart';

class PersonalCenterPage extends StatefulWidget {
  const PersonalCenterPage({super.key});

  @override
  State<PersonalCenterPage> createState() => _PersonalCenterPageState();
}

class _PersonalCenterPageState extends State<PersonalCenterPage> {
  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return GetBuilder<HomeController>(
      builder: (controller) => CustomScaffold(
        appBar: CustomAppBar(title: Text('personalCenter'.tr)),
        body: Stack(
          children: [
            ListView(
              children: [
                const CustomSpaceHeightSmall(),
                CustomCard(
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      const CustomSpaceHeight(),
                      UnconstrainedBox(
                        child: UserStore.to.userInfo.user?.avatar != null
                            ? Hero(
                                tag: 'avatar',
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Image.network(
                                    '$kOssUrl${UserStore.to.userInfo.user?.avatar}',
                                    width: 62,
                                    height: 62,
                                  ),
                                ),
                              )
                            : Hero(
                                tag: 'avatar',
                                child: Icon(
                                  Icons.account_circle_outlined,
                                  size: 80,
                                  color: colorScheme.primary,
                                ),
                              ),
                      ),
                      const CustomSpaceHeight(),
                      _item(
                        title: 'account'.tr,
                        icon: Icons.account_circle_outlined,
                        trailing: _trialingGroup(contentText: UserStore.to.userInfo.user?.userID),
                      ),
                      _item(
                        title: 'userName'.tr,
                        icon: Icons.person_outline,
                        trailing: _trialingGroup(contentText: UserStore.to.userInfo.user?.userName),
                      ),
                      _item(
                        title: 'email'.tr,
                        icon: Icons.email_outlined,
                        trailing: _trialingGroup(contentText: UserStore.to.userInfo.user?.email),
                      ),
                      _item(
                        title: 'mobilePhone'.tr,
                        icon: Icons.phone_android_outlined,
                        trailing: _trialingGroup(contentText: UserStore.to.userInfo.user?.mobilePhone),
                      ),
                      _item(
                        title: 'officePhone'.tr,
                        icon: Icons.phone_in_talk_outlined,
                        trailing: _trialingGroup(contentText: UserStore.to.userInfo.user?.officePhone),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            CustomStackBottom(
              child: CustomFilledButton(
                onPressed: () => UserStore.to.logout(context),
                child: Text('logout'.tr),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _trialingGroup({String? contentText}) {
    return CusTomListTileTrailingGroup(
        width: UtilScreen.width * 0.4, contentText: contentText ?? '', showTrailing: false);
  }

  Widget _item({required String title, required IconData icon, Widget? trailing, String? subtitle}) {
    return CustomListTile(
      title: SizedBox(
        width: UtilScreen.width * 0.6,
        child: Row(
          children: [Icon(icon), const CustomSpaceWidthSmall(), Text(title)],
        ),
      ),
      trailing: trailing,
      subtitle: subtitle != null ? Text(subtitle) : null,
    );
  }
}
