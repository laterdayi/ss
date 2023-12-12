part of 'index.dart';

class HomeController extends GetxController with GetSingleTickerProviderStateMixin {
  // -------------------------------------------------------------------------------------------- > State & Controller
  static HomeController get to => Get.find();

  EasyRefreshController refreshController = EasyRefreshController(controlFinishRefresh: true);
  List<MenuModel> menu = [];
  TabController? tabController;

  @override
  void onInit() async {
    super.onInit();
    getMenu();
    UserStore.to.getUserInfo();
  }

  @override
  void onClose() async {
    tabController?.dispose();
    super.onClose();
  }

  // -------------------------------------------------------------------------------------------- > Action
  // 获取菜单
  Future<void> getMenu() async {
    try {
      dynamic res = await HttpService.to.get(UserApis.getMenuApi, showLoading: false);
      menu = res.map<MenuModel>((e) => MenuModel.fromJson(e)).toList();
      initTabController();
    } catch (e) {
      UtilLog.error('获取菜单', e);
    }
  }

  // 初始化TabController
  initTabController() {
    tabController = TabController(length: menu.length, vsync: this);
    update();
  }

  // 构建页
  List<Widget> buildTabBarView() {
    List<Widget> pages = [];
    for (var i = 0; i < menu.length; i++) {
      switch (menu[i].name) {
        case 'equipmentSpotCheck':
          pages.add(const EquipmentSpotCheckPage());
          break;
        case 'equipmentRepair':
          pages.add(const EquipmentRepairPage());
          break;
        case 'equipmentMaintain':
          pages.add(const EquipmentMaintainPage());
          break;
        case 'sendCall':
          pages.add(const SendCallPage());
          break;
      }
    }
    return pages;
  }
}
