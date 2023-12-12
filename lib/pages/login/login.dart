import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart' hide Response, FormData;
import 'package:pms_mobile/apis/user.dart';
import 'package:pms_mobile/model/user/user_model.dart';
import 'package:pms_mobile/routes/constants.dart';
import 'package:pms_mobile/service/index.dart';
import 'package:pms_mobile/service/storage/constants.dart';
import 'package:pms_mobile/store/index.dart';
import 'package:pms_mobile/utils/index.dart';
import 'package:pms_mobile/widgets/index.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController inputControllerAccount = TextEditingController();
  // 密码
  String _psw = '';
  // 表单key
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // 调试配置
  String debugPsw = '';
  int clickCount = 0;

  @override
  void initState() {
    super.initState();
    String? account = UserStore.to.userInfo.user?.userID;
    if (account != null) {
      inputControllerAccount.text = account;
    }
    Get.put(NotificationService());
  }

  // 登录
  _login() async {
    try {
      if (formKey.currentState!.validate()) {
        formKey.currentState!.save();
        Utils.cancelFocus(context);
        Map data = {'username': inputControllerAccount.text.trim(), 'password': _psw.trim()};
        Map<String, dynamic> res = await HttpService.to.post(UserApis.loginApi, data: data);
        await StorageService.to.setString(kStorageUserInfo, json.encode(res));
        UserStore.to.handleUpdateUserInfo(UserModel.fromJson(res));
        UtilGet.offAllNamed(Routes.home);
      }
    } catch (e) {
      UtilLog.error('登录', e);
    }
  }

  // 打开调试弹窗
  void handleOpenDebugDialog() {
    setState(() {
      clickCount++;
      if (clickCount == 3) CustomToast.showText('再点三下进入调试配置');
      if (clickCount == 6) {
        CustomDialog.show(
          context: context,
          title: const Text('调试配置'),
          content: CustomInput(
            autofocus: true,
            obscureText: true,
            decoration: const InputDecoration(
              label: Text('密码'),
            ),
            onFieldSubmitted: (val) => debugPsw = val,
          ),
          onConfirm: () {
            if (debugPsw == 'semi') {
              UtilGet.toNamed(Routes.debug);
            } else {
              CustomToast.showNotificationError(title:'密码错误');
            }
          },
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark,
      child: CustomScaffold(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        body: SingleChildScrollView(
          child: SizedBox(
            height: UtilScreen.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(onTap: handleOpenDebugDialog, child: Image.asset('assets/images/logo.png', height: 72)),
                const CustomSpaceHeight(size: CustomSpaceSize.huge),
                Form(
                  key: formKey,
                  child: Column(
                    children: <Widget>[
                      _input(
                        'account'.tr,
                        Icons.account_circle_outlined,
                        obscureText: false,
                        controller: inputControllerAccount,
                        autofocus: inputControllerAccount.text.isEmpty,
                      ),
                      const CustomSpaceHeight(),
                      _input(
                        'psw'.tr,
                        Icons.password_outlined,
                        obscureText: true,
                        autofocus: inputControllerAccount.text.isNotEmpty,
                        onChanged: (val) {
                          setState(() {
                            _psw = val;
                          });
                        },
                      ),
                      const CustomSpaceHeight(),
                      CustomBlockWidth(child: CustomFilledButton(onPressed: _login, child: Text('login'.tr))),
                    ],
                  ),
                ),
                const CustomSpaceHeight(size: CustomSpaceSize.huge),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _input(
    String label,
    IconData icon, {
    TextEditingController? controller,
    bool autofocus = false,
    required bool obscureText,
    void Function(String)? onChanged,
  }) {
    return CustomInput(
      autofocus: autofocus,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        label: Text(label),
        prefixIcon: Icon(icon),
      ),
      validator: ValidatorRequired(errText: label).call,
      onChanged: onChanged,
    );
  }
}
