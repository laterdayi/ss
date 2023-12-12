part of 'index.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Scaffold(
        drawer: const DrawerPage(),
        appBar: AppBar(
          title: const Text('SEMI AMS'),
          bottom: controller.tabController != null
              ? TabBar(
                  controller: controller.tabController,
                  tabs: controller.menu.map((e) => Tab(text: '${e.name}'.tr)).toList(),
                )
              : null,
        ),
        body: controller.tabController != null
            ? TabBarView(controller: controller.tabController, children: controller.buildTabBarView())
            : CustomRefresh(
                onRefresh: () => UtilRefresh.onRefresh(controller.refreshController, controller.getMenu),
                controller: controller.refreshController,
                child: SingleChildScrollView(
                  child: SizedBox(
                    height: UtilScreen.height,
                    child: const CustomEmpty(),
                  ),
                ),
              ),
      ),
    );
  }
}
