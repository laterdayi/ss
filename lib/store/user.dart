part of 'index.dart';

class UserStore extends GetxController {
  // -------------------------------------------------------------------------------------------- > State & Controller
  static UserStore get to => Get.find();

  UserModel _userInfo = UserModel();

  // 用户数据
  UserModel get userInfo => _userInfo;

  // 是否登录
  bool get isLogged => _userInfo.user?.id != null;

  @override
  void onInit() {
    String? userInfo = StorageService.to.getString(kStorageUserInfo);
    if (userInfo != null) {
      _userInfo = UserModel.fromJson(json.decode(userInfo));
    }
    super.onInit();
  }

  // -------------------------------------------------------------------------------------------- > Action

  // 获取用户信息
  Future<void> getUserInfo() async {
    try {
      dynamic res = await HttpService.to.get(UserApis.getUserInfoApi, showLoading: false);
      _userInfo.user = UserModel.fromJson(res).user;
      await StorageService.to.setString(kStorageUserInfo, json.encode(_userInfo.toJson()));
      update();
    } catch (e) {
      UtilLog.error('获取用户信息', e);
    }
  }

  // 更新用户数据
  void handleUpdateUserInfo(UserModel userInfo) {
    _userInfo = userInfo;
    update();
  }

  // 退出登录
  void logout(context) {
    CustomDialog.show(
      context: context,
      content: Text('confirmExit'.tr),
      onConfirm: handleLogout,
    );
  }

  // 退出操作
  Future<void> handleLogout() async {
    try {
      await StorageService.to.remove(kStorageUserInfo);
      String? userID = _userInfo.user?.userID;
      _userInfo = UserModel(user: UserModelUser.fromJson({"userID": userID}));
      await StorageService.to.setString(kStorageUserInfo, json.encode(_userInfo.toJson()));
      relogin(showText: false);
    } catch (e) {
      UtilLog.error('退出操作', e);
    }
  }

  // 重新登录
  relogin({showText = true}) {
    if (showText) {
      CustomToast.showNotificationError(title: 'logonFailur'.tr);
    }
    UtilGet.offAllNamed(Routes.login);
  }
}
