part of '../index.dart';

class AppStore extends GetxController {
// -------------------------------------------------------------------------------------------- > State & Controller
  static AppStore get to => Get.find();

  // APP 配置
  AppConfigModel _appConfig = AppConfigModel(
    themeMode: EnumThemeMode.system.val,
    language: EnumLanguageMode.system.val,
  );
  AppConfigModel get appConfig => _appConfig;

  // 应用信息
  final AppInfoModel _appInfo = AppInfoModel();
  AppInfoModel get appInfo => _appInfo;

  // 版本信息
  VersionInfoModel _versionInfo = VersionInfoModel();
  VersionInfoModel get versionInfo => _versionInfo;
  set setterVersionInfo(VersionInfoModel value) => _versionInfo = value;

  // Debug 配置
  DebugConfigModel _debugConfig = DebugConfigModel();
  DebugConfigModel get debugConfig => _debugConfig;

  @override
  void onInit() async {
    handleGetAppConfigCache();
    handleGetDebugConfigCache();
    await handleGetPackageInfo();
    super.onInit();
  }

  // -------------------------------------------------------------------------------------------- > Action

  // -------------------------------------------------------------------- > App Congfig
  // 更新语言
  void handleUpdateLanguage(EnumLanguageMode language) {
    appConfig.language = language.val;
    Get.updateLocale(language.mode ?? PlatformDispatcher.instance.locale);
    handleSetAppConfigCache();
    update();
  }

  // 更新主题
  void handleUpdateThemeMode(EnumThemeMode themeMode) {
    appConfig.themeMode = themeMode.val;
    UtilGet.changeThemeMode(themeMode.mode);
    handleSetAppConfigCache();
    update();
  }

  // 获取包信息
  handleGetPackageInfo() async {
    try {
      PackageInfo package = await PackageInfo.fromPlatform();
      _appInfo.buildNumber = package.buildNumber;
      _appInfo.version = package.version;
    } catch (e) {
      UtilLog.error('获取包信息异常', e);
    }
  }

  // 设置 APP Config 缓存
  void handleSetAppConfigCache() => StorageService.to.setString(kStorageAppConfig, json.encode(appConfig));

  // 获取 APP Config 缓存
  void handleGetAppConfigCache() {
    String? cache = StorageService.to.getString(kStorageAppConfig);
    if (cache != null) {
      _appConfig = AppConfigModel.fromJson(json.decode(cache));
    }
  }

  // -------------------------------------------------------------------- > Debug Congfig

  void handleUpdateBaseApi(String? val) => debugConfig.baseApi = val;
  void handleUpdateProxyApi(String? val) => debugConfig.proxyApi = val;

  // 清除 Base Api 缓存
  void handleClearBaseApi() {
    handleUpdateBaseApi(null);
    update();
    handleSetDebugConfigCache();
  }

  // 清除 Proxy Api 缓存
  void handleClearProxyApi() {
    handleUpdateProxyApi(null);
    update();
    handleSetDebugConfigCache();
  }

  // 获取 Debug Config 缓存
  void handleGetDebugConfigCache() {
    String? cache = StorageService.to.getString(kStorageDebugConfig);
    if (cache != null) {
      _debugConfig = DebugConfigModel.fromJson(json.decode(cache));
    }
  }

  // 设置 Debug Config 缓存
  void handleSetDebugConfigCache() {
    StorageService.to.setString(kStorageDebugConfig, json.encode(debugConfig));
    CustomToast.showNotificationSuccess(title: '设置成功');
  }
}
